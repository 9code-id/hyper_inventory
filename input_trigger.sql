DO $$ DECLARE
  trig record;
BEGIN
  FOR trig IN 
    SELECT trigger_name, event_object_table 
    FROM information_schema.triggers
    WHERE trigger_schema = 'public'  -- Assuming your triggers are in the public schema
  LOOP
    EXECUTE 'DROP TRIGGER IF EXISTS ' || quote_ident(trig.trigger_name) || ' ON ' || quote_ident(trig.event_object_table) || ';';
  END LOOP;
END $$;


CREATE OR REPLACE FUNCTION stock_adjustment()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_TABLE_NAME = 'purchase_transaction_item') THEN
        IF (TG_OP = 'INSERT') THEN
            UPDATE product
            SET stock = stock + NEW.qty
            WHERE id = NEW.product_id;
        ELSIF (TG_OP = 'UPDATE') THEN
            UPDATE product
            SET stock = stock + (NEW.qty - OLD.qty) 
            WHERE id = NEW.product_id;
        ELSIF (TG_OP = 'DELETE') THEN
            UPDATE product
            SET stock = stock - OLD.qty 
            WHERE id = OLD.product_id;
        END IF;
    ELSIF (TG_TABLE_NAME = 'order_transaction_item') THEN
        IF (TG_OP = 'INSERT') THEN
            UPDATE product
            SET stock = stock - NEW.qty
            WHERE id = NEW.product_id;
        ELSIF (TG_OP = 'UPDATE') THEN
            UPDATE product
            SET stock = stock - (NEW.qty - OLD.qty) 
            WHERE id = NEW.product_id;
        ELSIF (TG_OP = 'DELETE') THEN
            UPDATE product
            SET stock = stock + OLD.qty 
            WHERE id = OLD.product_id;
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Modified triggers to handle INSERT, UPDATE, and DELETE
CREATE OR REPLACE TRIGGER stock_adjustment_on_purchase
AFTER INSERT OR UPDATE OR DELETE ON purchase_transaction_item
FOR EACH ROW
EXECUTE FUNCTION stock_adjustment();

CREATE OR REPLACE TRIGGER stock_adjustment_on_order
AFTER INSERT OR UPDATE OR DELETE ON order_transaction_item
FOR EACH ROW
EXECUTE FUNCTION stock_adjustment();

--------------------------------------


CREATE OR REPLACE FUNCTION update_purchase_item_total()
RETURNS TRIGGER AS $$
BEGIN
  -- Calculate total based on qty and purchase_price
  NEW.total := NEW.qty * NEW.purchase_price;
  
-- UPDATE purchase_transaction set total = (select sum(total) from purchase_transaction_item where purchase_transaction_id = NEW.purchase_transaction_id)
--     WHERE id = NEW.purchase_transaction_id;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_purchase_item_total_on_insert_or_update
BEFORE INSERT OR UPDATE ON purchase_transaction_item
FOR EACH ROW
EXECUTE FUNCTION update_purchase_item_total();



-- Function to update total in order_transaction_item
CREATE OR REPLACE FUNCTION update_order_item_total()
RETURNS TRIGGER AS $$
BEGIN
  -- Calculate total based on qty and selling_price
  NEW.total := NEW.qty * NEW.selling_price;

-- UPDATE order_transaction set total = (select sum(total) from order_transaction_item where order_transaction_id = NEW.order_transaction_id)
--     WHERE id = NEW.order_transaction_id;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to execute the function on insert or update
CREATE TRIGGER update_order_item_total_on_insert_or_update
BEFORE INSERT OR UPDATE ON order_transaction_item
FOR EACH ROW
EXECUTE FUNCTION update_order_item_total();



CREATE OR REPLACE FUNCTION adjust_purchase_transaction_total()
RETURNS TRIGGER AS $$
DECLARE
    new_total float;
BEGIN
    -- Hitung total baru berdasarkan item-item dalam purchase_transaction
    SELECT COALESCE(SUM(total), 0) INTO new_total
    FROM purchase_transaction_item
    WHERE purchase_transaction_id = 
        CASE 
            WHEN TG_OP = 'DELETE' THEN OLD.purchase_transaction_id 
            ELSE NEW.purchase_transaction_id 
        END;

    -- Update total di purchase_transaction
    UPDATE purchase_transaction
    SET total = new_total
    WHERE id = 
        CASE 
            WHEN TG_OP = 'DELETE' THEN OLD.purchase_transaction_id 
            ELSE NEW.purchase_transaction_id 
        END;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger untuk INSERT, UPDATE, dan DELETE pada purchase_transaction_item
CREATE TRIGGER adjust_purchase_transaction_total_trigger
AFTER INSERT OR UPDATE OR DELETE ON purchase_transaction_item
FOR EACH ROW
EXECUTE FUNCTION adjust_purchase_transaction_total();



CREATE OR REPLACE FUNCTION adjust_order_transaction_total()
RETURNS TRIGGER AS $$
DECLARE
    new_total float;
BEGIN
    -- Hitung total baru berdasarkan item-item dalam order_transaction
    SELECT COALESCE(SUM(total), 0) INTO new_total
    FROM order_transaction_item
    WHERE order_transaction_id = 
        CASE 
            WHEN TG_OP = 'DELETE' THEN OLD.order_transaction_id 
            ELSE NEW.order_transaction_id 
        END;

    -- Update total di order_transaction
    UPDATE order_transaction
    SET total = new_total
    WHERE id = 
        CASE 
            WHEN TG_OP = 'DELETE' THEN OLD.order_transaction_id 
            ELSE NEW.order_transaction_id 
        END;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger untuk INSERT, UPDATE, dan DELETE pada order_transaction_item
CREATE TRIGGER adjust_order_transaction_total_trigger
AFTER INSERT OR UPDATE OR DELETE ON order_transaction_item
FOR EACH ROW
EXECUTE FUNCTION adjust_order_transaction_total();


-------------------------------
-------------------------------

CREATE OR REPLACE FUNCTION set_created_at()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.created_at IS NULL THEN
        NEW.created_at := CURRENT_TIMESTAMP;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DO $$
DECLARE
    r RECORD;
BEGIN
    -- Loop through all tables that are user-created (excluding system tables)
    FOR r IN
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = 'public' -- Replace with your schema name if different
          AND table_type = 'BASE TABLE'
    LOOP
        -- Check if the table has a 'created_at' column
        IF EXISTS (
            SELECT 1
            FROM information_schema.columns
            WHERE table_schema = 'public'
              AND table_name = r.table_name
              AND column_name = 'created_at'
        ) THEN
            -- Create the trigger for each table with 'created_at' column
            EXECUTE format('
                CREATE TRIGGER before_insert_or_update_%I
                BEFORE INSERT OR UPDATE ON %I
                FOR EACH ROW
                EXECUTE FUNCTION set_created_at();
            ', r.table_name, r.table_name);
        END IF;
    END LOOP;
END $$;

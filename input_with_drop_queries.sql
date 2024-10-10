DO $$ DECLARE
  r RECORD;
BEGIN
  FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') LOOP
    EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE';
  END LOOP;
END $$;

CREATE TABLE user_profile ( 
    id SERIAL PRIMARY KEY, 
    image_url TEXT,
    user_profile_name VARCHAR(100),
    gender VARCHAR(255) CHECK (gender IN ('Male', 'Female')),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    role VARCHAR(255) CHECK (role IN ('Admin', 'User')),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE product_category (
    id SERIAL PRIMARY KEY,
    image_url TEXT,
    product_category_name VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel Produk
CREATE TABLE product (
    id SERIAL PRIMARY KEY, 
    image_url TEXT,
    product_name VARCHAR(255) NOT NULL,
    product_category_id INT REFERENCES product_category(id),
    description TEXT,
    sku VARCHAR(50) UNIQUE NOT NULL,
    qrcode VARCHAR(50) UNIQUE,
    purchase_price FLOAT NOT NULL,
    selling_price FLOAT NOT NULL,
    stock INT NOT NULL DEFAULT 0 ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel Pelanggan
CREATE TABLE customer (
    id SERIAL PRIMARY KEY, 
    image_url TEXT,
    customer_name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel Pelanggan
CREATE TABLE supplier (
    id SERIAL PRIMARY KEY, 
    image_url TEXT,
    supplier_name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE payment_method (
    id SERIAL PRIMARY KEY,
    payment_method_name VARCHAR(255),
    account_name VARCHAR(255),
    account_number VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE purchase_transaction (
    id SERIAL PRIMARY KEY, 
    user_profile_id INT REFERENCES user_profile(id),
    supplier_id INT REFERENCES supplier(id), 
    payment_method_id INT REFERENCES payment_method(id),
    order_status VARCHAR(255) CHECK (order_status IN ('Order created','Order packed','Handed over to driver','In transit','Received','Completed')),
    total FLOAT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE purchase_transaction_item (
    id SERIAL PRIMARY KEY, 
    purchase_transaction_id INT REFERENCES purchase_transaction(id), 
    product_id INT REFERENCES product(id), 
    qty INT NOT NULL,
    purchase_price FLOAT NOT NULL,
    total FLOAT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_transaction (
    id SERIAL PRIMARY KEY, 
    user_profile_id INT REFERENCES user_profile(id),
    customer_id INT REFERENCES customer(id), 
    payment_method_id INT REFERENCES payment_method(id),
    order_status VARCHAR(255) CHECK (order_status IN ('Order created','Order packed','Handed over to driver','In transit','Received','Completed')),
    total FLOAT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_transaction_item (
    id SERIAL PRIMARY KEY, 
    order_transaction_id INT REFERENCES order_transaction(id), 
    product_id INT REFERENCES product(id), 
    qty INT NOT NULL,
    purchase_price FLOAT NOT NULL,
    selling_price FLOAT NOT NULL,
    total FLOAT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE account_category (
    id SERIAL PRIMARY KEY,
    account_category_name VARCHAR(100) UNIQUE,
    account_type VARCHAR(255) CHECK (account_type IN ( 'Asset', 'Liability', 'Equity', 'Revenue', 'Expense')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE account_journal (
    id SERIAL PRIMARY KEY,
    account_category_id INT REFERENCES account_category(id),
    amount FLOAT NOT NULL,
    description TEXT,
    -- Referensi transaksi ini diperuntukkan user yang mana
    -- Dalam jurnal Cash, ini artinya Cash yang dimiliki oleh user ini
    -- Dalam juranl Sales, ini artinya Sales yang dihasilkan oleh user ini
    -- Dalam jurnal Expense, ini artinya Expense yang dikeluarkan oleh user ini
    -- Dalam jurnal Equity, ini artinya Equity yang dimiliki oleh user ini
    -- Dalam jurnal Liability, ini artinya Liability yang dimiliki oleh user ini
    user_profile_id INT REFERENCES user_profile(id),
    -- created_at jika null menggunakan timestamp, namun bisa juga di isi manual?
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*
Balance Sheet
Income Statement
Cash Flow Statement
Statement of Changes in Equity
Notes to financial statements
*/

CREATE TABLE lesson_category (
    id SERIAL PRIMARY KEY,
    lesson_category_name VARCHAR(100) UNIQUE,
    sort_index INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lesson (
    id SERIAL PRIMARY KEY,
    image_url TEXT,
    lesson_category_id INT REFERENCES lesson_category(id),
    lesson_name TEXT,
    description TEXT,
    lesson_type VARCHAR(255) CHECK (lesson_type IN ( 'Video', 'Audio', 'PDF')),
    url TEXT,
    user_profile_id INT REFERENCES user_profile(id),
    sort_index INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lesson_leaderboard (
    id SERIAL PRIMARY KEY,
    user_profile_id INT REFERENCES user_profile(id),
    current_streak INT,
    longest_streak INT,
    total_minutes INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- Tambahkan definisi create table disiini jika ingin mendefinisikan
-- Tabel hanya untuk dev mode


DO $$ DECLARE
  func record;
BEGIN
  FOR func IN 
    SELECT routine_name 
    FROM information_schema.routines
    WHERE routine_schema = 'public' AND routine_type = 'FUNCTION'  
  LOOP
    EXECUTE 'DROP FUNCTION IF EXISTS ' || quote_ident(func.routine_name) || ' CASCADE;';
  END LOOP;
END $$;

CREATE OR REPLACE FUNCTION product_stock_report()
RETURNS TABLE(id int, product_name text, stock int, purchase_count int, order_count int)
LANGUAGE sql
AS $$
    SELECT 
        p.id,
        p.product_name, 
        p.stock, 
        (SELECT COALESCE(SUM(pti.qty), 0) 
         FROM purchase_transaction_item pti
         WHERE pti.product_id = p.id) AS purchase_count,
        (SELECT COALESCE(SUM(oti.qty), 0) 
         FROM order_transaction_item oti
         WHERE oti.product_id = p.id) AS order_count
    FROM product p
    ORDER BY p.product_name;
$$;

CREATE OR REPLACE FUNCTION monthly_report()
RETURNS TABLE (month_name TEXT, purchase INT, sales INT)
LANGUAGE SQL
AS $$
    WITH months AS (
        SELECT to_char(date_trunc('month', now() - interval '1 month' * gs), 'FMMonth') AS month_name,
               date_trunc('month', now() - interval '1 month' * gs) AS month_start,
               EXTRACT(MONTH FROM date_trunc('month', now() - interval '1 month' * gs)) AS month_number
        FROM generate_series(0, 11) AS gs
    ),
    purchases AS (
        SELECT date_trunc('month', created_at) AS month_start,
               SUM(total) AS total_purchase
        FROM purchase_transaction_item
        GROUP BY date_trunc('month', created_at)
    ),
    sales AS (
        SELECT date_trunc('month', created_at) AS month_start,
               SUM(total) AS total_sales
        FROM order_transaction_item
        GROUP BY date_trunc('month', created_at)
    )
    SELECT m.month_name,
           COALESCE(p.total_purchase, 0) AS purchase,
           COALESCE(s.total_sales, 0) AS sales
    FROM months m
    LEFT JOIN purchases p ON m.month_start = p.month_start
    LEFT JOIN sales s ON m.month_start = s.month_start
    ORDER BY m.month_number;
$$;



CREATE OR REPLACE FUNCTION daily_report(start_date DATE, end_date DATE)
RETURNS TABLE (report_date DATE, purchase INT, sales INT)
LANGUAGE SQL
AS $$
    WITH dates AS (
        SELECT generate_series(
            date_trunc('day', start_date),
            date_trunc('day', end_date),
            '1 day'::interval
        ) AS report_date
    ),
    daily_purchases AS (
        SELECT date_trunc('day', created_at) AS report_date,
               SUM(total) AS total_purchase
        FROM purchase_transaction_item
        WHERE created_at BETWEEN start_date AND end_date
        GROUP BY date_trunc('day', created_at)
    ),
    daily_sales AS (
        SELECT date_trunc('day', created_at) AS report_date,
               SUM(total) AS total_sales
        FROM order_transaction_item
        WHERE created_at BETWEEN start_date AND end_date
        GROUP BY date_trunc('day', created_at)
    )
    SELECT d.report_date,
           COALESCE(dp.total_purchase, 0) AS purchase,
           COALESCE(ds.total_sales, 0) AS sales
    FROM dates d
    LEFT JOIN daily_purchases dp ON d.report_date = dp.report_date
    LEFT JOIN daily_sales ds ON d.report_date = ds.report_date
    ORDER BY d.report_date;
$$;

--------------------------------------

DROP FUNCTION IF exists generate_dummies;
CREATE OR REPLACE FUNCTION generate_dummies()
RETURNS void
LANGUAGE sql
AS $$
    INSERT INTO account_category (id, account_category_name, account_type) VALUES
    (1001, 'Cash', 'Asset'),
    (1002, 'Bank', 'Asset'),
    (1003, 'Inventory', 'Asset'),
    (1004, 'Accounts Receivable', 'Asset'),
    (1005, 'Fixed Assets', 'Asset'),
    (2001, 'Accounts Payable', 'Liability'),
    (2002, 'Loan Payable', 'Liability'),
    (3001, 'Equity', 'Equity'),
    (4001, 'Sales', 'Revenue'),
    (5001, 'Cost of Goods Sold', 'Expense'),
    (5002, 'Operating Expenses', 'Expense'),
    (5003, 'Interest Expense', 'Expense'),
    (5004, 'Income Tax Expense', 'Expense');

    INSERT INTO payment_method (id, payment_method_name,account_name, account_number) VALUES
    (1001, 'Cash', '-', '-'),
    (1002, 'Bank Transfer - BNI', 'John Doe', '0124124123'),
    (1003, 'Bank Transfer - BRI', 'John Doe', '0124124123'),
    (1004, 'Bank Transfer - BCA', 'John Doe', '0123123123'),
    (1005, 'OVO', 'John Doe', '012341241'),
    (1006, 'Gopay', 'John Doe', '01215125'),
    (1007, 'Paypal', 'John Doe', '0123132123'),
    (1008, 'Dana', 'John Doe', '012312312');
$$;

-----------------------------------------------
-----------------------------------------------

DROP FUNCTION IF EXISTS summary_report;
CREATE OR REPLACE FUNCTION summary_report(
    start_date DATE, 
    end_date DATE, 
    user_profile_id int
)
RETURNS table(
    balance float , 
    purchase_total float, 
    order_total float, 
    expense float,
    product_count bigint, 
    product_category_count bigint,
    customer_count bigint,
    supplier_count bigint,
    user_profile_count bigint,
    asset float,
    liability float,
    equity float,
    revenue float)
LANGUAGE plpgsql
AS $$
declare
    uid int;
    user_cash_total float;
    user_expense_total float;
    user_purchase_total float;
    user_sales_total float;
    balance float;
BEGIN
    uid = user_profile_id;

    select COALESCE(sum(aj.amount),0) INTO user_cash_total from account_journal aj 
        WHERE 
        aj.user_profile_id=uid AND 
        aj.account_category_id=1001;

    SELECT COALESCE(SUM(amount), 0)
        INTO user_expense_total
        FROM account_journal aj 
        JOIN account_category ac 
        ON aj.account_category_id = ac.id 
    WHERE 
        ac.account_type = 'Expense' AND
        aj.user_profile_id = uid AND 
        DATE(aj.created_at) BETWEEN start_date AND end_date;

    SELECT COALESCE(SUM(total), 0) 
        INTO user_purchase_total
        FROM purchase_transaction pt
        WHERE
            pt.user_profile_id = uid AND 
            DATE(pt.created_at) BETWEEN start_date AND end_date;

    SELECT COALESCE(SUM(total), 0)
        INTO user_sales_total
        FROM order_transaction ot
        WHERE 
            ot.user_profile_id = uid AND
            DATE(created_at) BETWEEN start_date AND end_date;

    balance = user_cash_total + user_sales_total - user_purchase_total - user_expense_total;

    return QUERY SELECT 
        balance,
        user_purchase_total as purchase_total,
        user_sales_total as order_total,
        user_expense_total as expense,

        (SELECT COUNT(*) FROM product) AS product_count,
        (SELECT COUNT(*) FROM product_category) AS product_category_count,
        (SELECT COUNT(*) FROM customer) AS customer_count,
        (SELECT COUNT(*) FROM supplier) AS supplier_count,
        (SELECT COUNT(*) FROM user_profile) AS user_profile_count,
     

        ( SELECT COALESCE(SUM(amount),0) FROM account_journal aj JOIN account_category ac ON aj.account_category_id = ac.id WHERE ac.account_type = 'Asset' AND DATE(aj.created_at) BETWEEN start_date AND end_date) AS asset,

        ( SELECT COALESCE(SUM(amount),0) FROM account_journal aj JOIN account_category ac ON aj.account_category_id = ac.id WHERE ac.account_type = 'Liability' AND DATE(aj.created_at) BETWEEN start_date AND end_date) AS liability,

        ( SELECT COALESCE(SUM(amount),0) FROM account_journal aj JOIN account_category ac ON aj.account_category_id = ac.id WHERE ac.account_type = 'Equity' AND DATE(aj.created_at) BETWEEN start_date AND end_date) AS equity,

        ( SELECT COALESCE(SUM(amount),0) FROM account_journal aj JOIN account_category ac ON aj.account_category_id = ac.id WHERE ac.account_type = 'Revenue' AND DATE(aj.created_at) BETWEEN start_date AND end_date) AS revenue;
END;
$$;
-- SELECT * FROM summary_report('2024-01-01', '2025-01-01', 24);



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


-- Tambahkan definisi create table disiini jika ingin mendefinisikan
-- Tabel hanya untuk dev mode
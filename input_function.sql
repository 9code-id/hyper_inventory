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


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

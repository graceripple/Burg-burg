-- 1. ユーザーテーブル
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(80) UNIQUE NOT NULL
);

-- 2. 商品テーブル (在庫数の整合性を保証) [cite: 17, 46]
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0) -- 在庫マイナスを防止 
);

-- 3. 注文テーブル (発送漏れを防ぐステータス管理) [cite: 10, 19]
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES users(id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT '未発送'
);

-- --- 初期データ投入 (DML) ---
-- ユーザー
INSERT INTO users (username) VALUES ('John Doe'), ('Micheal'), ('Bob Johnson');

-- 商品（中村さんのショップの商品例） [cite: 38, 39, 40]
INSERT INTO products (product_name, price, stock_quantity) VALUES 
('カラモママダ（マグカップ）', 1100, 10),
('フォギフテッ（革小物）', 1200, 5);
-- 1. ユーザー管理
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(80) UNIQUE NOT NULL
);

-- 2. 商品管理（在庫が0未満にならないよう制約を追加）[cite: 51]
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0)
);

-- 3. 注文管理（発送漏れを防ぐためのステータス管理）[cite: 19]
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES users(id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT '未発送'
);

-- --- 初期データ (DML) ---
INSERT INTO users (username) VALUES ('John Doe'), ('Micheal'), ('Bob Johnson');

-- 中村さんのショップの商品例 [cite: 4, 5]
INSERT INTO products (product_name, price, stock_quantity) VALUES 
('カラモママダ（マグカップ）', 1100, 10),
('フォギフテッ（革小物）', 1200, 5);
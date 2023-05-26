CREATE TABLE restaurants (
                             id SERIAL PRIMARY KEY,
                             name VARCHAR(100) NOT NULL,
                             schedule VARCHAR(100) NOT NULL,
                             minimum_order DECIMAL(10, 2) NOT NULL,
                             standard_delivery_distance DECIMAL(10, 2) NOT NULL,
                             standard_delivery_price DECIMAL(10, 2) NOT NULL,
                             extra_delivery_fee DECIMAL(10, 2) NOT NULL
);


CREATE TABLE menu_items (
                            id SERIAL PRIMARY KEY,
                            restaurant_id INT NOT NULL,
                            name VARCHAR(100) NOT NULL,
                            description TEXT NOT NULL,
                            price DECIMAL(10, 2) NOT NULL,
                            FOREIGN KEY (restaurant_id) REFERENCES restaurants (id)
);


CREATE TABLE orders (
                        id SERIAL PRIMARY KEY,
                        restaurant_id INT NOT NULL,
                        name VARCHAR(100) NOT NULL,
                        address TEXT NOT NULL,
                        distance DECIMAL(10, 2) NOT NULL,
                        order_mentions TEXT,
                        total_price DECIMAL(10, 2) NOT NULL,
                        delivery_fee DECIMAL(10, 2) NOT NULL,
                        order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        order_status VARCHAR(20) NOT NULL,
                        FOREIGN KEY (restaurant_id) REFERENCES restaurants (id)
);

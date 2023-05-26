INSERT INTO restaurants (name, schedule, minimum_order, standard_delivery_distance, standard_delivery_price, extra_delivery_fee)
VALUES ('Restaurant A', 'Mon-Fri: 10:00 AM - 8:00 PM', 20.00, 5.00, 3.00, 0.50);

INSERT INTO restaurants (name, schedule, minimum_order, standard_delivery_distance, standard_delivery_price, extra_delivery_fee)
VALUES ('Restaurant B', 'Mon-Sat: 11:00 AM - 9:00 PM', 25.00, 7.00, 4.50, 0.75);

INSERT INTO restaurants (name, schedule, minimum_order, standard_delivery_distance, standard_delivery_price, extra_delivery_fee)
VALUES ('Restaurant C', 'Mon-Sun: 9:00 AM - 10:00 PM', 15.00, 3.00, 2.50, 0.40);

INSERT INTO restaurants (name, schedule, minimum_order, standard_delivery_distance, standard_delivery_price, extra_delivery_fee)
VALUES ('Restaurant D', 'Tue-Sat: 12:00 PM - 11:00 PM', 30.00, 10.00, 5.00, 1.00);



INSERT INTO menu_items (restaurant_id, name, description, price)
VALUES (1, 'Item 1A', 'Description for Item 1A', 10.00);

INSERT INTO menu_items (restaurant_id, name, description, price)
VALUES (1, 'Item 1B', 'Description for Item 1B', 12.50);

INSERT INTO menu_items (restaurant_id, name, description, price)
VALUES (2, 'Item 2A', 'Description for Item 2A', 15.00);

INSERT INTO menu_items (restaurant_id, name, description, price)
VALUES (2, 'Item 2B', 'Description for Item 2B', 18.50);

INSERT INTO menu_items (restaurant_id, name, description, price)
VALUES (3, 'Item 3A', 'Description for Item 3A', 18.50);


INSERT INTO orders (restaurant_id, name, address, distance, order_mentions, total_price, delivery_fee, order_status)
VALUES (1, 'John Doe', '123 Main St', 3.5, 'No onions, extra ketchup', 25.00, 1.75, 'Pending');

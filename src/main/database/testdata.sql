INSERT INTO restaurants (name, schedule, minimum_order, standard_delivery_distance, standard_delivery_price, extra_delivery_fee)
VALUES ('McDonald`s', 'Mon-Fri: 10:00 AM - 8:00 PM', 20.00, 5.00, 3.00, 0.50);

INSERT INTO restaurants (name, schedule, minimum_order, standard_delivery_distance, standard_delivery_price, extra_delivery_fee)
VALUES ('KFC', 'Mon-Sat: 11:00 AM - 9:00 PM', 25.00, 7.00, 4.50, 0.75);

INSERT INTO restaurants (name, schedule, minimum_order, standard_delivery_distance, standard_delivery_price, extra_delivery_fee)
VALUES ('Pizza Hut', 'Mon-Sun: 9:00 AM - 10:00 PM', 15.00, 3.00, 2.50, 0.40);

INSERT INTO restaurants (name, schedule, minimum_order, standard_delivery_distance, standard_delivery_price, extra_delivery_fee)
VALUES ('Tihna', 'Tue-Sat: 12:00 PM - 11:00 PM', 30.00, 10.00, 5.00, 1.00);



INSERT INTO menu_items (restaurant_id, name, description, price)
VALUES (1, 'McCombo', 'One beef pattie or chicken, with soda or fresh french fries, is your decision', 5.0);

INSERT INTO menu_items (restaurant_id, name, description, price)
VALUES (1, 'Big Mac', 'Two 100% beef patties, a slice of cheese, lettuce, onion and pickles', 10.0);

INSERT INTO menu_items (restaurant_id, name, description, price)
VALUES (2, 'Smart Menu', '2 Crispy Strips® and 3 Hot Wings®, 1 small portion of fries, 1 soda and a sauce of your choice', 15.0);

INSERT INTO menu_items (restaurant_id, name, description, price)
VALUES (2, 'So Good Bucket', '10 Fillet Bites® 170g, 10 Hot Wings® 250g, 2 medium portions of french fries', 18.5);

INSERT INTO menu_items (restaurant_id, name, description, price)
VALUES (3, 'Veggie & Mozzarella', 'Tomato sauce, Mozzarella, mushrooms, olives, peppers, corn, tomatoes', 15.0);

INSERT INTO menu_items (restaurant_id, name, description, price)
VALUES (3, 'California', 'Tomato sauce, Mozzarella, chicken breast, corn, peppers', 	13.0);

INSERT INTO menu_items (restaurant_id, name, description, price)
VALUES (4, 'Spaghetti Carbonara', 'guanciale, pecorino, egg, black papper', 	20.0);

INSERT INTO menu_items (restaurant_id, name, description, price)
VALUES (4, 'Quesadilla', 'red pepper, chicken breast, corn, red onion, pita, gouda, cedar', 	20.0);

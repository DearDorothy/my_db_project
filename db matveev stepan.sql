use db_matveev_stepan;

CREATE TABLE orders (
    id_order INT NOT NULL AUTO_INCREMENT,
    date_order DATE NOT NULL,
    id_client INT NOT NULL,
    id_who_issued INT NOT NULL,
    id_status INT NOT NULL,
    
    PRIMARY KEY (id_order),
    FOREIGN KEY (id_client)
        REFERENCES clients (id_clinet),
	FOREIGN KEY (id_status)
		REFERENCES order_statuses(id_order_status),
	FOREIGN KEY (id_who_issued) 
		REFERENCES employees(id_employee)
);

CREATE TABLE order_lines (
	id_order INT NOT NULL,
	id_menu_item INT NOT NULL,
		
	PRIMARY KEY (id_order, id_menu_item),
    FOREIGN KEY (id_order)
		REFERENCES orders(id_order),
	FOREIGN KEY (id_menu_item)
		REFERENCES menu_items(id_menu_item)
);

CREATE TABLE menu_items (
	id_menu_item INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    manufacture INT NOT NULL,
    
    PRIMARY KEY (id_menu_item),
    FOREIGN KEY (manufacture)
		REFERENCES employees(id_employee)
);

CREATE TABLE menu_items_composition_containers (
	id_storage_item INT NOT NULL,
    id_menu_item INT NOT NULL,
    
    PRIMARY KEY (id_storage_item,  id_menu_item),
    FOREIGN KEY (id_storage_item)
		REFERENCES storage_items(id_storage_item),
	FOREIGN KEY (id_menu_item)
		REFERENCES menu_items(id_menu_item)
);

CREATE TABLE storage_items (
	id_storage_item INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    characteristics INT NOT NULL,
    price INT NOT NULL,
    shelf_life_in_days INT NOT NULL,
    id_type INT NOT NULL,
    id_storage_condition INT NOT NULL,
    supplier VARCHAR(255) NOT NULL,
    
	PRIMARY KEY (id_storage_item),
    FOREIGN KEY (id_type)
		REFERENCES items_types(id_item_type),
	FOREIGN KEY (id_storage_condition)
		REFERENCES storage_conditions(id_storage_condition)
);

ALTER TABLE storage_items 
MODIFY COLUMN characteristics VARCHAR(100) NOT NULL;

ALTER TABLE storage_items
MODIFY COLUMN shelf_life_in_days INT NULL;

CREATE TABLE storage_conditions (
	id_storage_condition INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (id_storage_condition)
);

CREATE TABLE items_in_warehouse (
	id_storage_item INT NOT NULL,
    id_warehouse_space INT NOT NULL,
    quantity_of_item INT NOT NULL,
    days_until_end_storage INT NOT NULL,
    
    PRIMARY KEY (id_storage_item, id_warehouse_space),
    FOREIGN KEY (id_storage_item)
		REFERENCES storage_items(id_storage_item),
	FOREIGN KEY (id_warehouse_space)
		REFERENCES warehouse_spaces(id_warehouse_space)
);

ALTER TABLE items_in_warehouse
MODIFY COLUMN days_until_end_storage INT NULL;

CREATE TABLE warehouse_spaces (
	id_warehouse_space INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    capacilty INT NOT NULL,
    such_places_in_the_warehouse INT NOT NULL,
    
    PRIMARY KEY (id_warehouse_space)
);

CREATE TABLE items_types (
	id_item_type INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    consumable BOOL NOT NULL,
    
    PRIMARY KEY (id_item_type)
);

CREATE TABLE employees (
	id_employee INT NOT NULL AUTO_INCREMENT,
	full_name VARCHAR(100) NOT NULL,
    id_jop_title INT NOT NULL,
    over_time_hours INT NOT NULL,
    id_salary_accounting INT NOT NULL,
    
    PRIMARY KEY (id_employee),
    FOREIGN KEY (id_jop_title)
		REFERENCES job_titles(id_job_title),
	FOREIGN KEY (id_employee)
		REFERENCES salary_accountings(id_salary_accounting)
);

CREATE TABLE epxpences (
	id_epxpence INT NOT NULL AUTO_INCREMENT,
    id_storage_item INT NOT NULL,
    id_employee INT NOT NULL,
    elemnt_quantity INT NOT NULL,
    `date` DATE NOT NULL,
    id_type INT NOT NULL,
    
    PRIMARY KEY (id_epxpence),
    FOREIGN KEY (id_type)
		REFERENCES types_of_expenditure(id_type_of_expenditure),
	FOREIGN KEY (id_employee)
		REFERENCES employees(id_employee),
	FOREIGN KEY (id_storage_item)
		REFERENCES storage_items(id_storage_item)
);

CREATE TABLE types_of_expenditure (
	id_type_of_expenditure INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    
	PRIMARY KEY (id_type_of_expenditure)
);

CREATE TABLE job_titles (
	id_job_title INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(100) NOT NULL,
    salary INT NOT NULL,
    duty VARCHAR(100) NOT NULL,

	PRIMARY KEY (id_job_title)
);

CREATE TABLE salary_accountings (
	id_salary_accounting INT NOT NULL AUTO_INCREMENT,
    payment_date DATE NOT NULL,
    final_payment INT NOT NULL,
    
    PRIMARY KEY (id_salary_accounting)
);

CREATE TABLE order_statuses (
	id_order_status INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    
    PRIMARY KEY (id_order_status)
);

CREATE TABLE clients (
	id_clinet INT NOT NULL AUTO_INCREMENT,
    phone_number VARCHAR(15) NOT NULL,
    full_name VARCHAR(100) NOT NULL,

	PRIMARY KEY (id_clinet),
    FOREIGN KEY (id_clinet)
		REFERENCES loyalty_program_accounts(id_loyalty_program_account)
		
);

CREATE TABLE loyalty_program_accounts (
	id_loyalty_program_account INT NOT NULL AUTO_INCREMENT,
    money_spent INT NOT NULL,
    id_lvl INT NOT NULL,
    
    PRIMARY KEY (id_loyalty_program_account),
    FOREIGN KEY (id_lvl) 
		REFERENCES loyalty_program_levels(id_loyalty_program_level)
); 


CREATE TABLE loyalty_program_levels (
	id_loyalty_program_level INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    discont INT NOT NULL,
    price INT NOT NULL,
    
    PRIMARY KEY (id_loyalty_program_level)
); 

-- Добавление данных в таблицу order_statuses
INSERT INTO order_statuses (title) VALUES 
('В обработке'),
('Выполняется'),
('Завершен'),
('Отменен'),
('На рассмотрении');

SELECT * FROM order_statuses;

-- Добавление данных в таблицу job_titles
INSERT INTO job_titles (name, salary, duty) VALUES
('Менеджер', 30000, 'Управление клиентами'),
('Повар', 25000, 'Приготовление блюд'),
('Курьер', 20000, 'Доставка заказов'),
('Бухгалтер', 35000, 'Финансовый учет'),
('Администратор склада', 27000, 'Управление складом');

SELECT * FROM job_titles;

-- Добавление данных в таблицу salary_accountings
INSERT INTO salary_accountings (payment_date, final_payment) VALUES
('2024-03-01', 30000),
('2024-03-01', 25000),
('2024-03-01', 20000),
('2024-03-01', 35000),
('2024-03-01', 27000);

SELECT * FROM salary_accountings;

-- Добавление данных в таблицу items_types
INSERT INTO items_types (name, consumable) VALUES
('Продукты питания', TRUE),
('Напитки', TRUE),
('Посуда', FALSE),
('Упаковка', FALSE),
('Кухонное оборудование', FALSE);

SELECT * FROM items_types;

-- Добавление данных в таблицу storage_conditions
INSERT INTO storage_conditions (name) VALUES
('Хорошее состояние'),
('Среднее состояние'),
('Плохое состояние');

SELECT * FROM storage_conditions;

-- Добавление данных в таблицу storage_items
INSERT INTO storage_items (`name`, characteristics, price, shelf_life_in_days, id_type, id_storage_condition, supplier) VALUES 
('Молоко', '1 литр', 50, 10, 1, 1, 'ООО "Молочный завод"'), 
('Мука', '1 кг', 40, 30, 1, 2, 'ОАО "Хлебопром"'), 
('Пицца', '30 см', 300, 5, 1, 1, 'ИП "Пиццерия"'), 
('Вода', '0.5 литра', 20, 90, 2, 1, 'ООО "Чистая вода"'), 
('Салфетки', '100 шт', 25, 60, 4, 1, 'ИП "Уютный дом"'), 
('Кастрюля', '5 литров', 500, 4, 5, 3, 'ООО "Кухонные принадлежности"'), 
('Стул', 'деревянный', 1000, 6, 3, 1, 'ОАО "МебельСтрой"'), 
('Контейнер', 'пластиковый', 150, NULL, 4, 1, 'ООО "Упаковка"'), 
('Тарелка', 'керамическая', 200, NULL, 3, 1, 'ООО "Посуда и сотейники"'), 
('Кастрюля', '10 литров', 700, NULL, 5, 2, 'ООО "Кухонные принадлежности"');

SELECT * FROM storage_items;

-- Добавление данных в таблицу warehouse_spaces
INSERT INTO warehouse_spaces (`name`, capacilty, such_places_in_the_warehouse) VALUES
('Склад 1', 1000, 100),
('Склад 2', 1500, 150),
('Склад 3', 2000, 200),
('Склад 4', 1200, 120),
('Склад 5', 1800, 180);

SELECT * FROM warehouse_spaces;

-- Добавление данных в таблицу items_in_warehouse
INSERT INTO items_in_warehouse (id_storage_item, id_warehouse_space, quantity_of_item, days_until_end_storage) VALUES
(1, 1, 50, 5),
(2, 1, 30, 20),
(3, 2, 20, 2),
(4, 2, 100, 80),
(5, 3, 200, 50),
(6, 4, 10, NULL),
(7, 4, 5, NULL),
(8, 5, 150, NULL),
(9, 5, 100, NULL),
(10, 3, 15, NULL);

SELECT * FROM items_in_warehouse;

-- Добавление данных в таблицу types_of_expenditure
INSERT INTO types_of_expenditure (title) VALUES
('Покупка сырья'),
('Зарплата персонала'),
('Ремонт оборудования'),
('Аренда склада'),
('Оплата коммунальных услуг');

SELECT * FROM types_of_expenditure;

-- Добавление данных в таблицу epxpences
INSERT INTO epxpences (id_storage_item, id_employee, elemnt_quantity, `date`, id_type) VALUES
(1, 1, 50, '2024-03-01', 1),
(2, 1, 30, '2024-03-01', 1),
(3, 2, 20, '2024-03-01', 1),
(4, 2, 100, '2024-03-01', 1),
(5, 3, 200, '2024-03-01', 1),
(6, 3, 10, '2024-03-01', 3),
(7, 4, 5, '2024-03-01', 3),
(8, 4, 150, '2024-03-01', 5),
(9, 5, 100, '2024-03-01', 5),
(10, 5, 15, '2024-03-01', 4);

SELECT * FROM epxpences;

-- Добавление данных в таблицу menu_items
INSERT INTO menu_items (`name`, price, manufacture) VALUES
('Пицца Маргарита', 350, 3),
('Салат "Цезарь"', 200, 3),
('Чай черный', 50, 4),
('Кофе Американо', 80, 4),
('Бургер с курицей', 280, 3),
('Картошка фри', 150, 3),
('Сок апельсиновый', 70, 4),
('Суп-харчо', 180, 3),
('Пельмени', 220, 3),
('Мороженое', 120, 4);

SELECT * FROM menu_items;

-- Добавление данных в таблицу order_lines
INSERT INTO order_lines (id_order, id_menu_item) VALUES
(1, 1),
(1, 3),
(2, 5),
(3, 7),
(3, 10),
(4, 2),
(5, 4),
(5, 6),
(6, 8),
(6, 9);

SELECT * FROM order_lines;

-- Добавление данных в таблицу clients
INSERT INTO clients (phone_number, full_name) VALUES
('1234567890', 'Иванов Иван'),
('0987654321', 'Петров Петр'),
('1112223344', 'Сидоров Сидор'),
('5556667788', 'Кузнецов Кузьма'),
('7778889990', 'Александров Александр');

SELECT * FROM clients;

-- Добавление данных в таблицу loyalty_program_levels
INSERT INTO loyalty_program_levels (`name`, discont, price) VALUES
('Silver', 10, 500),
('Gold', 20, 1000),
('Platinum', 30, 1500),
('Diamond', 40, 2000),
('Elite', 50, 2500);

SELECT * FROM loyalty_program_levels;
CREATE DATABASE registration_of_spacecraft_launches;
USE registration_of_spacecraft_launches;


-- Таблица статусов космических запусков
CREATE TABLE statuses_of_space_launches (
	id_statuse_of_space_launches INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(80) NOT NULL,
    
    PRIMARY KEY (id_statuse_of_space_launches)
);


INSERT INTO statuses_of_space_launches(title) 
VALUES ('Запланирован'),
	   ('Проведен'),
       ('Отменен');
	
DELETE FROM statuses_of_space_launches 
WHERE
    id_statuse_of_space_launches > 0;
    
SELECT 
    *
FROM
    statuses_of_space_launches;

-- Таблица с данными организаторов космических запусков 
CREATE TABLE organizers (
	id_organizer INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (id_organizer)
);

INSERT INTO organizers(`name`)
VALUE ('Роскосмос'),
	  ('ВВС США');

SELECT
	* 
FROM 
	organizers;

-- Таблица результатов космических запусков 
CREATE TABLE results_launches (
	id_result_launche INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(80) NOT NULL,

	PRIMARY KEY (id_result_launche)
);

INSERT INTO results_launches(title)
VALUE ('Успешный'),
	  ('Неудачный');
      
SELECT 
    *
FROM
    results_launches;

-- Таблица с космическими запусками
CREATE TABLE space_launches(
	id_space_launche INT NOT NULL AUTO_INCREMENT,
    buget DECIMAL(10, 2) NOT NULL,
	launche_date DATE NOT NULL,
    launche_time TIME NOT NULL,
    id_status INT NOT NULL,
    id_organizer_launche INT NOT NULL,
    id_result INT,
    id_space_device INT,
    id_booster_rocket INT NOT NULL,
    id_cosmodrome INT NOT NULL,
    id_mission INT NOT NULL,
    
    PRIMARY KEY (id_space_launche),
    FOREIGN KEY (id_status) 
		REFERENCES statuses_of_space_launches(id_statuse_of_space_launches),
    FOREIGN KEY (id_organizer_launche) 
		REFERENCES organizers(id_organizer),
    FOREIGN KEY (id_result) 
		REFERENCES results_launches(id_result_launche),
    FOREIGN KEY (id_space_device) 
		REFERENCES space_devices(id_space_device),
    FOREIGN KEY (id_booster_rocket) 
		REFERENCES booster_rockets(id_booster_rocket),
    FOREIGN KEY (id_cosmodrome) 
		REFERENCES cosmodromes(id_cosmodrome),
    FOREIGN KEY (id_mission) 
		REFERENCES missions(id_mission)
);

INSERT INTO space_launches(buget, launche_date, launche_time, id_status, id_organizer_launche, id_result, id_space_device, id_booster_rocket, id_cosmodrome, id_mission)
VALUE (80, '2010-03-02', '3:45:29', 14, 1, 1, 9, 22, 1, 12),
	  (100, '2010-05-28', '3:00:00', 14, 2, 1, 10, 23, 2, 13),
      (70, '2016-09-26', '4:41:00', 14, 2, 1, 11, 24, 3, 14),
      (91, '2019-06-15', '5:12:23', 14, 1, 1, 12, 22, 1, 15);
      
SELECT 
	*
FROM 
	space_launches;

-- Таблица id работников и id соответствующих им космических запусков
CREATE TABLE space_launches_has_staff (
    id_worker INT NOT NULL,
    id_space_launche INT NOT NULL,
    
    PRIMARY KEY (id_worker, id_space_launche),
    FOREIGN KEY (id_worker) 
		REFERENCES staff(id_worker),
	FOREIGN KEY (id_space_launche)
		REFERENCES space_launches(id_space_launche)
);

INSERT INTO space_launches_has_staff(id_worker, id_space_launche)
VALUE (1, 5),
	  (2, 5),
      (1, 8),
      (7, 5),
      (3, 6),
      (4, 7),
      (6, 6),
      (8, 6),
      (4, 6),
      (7, 8),
      (5, 5);

SELECT 
	* 
FROM 
	space_launches_has_staff; 

-- Таблица с контактной информацией работников
CREATE TABLE contact_information_workers (
	id_contact_information_worker INT NOT NULL AUTO_INCREMENT,
    number_phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    
	PRIMARY KEY (id_contact_information_worker)
);

INSERT INTO contact_information_workers(number_phone, email)
VALUE ('79991234567', ' anna.ivanova@roscosmos.ru'),
	  ('79999876543', 'ivan.smirnov@roscosmos.ru'),
      ('11234567890', 'john.smith@kennedyspacecenter.com'),
      ('19876543210', 'emily.johnson@vandenberg.af.mil'),
      ('79995678901', 'dmitry.petrov@gctc.ru'),
      ('12345678901', 'emma.anderson@nasa.gov'),
      ('79993456789', 'alexey.sokolov@gctc.ru'),
	  ('13456789012', 'david.taylor@roscosmos.ru');
      
SELECT 
    *
FROM
    contact_information_workers;

-- Таблица с местами работ сотрудников
CREATE TABLE places_of_work (
	id_place_of_work INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,

	PRIMARY KEY (id_place_of_work)
);

INSERT INTO places_of_work(title)
VALUE ('Центр управления полетами "Королев"'),
	  ('Ракетно-космический центр имени В.П. Макеева'),
      ('Аэрокосмический центр имени Кеннеди'),
      ('Космический центр Ванденберг'),
      ('Центр управления космическими полетами'),
      ('Космический центр Маршалла'),
      ('Центр подготовки космонавтов');

SELECT 
    *
FROM
    places_of_work;

-- Таблиица с отделами 
CREATE TABLE departments (
	id_department INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (id_department)
);

INSERT INTO departments(title)
VALUE ('Инженерный '),
	  ('Технический '),
      ('Аэрокосмический '),
      ('Разработка ракет'),
      ('Космический центр управления'),
      ('Логистика'),
      ('Аэрокосмическая инженерия');

SELECT 
    *
FROM
    departments;

-- Таблица с должностями сотрудников
CREATE TABLE positions (
	id_post INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,

	PRIMARY KEY (id_post)
);

INSERT INTO positions(title)
VALUE ('Главный инженер'),
	  ('Инженер-конструктор'),
      ('Ведущий инженер'),
      ('Оператор КЦУ'),
      ('Инженер-технолог'),
      ('Менеджер по снабжению');
      
SELECT 
    *
FROM
    positions;

-- Таблица с квалификациями
CREATE TABLE qualifications (
	id_qualification INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,

	PRIMARY KEY (id_qualification)
);

INSERT INTO qualifications(title)
VALUE ('Высшая'),
	  ('Магистр');
      
SELECT
	*
FROM
	qualifications;

-- Таблица сотрудников
CREATE TABLE staff (
    id_worker INT NOT NULL AUTO_INCREMENT,
    gender VARCHAR(10) NOT NULL,
    `name` VARCHAR(80) NOT NULL,
    date_of_birth DATE NOT NULL,
    URL_photo VARCHAR(255) NOT NULL,
    country_of_residence VARCHAR(100) NOT NULL,
    id_contact_information_worker INT NOT NULL,
    id_place_of_work INT NOT NULL,
    id_department INT NOT NULL,
    id_post INT NOT NULL,
    id_qualification INT NOT NULL,
    
    PRIMARY KEY (id_worker),
    FOREIGN KEY (id_contact_information_worker)
        REFERENCES contact_information_workers (id_contact_information_worker),
    FOREIGN KEY (id_place_of_work)
        REFERENCES places_of_work (id_place_of_work),
    FOREIGN KEY (id_department)
        REFERENCES departments (id_department),
    FOREIGN KEY (id_post)
        REFERENCES positions (id_post),
    FOREIGN KEY (id_qualification)
        REFERENCES qualifications (id_qualification)
);

INSERT INTO staff(gender, `name`, date_of_birth, URL_photo, country_of_residence, id_contact_information_worker, id_place_of_work, id_department, id_post, id_qualification)
VALUE ('жен', 'Иванвоа Анна Петровна', '1985-03-15', 'https://...', 'Россия', 1, 1, 1, 1, 1),
	  ('муж', 'Смирнов Иван Владимирович', '1978-08-25', 'https://...', 'Россия', 2, 2, 2, 2, 1),
      ('муж', 'Smith John Michael', '1980-06-05', 'https://...', 'США', 3, 3, 3, 1, 2),
      ('муж', 'Johnson Emily Grace', '1990-09-10', 'https://...', 'США', 4, 4, 4, 3, 1),
      ('муж', 'Петров Дмитрий Александрович', '1987-11-20', 'https://...', 'Россия', 5, 5, 5, 4, 1),
      ('жен', 'Anderson Emma Elizabeth', '1983-04-08', 'https://...', 'США', 6, 6, 2, 5, 1),
      ('муж', 'Соколов Алексей Николаевич', '1975-07-12', 'https://...', 'Россия', 7, 7, 6, 6, 1),
      ('муж', 'Taylor David William', '1989-12-18', 'https://...', 'США', 8, 5, 7, 3, 1);
      
SELECT
	*
FROM 
	staff;

-- Таблица с производителями космических аппаратов 
CREATE TABLE divases_manufacrtures (
	id_divase_manufacrture INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (id_divase_manufacrture)
);

INSERT INTO divases_manufacrtures(`name`) 
VALUE ('РКК «Энергия»'),
	  ('Boeing');

SELECT 
    *
FROM
    divases_manufacrtures;

-- Таблица с типами космических аппартов 
CREATE TABLE types_devises (
	id_type_devise INT NOT NULL AUTO_INCREMENT,
    titlr VARCHAR(100) NOT NULL,
    
    PRIMARY KEY (id_type_devise)
);

ALTER TABLE types_devises CHANGE titlr title VARCHAR(100) NOT NULL;

INSERT INTO types_devises(title)
VALUE ('Корабль'),
	  ('Спутник'),
      ('Зонд'),
      ('Телескоп');
      
SELECT 
    *
FROM
    types_devises;

-- Таблица с источниками энергии космических устройств
CREATE TABLE energy_sources (
	id_energy_source INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    
	PRIMARY KEY (id_energy_source)
); 

INSERT INTO energy_sources(title)
VALUE ('Солнечные батареи'),
	  ('Аккамуляторы');

SELECT 
    *
FROM
    energy_sources;

-- Таблтца с орбитальными параметрами космических аппаратов
CREATE TABLE orbital_parameters (
	id_orbital_parameter INT NOT NULL AUTO_INCREMENT,
    height_orbit DECIMAL(50, 2) NOT NULL,
    period_circulation INT NOT NULL,
    speed DECIMAL(20, 2) NOT NULL,
    inclination DECIMAL(10, 2) NOT NULL,
    
    PRIMARY KEY (id_orbital_parameter)
);

INSERT INTO orbital_parameters(height_orbit, period_circulation, speed, inclination)
VALUE (300, 89, 51.6, 7.6),
	  (35786, 718, 55.8, 50),
      (1205, 645, 56.8, 23),
      (350, 92, 49.8, 7.98);

SELECT 
    *
FROM
    orbital_parameters;

-- Таблица с габаритными размерами космических аппаратов
CREATE TABLE overall_dimensions (
	id_overall_dimensions INT NOT NULL AUTO_INCREMENT,
    widgth DECIMAL(5, 2) NOT NULL,
    lenght DECIMAL(5, 2) NOT NULL,
    height DECIMAL(5, 2) NOT NULL,
    
    PRIMARY KEY (id_overall_dimensions)
); 

INSERT INTO overall_dimensions(widgth, lenght, height)
VALUE (2.7, 7.2, 2.3),
	  (2.5, 6.2, 2.1),
      (1.5, 3.6, 1.5),
      (3.1, 6.8, 2.5);

SELECT 
    *
FROM
    overall_dimensions;
		
-- Таблица с материалами изготовления космических аппаратов 
CREATE TABLE materials_manufacture_devices (
	id_material_manufacture_device INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,

	PRIMARY KEY (id_material_manufacture_device)
);


INSERT INTO materials_manufacture_devices(title)
VALUE ('Алюминий'),
	  ('Алюминий-Титан');

SELECT 
    *
FROM
    materials_manufacture_devices;

-- Таблтица с двигателями космических аппаратов
CREATE TABLE `engines` (
	id_engine INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (id_engine)
); 

INSERT INTO `engines`(title)
VALUE ('СДУ (Системы двигателя управления)'),
	  ('Импульсный');
      
SELECT 
    *
FROM
    `engines`;

-- Таблица с космическими устройствами 
CREATE TABLE space_devices (
	id_space_device INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    URL_photo VARCHAR(255) NOT NULL,
    service_life INT NOT NULL,
    weight INT NOT NULL,
    energy_consumption DECIMAL(10, 3) NOT NULL,
    id_divase_manufacrture INT NOT NULL,
    id_type_devise INT NOT NULL,
    id_energy_source INT NOT NULL,
	id_orbital_parameter INT NOT NULL,
    id_overall_dimensions INT NOT NULL,
    id_material_manufacture_device INT NOT NULL,
    id_engine INT NOT NULL,
    
    PRIMARY KEY (id_space_device),
    FOREIGN KEY (id_divase_manufacrture) 
		REFERENCES divases_manufacrtures(id_divase_manufacrture),
    FOREIGN KEY (id_type_devise) 
		REFERENCES types_devises(id_type_devise),
    FOREIGN KEY (id_energy_source) 
		REFERENCES energy_sources(id_energy_source),
    FOREIGN KEY (id_orbital_parameter) 
		REFERENCES orbital_parameters(id_orbital_parameter),
    FOREIGN KEY (id_overall_dimensions) 
		REFERENCES overall_dimensions(id_overall_dimensions),
    FOREIGN KEY (id_material_manufacture_device) 
		REFERENCES materials_manufacture_devices(id_material_manufacture_device),
    FOREIGN KEY (id_engine) 
		REFERENCES `engines`(id_engine)
); 

INSERT INTO space_devices(`name`, cost, URL_photo, service_life, weight, energy_consumption, id_divase_manufacrture, id_type_devise, id_energy_source, id_orbital_parameter, id_overall_dimensions, id_material_manufacture_device, id_engine)
VALUE ('Прогресс М-04М', 30, 'https://...', 7, 7020, 4, 1, 1, 1, 1, 1, 1, 1),
	  ('USA-213', 45, 'https://...', 12, 1630, 1.5, 2, 2, 1, 2, 2, 1, 2),
      ('SBSS 1', 30, 'https://...', 10, 1500, 2.3, 2, 2, 2, 3, 3, 1, 2),
      ('Прогресс М-07М', 45, 'https://...', 10, 6950, 5, 1, 1, 1, 4, 4, 2, 1);

DELETE FROM space_devices 
WHERE
    id_space_device;

SELECT 
    *
FROM
    space_devices;

-- Таблица с топливами для ракет носителей
CREATE TABLE fuels (
	id_fuel INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    
	PRIMARY KEY (id_fuel)
);

INSERT INTO fuels(title)
VALUE ('Керосин, жидкий кислород'),
	  ('Жидкий водород'),
      ('Алюминиевый перхлорат');

SELECT 
    *
FROM
    fuels;

-- Таблица со статусами ракет носителей
CREATE TABLE rocket_statuses (
	id_rocket_status INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    
    PRIMARY KEY (id_rocket_status)
);

INSERT INTO rocket_statuses(title)
VALUE ('Используется'),
	  ('Выведена из экспулатации'),
      ('В производстве');
      
SELECT 
    *
FROM
    rocket_statuses;

-- Таблица с производителями ракет носителей
CREATE TABLE rocket_manufacturers (
	id_rocket_manufacturer INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (id_rocket_manufacturer)
);

INSERT INTO rocket_manufacturers(`name`)
VALUE ('АО «РКЦ Прогресс»'),
	  ('United Launch Alliance (ULA)'),
      ('Orbital Sciences Corporation (OSC)');

SELECT 
    *
FROM
    rocket_manufacturers;

-- Таблица с материалами изготовления ракет носителей
CREATE TABLE rocket_manufacturing_materials (
	id_rocket_manufacturing_material INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,

	PRIMARY KEY (id_rocket_manufacturing_material)
);

INSERT INTO rocket_manufacturing_materials(title)
VALUE ('Алюминиевый спал');

SELECT 
    *
FROM
    rocket_manufacturing_materials;

-- Таблица с системами управления ракет носителей
CREATE TABLE control_systems (
	id_control_system INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,

	PRIMARY KEY (id_control_system)
);

INSERT INTO control_systems(title)
VALUE ('Комбинированная'),
	  ('Компьютер бортового управления');

SELECT 
    *
FROM
    control_systems;

-- Таблица с ракетами носителями
CREATE TABLE booster_rockets (
	id_booster_rocket INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    URL_photo VARCHAR(255) NOT NULL,
    flight_range INT NOT NULL,
    maximum_speed DECIMAL(5, 2) NOT NULL,
    number_of_sheps INT NOT NULL,
    lenght DECIMAL(4, 2) NOT NULL,
    diameter DECIMAL(3, 2) NOT NULL,
    load_capaciry DECIMAL(3, 2) NOT NULL,
    id_fuel INT NOT NULL,
    id_rocket_status INT NOT NULL,
    id_rocket_manufacturer INT NOT NULL,
    id_rocket_manufacturing_material INT NOT NULL,
    id_control_system INT NOT NULL,
    
	PRIMARY KEY (id_booster_rocket),
    FOREIGN KEY (id_fuel) 
		REFERENCES fuels(id_fuel),
    FOREIGN KEY (id_rocket_status) 
		REFERENCES rocket_statuses(id_rocket_status),
    FOREIGN KEY (id_rocket_manufacturer) 
		REFERENCES rocket_manufacturers(id_rocket_manufacturer),
    FOREIGN KEY (id_rocket_manufacturing_material) 
		REFERENCES rocket_manufacturing_materials(id_rocket_manufacturing_material),
    FOREIGN KEY (id_control_system) 
		REFERENCES control_systems(id_control_system)
);

ALTER TABLE booster_rockets
MODIFY diameter DECIMAL(5, 2) NOT NULL,
MODIFY load_capaciry DECIMAL(5, 2) NOT NULL;

INSERT INTO booster_rockets(`name`, cost, URL_photo, flight_range, maximum_speed, number_of_sheps, lenght, diameter, load_capaciry, id_fuel, id_rocket_status, id_rocket_manufacturer, id_rocket_manufacturing_material, id_control_system) 
VALUES 
('Союз-У', 50, 'https://...', 300, 8, 3, 50, 2.95, 7.00, 1, 1, 1, 1, 1), 
('Дельта-4', 80, 'https://...', 320, 8.2, 2, 70.7, 5.1, 15, 2, 1, 2, 1, 1), 
('Минотавр-4', 75, 'https://...', 350, 8.8, 4, 23.88, 2.34, 1.7, 2, 1, 3, 1, 2);

SELECT 
    *
FROM
    booster_rockets;

DELETE FROM booster_rockets 
WHERE
    id_booster_rocket > 0;

-- Таблица с типами космодромов
CREATE TABLE types_cosmodromes (
    id_type_cosmodrome INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(80) NOT NULL,
    
    PRIMARY KEY (id_type_cosmodrome)
);

INSERT INTO types_cosmodromes(title)
VALUE ('Космический порт'),
	  ('Ракетный стартовый комплекс');
      
SELECT 
    *
FROM
    types_cosmodromes;

-- Таблица с координатами космодромов
CREATE TABLE locations (
	id_location INT NOT NULL AUTO_INCREMENT,
    latitude DECIMAL(2, 2) NOT NULL,
    longitude DECIMAL(2, 2) NOT NULL,

	PRIMARY KEY (id_location)
); 

ALTER TABLE locations
MODIFY latitude DECIMAL(6, 2) NOT NULL,
MODIFY longitude DECIMAL(6, 2) NOT NULL;

INSERT INTO locations(latitude, longitude)
VALUE ('45.96', '63.34'),
	  ('28.57', '80.64'),
      ('34.74', '120.57');
      
SELECT 
    *
FROM
    locations;

-- Таблица со статусами космодромов 
CREATE TABLE statuses_cosmodromes (
	id_status_cosmodrome INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (id_status_cosmodrome)
);

INSERT INTO statuses_cosmodromes(title)
VALUE ('Активен'),
	  ('Закрыт'),
      ('В ремноте');
      
SELECT 
    *
FROM
    statuses_cosmodromes;

-- Таблица с космодромами
CREATE TABLE cosmodromes (
    id_cosmodrome INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    square INT NOT NULL,
    country VARCHAR(50) NOT NULL,
    suppored_launch_orbit INT NOT NULL,
    bandwidth INT NOT NULL,
    URL_photo VARCHAR(255) NOT NULL,
    id_type_cosmodrome INT NOT NULL,
    id_location INT NOT NULL,
    id_status_cosmodrome INT NOT NULL,
    
    PRIMARY KEY (id_cosmodrome),
    FOREIGN KEY (id_type_cosmodrome)
        REFERENCES types_cosmodromes (id_type_cosmodrome),
    FOREIGN KEY (id_location)
        REFERENCES locations (id_location),
    FOREIGN KEY (id_status_cosmodrome)
        REFERENCES statuses_cosmodromes (id_status_cosmodrome)
);

INSERT INTO cosmodromes(`name`, square, country, suppored_launch_orbit, bandwidth, URL_photo, id_type_cosmodrome, id_location, id_status_cosmodrome)
VALUE ('Байконур', 6717, 'Казахстан', 800, 15, 'https://...', 2, 1, 1),
	  ('Канаверал', 567, 'США', 720, 18, 'https://...', 2, 2, 1),
      ('Ванденберг', 153, 'США', 820, 13, 'https://...', 2, 3, 1);

SELECT 
    *
FROM
    cosmodromes;

-- Таблица с результатами миссий
CREATE TABLE missions_results (
	id_mission_result INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    
	PRIMARY KEY (id_mission_result)
);

INSERT INTO  missions_results(title)
VALUE ('Успешная'),
	  ('Неудачная');

SELECT 
    *
FROM
    missions_results;

-- Таблица с типами миссий
CREATE TABLE types_missions (
	id_type_mission INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
    
	PRIMARY KEY (id_type_mission)
);

INSERT INTO types_missions(title)
VALUE ('Научная'),
	  ('Коммерческая'),
      ('Военная'),
      ('Геологическая');
      
SELECT 
    *
FROM
    types_missions;

-- Таблица со статусами миссий
CREATE TABLE missions_statuses (
	id_mission_status INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
	
	PRIMARY KEY (id_mission_status)
);

INSERT INTO missions_statuses(title)
VALUE ('Запланирована'),
	  ('Выполняется'),
      ('Завершена');
      
SELECT 
    *
FROM
    missions_statuses;

DELETE FROM missions_statuses 
WHERE
    id_mission_status > 0;

-- Таблица с миссиями
CREATE TABLE missions (
	id_mission INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    id_mission_result INT,
    id_type_mission INT NOT NULL,
    id_mission_status INT NOT NULL,
    
	PRIMARY KEY (id_mission),
	FOREIGN KEY (id_mission_result) 
		REFERENCES missions_results(id_mission_result),
    FOREIGN KEY (id_type_mission) 
		REFERENCES types_missions(id_type_mission),
    FOREIGN KEY (id_mission_status) 
		REFERENCES missions_statuses(id_mission_status)
);

INSERT INTO missions(`name`, start_date, end_date, id_mission_result, id_type_mission, id_mission_status)
VALUE ('Доставка груза на МКС', '2010-02-03', '2010-02-06', 1, 2, 12),
	  ('Навигация', '2010-05-28', '2025-03-05', NULL, 2, 11),
      ('Слежение за космическими объектами', '2016-09-26', '2023-09-12', 1, 1, 12),
      ('Доставка груза на МКС', '2019-06-15', '2019-06-17', 1, 2, 12);

SELECT 
    *
FROM
    missions;

DELETE FROM missions 
WHERE
    id_mission > 0;







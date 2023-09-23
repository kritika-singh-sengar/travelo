-- create databases
CREATE DATABASE IF NOT EXISTS `transactions`;
CREATE DATABASE IF NOT EXISTS `flight_search`;
CREATE DATABASE IF NOT EXISTS `hotel_search`;
CREATE DATABASE IF NOT EXISTS `login`;

-- for transactions database
CREATE DATABASE IF NOT EXISTS `transactions`;
USE transactions;
CREATE TABLE payments(
    paymentId INT(11) NOT NULL auto_increment,
    transactionId VARCHAR(255) NOT NULL,
    orderId INT(11) NOT NULL,
    customerEmail VARCHAR(255) NOT NULL,
    totalAmount DOUBLE NOT NULL,
    paymentDate date NOT NULL,
    paymentTime time NOT NULL,
    paymentStatus VARCHAR(255) NOT NULL,
    PRIMARY KEY(paymentId)
);

--for flight_search database
USE flight_search;
CREATE TABLE flights(
    flightId INT(11) NOT NULL auto_increment,
    serviceProviderName VARCHAR(255) NOT NULL,
    flightName VARCHAR(255) NOT NULL,
    departureLocation VARCHAR(255) NOT NULL,
    departureDate date NOT NULL,
    departureTime time NOT NULL,
    arrivalLocation VARCHAR(255) NOT NULL,
    arrivalDate date NOT NULL,
    arrivalTime time NOT NULL,
    flightClass VARCHAR(255) NOT NULL,
    availability VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL,
    PRIMARY KEY(flightId)
);
CREATE TABLE one_way_trip_orders(
    orderId INT(11) NOT NULL,
    productId VARCHAR(255) NOT NULL auto_increment,
    serviceProviderName VARCHAR(255) NOT NULL,
    customerEmail VARCHAR(255) NOT NULL,
    transactionId VARCHAR(255),
    totalAmount DOUBLE NOT NULL,
    orderDate date NOT NULL,
    orderTime time NOT NULL,
    orderStatus VARCHAR(255) NOT NULL,
    tripType VARCHAR(255) NOT NULL,
    PRIMARY KEY(orderId)
);
CREATE TABLE two_way_trip_orders(
    orderId INT(11) NOT NULL auto_increment,
    product1Id VARCHAR(255) NOT NULL,
    product2Id VARCHAR(255) NOT NULL,
    serviceProviderName1 VARCHAR(255) NOT NULL,
    serviceProviderName2 VARCHAR(255) NOT NULL,
    customerEmail VARCHAR(255) NOT NULL,
    transactionId VARCHAR(255),
    totalAmount DOUBLE NOT NULL,
    orderDate date NOT NULL,
    orderTime time NOT NULL,
    orderStatus VARCHAR(255) NOT NULL,
    tripType VARCHAR(255) NOT NULL,
    noOfSeatBook INT(11) NOT NULL,
    PRIMARY KEY(orderId)
);
CREATE TABLE service_providers(
    serviceProviderId INT(11) auto_increment,
    serviceProviderName VARCHAR(255) NOT NULL,
    serviceProviderEmail VARCHAR(255) NOT NULL,
    serviceProviderNumber VARCHAR(255) NOT NULL,
    PRIMARY KEY(serviceProviderId)
);
INSERT INTO `flights` (
        `flight_id`,
        `arrival_date`,
        `arrival_location`,
        `arrival_time`,
        `availability`,
        `departure_date`,
        `departure_location`,
        `departure_time`,
        `flight_class`,
        `flight_name`,
        `price`,
        `service_provider_name`
    )
VALUES(
        '2023-03-23',
        'New Delhi',
        '13:20',
        3,
        '2023-03-23',
        'Lucknow',
        '06:35',
        'economy',
        'IndiGo_123',
        2506,
        'IndiGo'
    ),
    (
        '2023-03-24',
        'New Delhi',
        '13:20:00',
        3,
        '2023-03-23',
        'Prayagraj',
        '08:35:00',
        'business',
        'AirIndia_423',
        5500,
        'Air India'
    ),
    (
        '2023-03-26',
        'Prayagraj',
        '14:00:00',
        6,
        '2023-03-25',
        'New Delhi',
        '08:35:00',
        'business',
        'IndiGo_333',
        2506 'IndiGo'
    );
INSERT INTO service_providers (
        `service_provider_id`,
        `service_provider_email`,
        `service_provider_name`,
        `service_provider_number`
    )
VALUES ('airindia.com', 'Air India', 123456789),
    ('indigo.com', 'IndiGo', 123456789);

-- for Hotel
USE hotel_search;
CREATE TABLE hotels(
    hotelId INT(11) auto_increment,
    serviceProviderName VARCHAR(255) NOT NULL,
    hotelName VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    numberOfRoomsAvailable INT NOT NULL,
    price DOUBLE NOT NULL,
    checkInDate date NOT NULL,
    checkInTime time NOT NULL,
    checkOutDate date NOT NULL,
    checkOutTime time NOT NULL,
    wishlist VARCHAR(255) NOT NULL,
    booked bit(1) NOT NULL,
    PRIMARY KEY (hotelId)
);
CREATE TABLE orders(
    orderId INT(11) auto_increment,
    productId INT(11) NOT NULL,
    serviceProviderName VARCHAR(255) NOT NULL,
    transactionId VARCHAR(255),
    totalAmount DOUBLE NOT NULL,
    orderDate date NOT NULL,
    orderTime time NOT NULL,
    orderStatus VARCHAR(255) NOT NULL,
    numberOfRoomBook INT(11) NOT NULL,
    PRIMARY KEY(orderId)
);
CREATE TABLE service_providers(
    serviceProviderId INT(11) auto_increment,
    serviceProviderName VARCHAR(255) NOT NULL,
    serviceProviderEmail VARCHAR(255) NOT NULL,
    serviceProviderNumber VARCHAR(255) NOT NULL,
    PRIMARY KEY(serviceProviderId)
);
-- insert data in tables
INSERT INTO hotels
VALUES (
        false,
        2023 -03 -23,
        13 :00 :00,
        2023 -03 -24,
        12 :00 :00,
        'Gurugram',
        'Lemon Tree Premier',
        20,
        'Lemon Tree Hotels',
        false,
        2500
    ),
    (
        false,
        '2023-03-23',
        '13:00:00',
        '2023-03-24',
        '12:00:00',
        'New Delhi',
        Paradise,
        5600,
        'Paradise Hotels',
        false,
        5600
    );
INSERT INTO service_providers
VALUES (
        'lemontreehotels.com',
        'Lemon Tree Hotels',
        6456234567
    ),
    (
        'lemontreehotels.com',
        'Lemon Tree Hotels',
        6456234567
    );

-- create root user and grant rights
-- CREATE USER 'root'@'localhost' IDENTIFIED BY 'local';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
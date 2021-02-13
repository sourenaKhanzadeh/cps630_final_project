CREATE TABLE CUSTOMER (
    CUSTOMER_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(50),
    CUSTOMER_TEL VARCHAR(20),
    CUSTOMER_EMAIL VARCHAR(50),
    CUSTOMER_ADDRESS VARCHAR(100),
    CUSTOMER_CITY_CODE VARCHAR(20),
    CUSTOMER_USERNAME VARCHAR(100),
    CUSTOMER_PASSWORD VARCHAR(100),
    CUSTOMER_BALANCE FLOAT,
    CUSTOMER_ADMIN BOOLEAN
);

CREATE TABLE CAR (
    CAR_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CAR_MODEL VARCHAR(50),
    CAR_CODE VARCHAR(50),
    AVAILABILITY_CODE VARCHAR(50)
);

CREATE TABLE FLOWER(
    FLOWER_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    STORE_CODE VARCHAR(50),
    PRICE FLOAT
);

CREATE TABLE TRIP (
    TRIP_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DESTINATION_CODE VARCHAR(100),
    SOURCE_CODE VARCHAR(100),
    DISTANCE FLOAT,
    CAR_ID INT, 
    PRICE FLOAT,
    FOREIGN KEY (CAR_ID) REFERENCES CAR (CAR_ID)
);

CREATE TABLE CUSTOMER_ORDER (
    ORDER_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DATE_ISSUED TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DATE_DONE DATE NOT NULL,
    TOTAL_PRICE FLOAT,
    PAYMENT_CODE VARCHAR(100),
    CUSTOMER_ID INT,
    TRIP_ID INT,
    FLOWER_ID INT,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID),
    FOREIGN KEY (TRIP_ID) REFERENCES TRIP (TRIP_ID),
    FOREIGN KEY (FLOWER_ID) REFERENCES FLOWER (FLOWER_ID)
);
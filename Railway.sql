---------------CREATE DATABASE----------
CREATE DATABASE RAILWAY
GO
USE RAILWAY

-------------CREATE TABLES--------------

CREATE TABLE PASSENGER
(
  Fname VARCHAR(50) NOT NULL,
  Minit CHAR(1) NOT NULL,
  Lname VARCHAR(50) NOT NULL,
  Sex CHAR(1) NOT NULL,
  P_SSN INT NOT NULL,
  Phone_Number INT NOT NULL,
  DOB DATE NOT NULL,
  PRIMARY KEY (P_SSN),
  UNIQUE (Phone_Number)
);

CREATE TABLE EMPLOYEE
(
  Fname VARCHAR(50) NOT NULL,
  Minit CHAR(1) NOT NULL,
  Lname VARCHAR(50) NOT NULL,
  E_SSN INT NOT NULL,
  Sex CHAR(1) NOT NULL,
  Phone_Number INT NOT NULL,
  Salary INT NOT NULL,
  DOB DATE NOT NULL,
  Manager_SSN INT NOT NULL,
  FOREIGN KEY (Manager_SSN) REFERENCES EMPLOYEE (E_SSN),
  PRIMARY KEY (E_SSN),
  UNIQUE (Phone_Number)
);

CREATE TABLE TRAIN
(
  Business_Class INT NOT NULL,
  Economic_Class INT NOT NULL,
  Train_Number INT NOT NULL,
  Maintenance_Day DATE NOT NULL,
  PRIMARY KEY (Train_Number)
);

CREATE TABLE STATION
(
  Station_Name VARCHAR(50) NOT NULL,
  Station_Number INT NOT NULL,
  Location VARCHAR(50) NOT NULL,
  Manager_SSN INT NOT NULL,
  Manager_Start_Date DATE NOT NULL,
  FOREIGN KEY (Manager_SSN) REFERENCES EMPLOYEE (E_SSN),
  PRIMARY KEY (Station_Number),
  UNIQUE (Station_Number)
);

ALTER TABLE EMPLOYEE ADD Station_Number INT NOT NULL,
FOREIGN KEY (Station_Number) REFERENCES STATION (Station_Number);

CREATE TABLE TRIP
(
  Trip_Number INT NOT NULL,
  Departure_Time TIME NOT NULL,
  Arrival_Time TIME NOT NULL,
  Economic_Ticket_Price INT NOT NULL,
  Business_Ticket_Price INT NOT NULL,
  Business INT NOT NULL,
  Economic INT NOT NULL,
  Train_Number INT NOT NULL,
  PRIMARY KEY (Trip_Number),
  FOREIGN KEY (Train_Number) REFERENCES TRAIN (Train_Number)
);

CREATE TABLE SUPPLIER
(
  Supplier_ID INT NOT NULL,
  Supplier_Address VARCHAR(50) NOT NULL,
  Supplier_Name VARCHAR(50) NOT NULL,
  Phone_Number INT NOT NULL,
  PRIMARY KEY (Supplier_ID),
  UNIQUE (Phone_Number)
);

CREATE TABLE SPARE_PART
(
  Part_Number INT NOT NULL,
  Price INT NOT NULL,
  Supplier_ID INT NOT NULL,
  FOREIGN KEY (Supplier_ID) REFERENCES SUPPLIER (Supplier_ID),
  PRIMARY KEY (Part_Number)
);


CREATE TABLE BOOKINGS
(
  P_SSN INT NOT NULL,
  Trip_Number INT NOT NULL,
  Trip_Date DATE NOT NULL,
  Type VARCHAR(8) NOT NULL,
  Status VARCHAR(10) NOT NULL,
  Feedback_Rating INT,
  Feedback_Comment VARCHAR(100),
  FOREIGN KEY (P_SSN) REFERENCES PASSENGER (P_SSN),
  FOREIGN KEY (Trip_Number) REFERENCES TRIP (Trip_Number),
  PRIMARY KEY (P_SSN,Trip_Number,Trip_Date)
);

CREATE TABLE FROM_TO
(
  Trip_Number INT NOT NULL,
  Station_Number1 INT NOT NULL,
  Station_Number2 INT NOT NULL
  FOREIGN KEY (Trip_Number) REFERENCES TRIP (Trip_Number),
  FOREIGN KEY (Station_Number1) REFERENCES STATION( Station_Number),
  FOREIGN KEY (Station_Number2) REFERENCES STATION( Station_Number),
  PRIMARY KEY (Trip_Number,Station_Number1,Station_Number2)
);

CREATE TABLE INVENTORY 
(
  Station_Number INT NOT NULL,
  Part_Number INT NOT NULL,
  Quantity INT,
  FOREIGN KEY (Station_Number) REFERENCES STATION( Station_Number),
  FOREIGN KEY (Part_Number) REFERENCES SPARE_PART (Part_Number),
  PRIMARY KEY (Station_Number,Part_Number)
);

CREATE TABLE REQUEST 
(
  E_SSN INT NOT NULL,
  Part_Number INT NOT NULL,
  Request_ID INT NOT NULL,
  Quantity INT,
  Status VARCHAR(10) NOT NULL,
  FOREIGN KEY (E_SSN) REFERENCES EMPLOYEE (E_SSN),
  FOREIGN KEY (Part_Number) REFERENCES SPARE_PART (Part_Number),
  PRIMARY KEY (Request_ID)
);
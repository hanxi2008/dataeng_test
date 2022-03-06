CREATE TABLE Car (
    Car_id serial,
    Manufacturer VARCHAR NOT NULL,
    Model_name VARCHAR NOT NULL,
    Serial_number VARCHAR NOT NULL,
    Weight float ,
    Price float ,
    PRIMARY KEY(Car_id)
) ;

CREATE TABLE Salesperson (
    Salesperson_id serial,
    Salesperson_name VARCHAR NOT NULL,
    Phone VARCHAR NOT NULL,
    PRIMARY KEY(Salesperson_id)
) ;

CREATE TABLE Customer (
    Customer_id serial,
    Customer_Name VARCHAR NOT NULL,
    Phone VARCHAR NOT NULL,
    PRIMARY KEY(Customer_id)
) ;

CREATE TABLE Transaction  (
    Transaction_id serial,
    car_id integer ,
    Customer_id integer ,
    Salesperson_id integer ,
    transaction_date timestamp ,
    PRIMARY KEY(transaction_id),
    CONSTRAINT fk_car
      FOREIGN KEY(car_id) 
	  REFERENCES car(car_id),
    CONSTRAINT fk_customer
      FOREIGN KEY(customer_id) 
	  REFERENCES customer(customer_id),
    CONSTRAINT fk_salesperson
      FOREIGN KEY(Salesperson_id) 
	  REFERENCES salesperson(Salesperson_id)
) ;

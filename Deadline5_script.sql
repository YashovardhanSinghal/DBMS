Drop database Inclusishop;
CREATE DATABASE if not exists INCLUSISHOP;
USE INCLUSISHOP;


CREATE TABLE  if not exists Users (
    UserID int PRIMARY KEY not null,
    firstname varchar(255) not null,
    lastname varchar(255) not null,
    Age int check (Age>0),
    Gender varchar(225) not null,
    PhoneNumber1 bigint not null unique NOT NULL CHECK (PhoneNumber1 >= 1000000000 AND PhoneNumber1 <= 9999999999),		
    EmailAddress1 varchar(255) not null unique NOT NULL CHECK (EmailAddress1 LIKE '%@%._%'),
    State varchar(255) not null,
    City varchar(255) not null,
    Street varchar(255) not null,
    ApartmentNo varchar(255) not null,
    Pincode varchar(255) not null check (length(Pincode)=6),
    isPremiumMember varchar(225) DEFAULT "NO"
);

ALTER TABLE users
ADD account_status VARCHAR(20) DEFAULT 'Active';

-- DROP TABLE IF EXISTS premiummember;
CREATE TABLE if not exists premiummember (
    MembershipNo INT PRIMARY KEY not null,
    Duration INT not null,
    TransactionID INT not null,
    UserID int not null unique , 
    foreign key (UserID) references Users(UserID) 
);



-- DROP TABLE IF EXISTS admin;
CREATE TABLE if not exists Admin (
    Name VARCHAR(255) not null ,
    AdminID INT PRIMARY KEY,
    Password VARCHAR(255) NOT NULL CHECK (
        LENGTH(Password) >= 8 AND           -- Password should be at least 8 characters long
        REGEXP_LIKE(Password, '[A-Z]') AND  -- Password should contain at least one uppercase letter
        REGEXP_LIKE(Password, '[0-9]')     -- Password should contain at least one digit
    )
);


-- DROP TABLE IF EXISTS ngos;-- 
CREATE TABLE if not exists NGOs (
    Name VARCHAR(255) not null,
    NGO_ID INT  auto_increment,
    primary key(NGO_ID),
    Description TEXT,
    Email VARCHAR(255) not null unique check (Email LIKE '%@%._%'),
    Address TEXT,
    ContactNumber bigint not null unique CHECK (ContactNumber >= 1000000000 AND ContactNumber <= 9999999999)
);



 CREATE Table if not exists Supplier(
 Name Text not null,
 SupplierID int Primary Key Not Null,
 State varchar(255) Not Null ,
 City varchar(255) Not Null,
 Street varchar(255) Not Null,
 Appartmentnumber Int not null ,
Phone_number bigint not null check (Phone_number >= 1000000000 AND Phone_number <= 9999999999 ),  
AccountNumber bigint unique not null  ,
IFSCcode int not null ,
UPI_id varchar(100)

 );
 
 

 CREATE TABLE if not exists DeliveryAgent(
 ID int primary key not null ,
 FirstName varchar (50) not null ,
 LastName varchar (50) not null ,
 Age int not null check (Age>0) ,
 Gender varchar (50) not null ,
 City varchar (50) not null ,   
 State varchar (50) not null ,   
 Street text ,   
 Apartmentno varchar (50) not null ,   
 Pincode int check (length(pincode)=6),   
 Product text ,   
 Email varchar (100) check (Email LIKE '%@%._%') not null unique ,    
 Phone_number bigint not null check (Phone_number >= 1000000000 AND Phone_number <= 9999999999 ),    
 AccountNo  varchar(100),
 IFSCcode varchar(100),
 License_code text ,    
 UPI_ID varchar(100) ,    
 Salary float     
 );
 
 -- DROP TABLE IF EXISTS product;
CREATE TABLE if not exists Product(
   Product_ID int not null auto_increment ,
   primary key(Product_ID),
   Name text  not null  ,    
   Description text ,    
   SupplierID int not null, 
   foreign key (SupplierID) references Supplier(SupplierID),
   Company_name text not null ,     
   Category text ,     
   Status boolean      
 );
 alter table product
 add quantity int;
 --  DROP TABLE IF EXISTS cart;
CREATE TABLE IF NOT EXISTS Cart (
    CartID INT PRIMARY KEY,
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    NumberOfItems INT NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL
);

 

CREATE TABLE if not exists OrderTable (
    
    OrderID INT PRIMARY KEY Not null,
    CartID int not null, 
    foreign key (CartID) references Cart(cartID),
    Discount FLOAT,
    Price FLOAT, -- total amount
    State VARCHAR(50), 
    City VARCHAR(50), 
    PaymentMode VARCHAR(50), 
    Street TEXT, 
    Pincode INT, 
    TransactionID INT, 
    ProductAmount FLOAT,
    DeliveryAgentID int not null, 
    SupplierID int not null, 
    UserID int, 
    foreign key (DeliveryAgentID) references DeliveryAgent(ID),
    foreign key (SupplierID) references Supplier(SupplierID),
    foreign key (UserID) references Users(UserID) ,
    OrderDate date NOT NULL,
    OrderStatus varchar(255)
     -- Add this line
 );







-- DROP TABLE IF EXISTS `logincredentials`;
 CREATE TABLE if not exists LoginCredentials(
 UserID int not null,
 Username varchar (50) primary key not null ,
 foreign key (UserID) references Users(UserID) ,
 Password varchar (50) not null
 );




-- DROP TABLE IF EXISTS productreview;
 CREATE TABLE if not exists ProductReview(
   UserID int not null,
   foreign key (UserID) references Users(UserID) ,
   Rating float not null ,
   Description varchar(100),
   Review_ID int primary key    
 );
 
 CREATE TABLE if not exists ReviewReply (
    ReviewReplyID INT PRIMARY KEY,
    Review_ID INT NOT NULL,
    FOREIGN KEY (Review_ID) REFERENCES ProductReview(Review_ID),
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    ReplyText VARCHAR(255) NOT NULL,
    ReplyDate VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS UserCart (
    UserID INT NOT NULL,
    CartID INT NOT NULL,
    PRIMARY KEY (UserID, CartID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CartID) REFERENCES Cart(CartID)
);

CREATE TABLE IF NOT EXISTS CartOrder (
    CartID INT NOT NULL,
    OrderID INT NOT NULL,
    OrderDate DATE NOT NULL,
    PRIMARY KEY (CartID, OrderID),
    FOREIGN KEY (CartID) REFERENCES Cart(CartID),
    FOREIGN KEY (OrderID) REFERENCES OrderTable(OrderID)
);

CREATE TABLE IF NOT EXISTS PickUp (
    DeliveryAgentID INT NOT NULL,
    SupplierID INT NOT NULL,
    PRIMARY KEY (DeliveryAgentID, SupplierID),
    FOREIGN KEY (DeliveryAgentID) REFERENCES DeliveryAgent(ID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);




CREATE TABLE UserLoginAttempts(
    attempt_id INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    attempt_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES users(UserID)
);

-- DELETE FROM Users WHERE UserID BETWEEN 1 AND 20;

-- Insert values into Users table
INSERT INTO Users (UserID, firstname, lastname, Age, Gender, PhoneNumber1, EmailAddress1, State, City, Street, ApartmentNo, Pincode, isPremiumMember)
VALUES
(1, 'Rahul', 'Gupta', 28, 'Male', 9876543210, 'rahul.gupta@example.com', 'Maharashtra', 'Mumbai', 'Bandra West', 'Apt 101', '400050', 'Yes'),
(2, 'Priya', 'Sharma', 32, 'Female', 9876543211, 'priya.sharma@example.com', 'Delhi', 'New Delhi', 'Connaught Place', 'Apt 202', '110001', 'No'),
(3, 'Amit', 'Patel', 35, 'Male', 9876543212, 'amit.patel@example.com', 'Gujarat', 'Ahmedabad', 'Ellis Bridge', 'Apt 303', '380006', 'Yes'),
(4, 'Neha', 'Sinha', 30, 'Female', 9876543213, 'neha.sinha@example.com', 'Uttar Pradesh', 'Lucknow', 'Hazratganj', 'Apt 404', '226001', 'No'),
(5, 'Raj', 'Kumar', 33, 'Male', 9876543214, 'raj.kumar@example.com', 'Tamil Nadu', 'Chennai', 'T Nagar', 'Apt 505', '600017', 'Yes'),
(6, 'Anjali', 'Verma', 29, 'Female', 9876543215, 'anjali.verma@example.com', 'West Bengal', 'Kolkata', 'Park Street', 'Apt 606', '700016', 'No'),
(7, 'Vikram', 'Singh', 40, 'Male', 9876543216, 'vikram.singh@example.com', 'Karnataka', 'Bangalore', 'Indiranagar', 'Apt 707', '560038', 'Yes'),
(8, 'Deepika', 'Yadav', 27, 'Female', 9876543217, 'deepika.yadav@example.com', 'Telangana', 'Hyderabad', 'Banjara Hills', 'Apt 808', '500034', 'No'),
(9, 'Rakesh', 'Joshi', 31, 'Male', 9876543218, 'rakesh.joshi@example.com', 'Rajasthan', 'Jaipur', 'Vaishali Nagar', 'Apt 909', '302021', 'Yes'),
(10, 'Pooja', 'Gupta', 26, 'Female', 9876543219, 'pooja.gupta@example.com', 'Kerala', 'Kochi', 'MG Road', 'Apt 1010', '682011', 'No'),
(11, 'Sanjay', 'Kumar', 37, 'Male', 9876543220, 'sanjay.kumar@example.com', 'Punjab', 'Chandigarh', 'Sector 17', 'Apt 1111', '160017', 'Yes'),
(12, 'Meera', 'Shah', 34, 'Female', 9876543221, 'meera.shah@example.com', 'Madhya Pradesh', 'Indore', 'MG Road', 'Apt 1212', '452001', 'No'),
(13, 'Arjun', 'Sinha', 39, 'Male', 9876543222, 'arjun.sinha@example.com', 'Bihar', 'Patna', 'Frazer Road', 'Apt 1313', '800001', 'Yes'),
(14, 'Nisha', 'Goyal', 25, 'Female', 9876543223, 'nisha.goyal@example.com', 'Assam', 'Guwahati', 'GS Road', 'Apt 1414', '781001', 'No'),
(15, 'Manish', 'Verma', 36, 'Male', 9876543224, 'manish.verma@example.com', 'Odisha', 'Bhubaneswar', 'Master Canteen', 'Apt 1515', '751001', 'Yes'),
(16, 'Sakshi', 'Mishra', 33, 'Female', 9876543225, 'sakshi.mishra@example.com', 'Haryana', 'Gurgaon', 'MG Road', 'Apt 1616', '122002', 'No'),
(17, 'Alok', 'Singh', 38, 'Male', 9876543226, 'alok.singh@example.com', 'Jharkhand', 'Ranchi', 'Main Road', 'Apt 1717', '834001', 'Yes'),
(18, 'Radha', 'Patel', 29, 'Female', 9876543227, 'radha.patel@example.com', 'Chhattisgarh', 'Raipur', 'Pandri', 'Apt 1818', '492001', 'No'),
(19, 'Vivek', 'Mishra', 42, 'Male', 9876543228, 'vivek.mishra@example.com', 'Uttarakhand', 'Dehradun', 'Rajpur Road', 'Apt 1919', '248001', 'Yes'),
(20, 'Shalini', 'Sharma', 31, 'Female', 9876543229, 'shalini.sharma@example.com', 'Goa', 'Panaji', '18th June Road', 'Apt 2020', '403001', 'No');


-- Insert values into PremiumMember table
INSERT INTO PremiumMember (MembershipNo, Duration, TransactionID, UserID)
VALUES
(1, 3, 101, 1),   -- Rahul Gupta
(2, 6, 102, 2),   -- Priya Sharma
(3, 12, 103, 3),  -- Amit Patel
(4, 1, 104, 4),   -- Neha Sinha
(5, 9, 105, 5),   -- Raj Kumar
(6, 4, 106, 6),   -- Anjali Verma
(7, 2, 107, 7),   -- Vikram Singh
(8, 8, 108, 8),   -- Deepika Yadav
(9, 5, 109, 9),   -- Rakesh Joshi
(10, 7, 110, 10), -- Pooja Gupta
(11, 11, 111, 11),-- Sanjay Kumar
(12, 10, 112, 12),-- Meera Shah
(13, 3, 113, 13), -- Arjun Sinha
(14, 6, 114, 14), -- Nisha Goyal
(15, 12, 115, 15),-- Manish Verma
(16, 1, 116, 16), -- Sakshi Mishra
(17, 9, 117, 17), -- Alok Singh
(18, 4, 118, 18), -- Radha Patel
(19, 2, 119, 19), -- Vivek Mishra
(20, 8, 120, 20); -- Shalini Sharma



INSERT INTO Admin (Name, AdminID, Password)
VALUES
('Yashovardhan', 1, 'Catalan11');



-- Insert values into NGOs table

INSERT INTO NGOs (Name, NGO_ID, Description, Email, Address, ContactNumber)
VALUES
('Wings of Freedom Foundation', 1, 'Empowering para-athletes to spread their wings and achieve their dreams.', 'info@wingsoffreedom.org', '123 Main Street, Mumbai, Maharashtra', '+9876543210'),
('Enable Sports Association', 2, 'Promoting inclusivity through sports for people with disabilities, especially para-athletes.', 'contact@enablesports.org', '456 Park Avenue, New Delhi, Delhi', '9876543211'),
('WheelPower India', 3, 'Providing wheelchairs and support for para-athletes to excel in their chosen sports.', 'support@wheelpowerindia.com', '789 Rajiv Gandhi Road, Bangalore, Karnataka', '9876543212'),
('ParaChampions Foundation', 4, 'Training and supporting para-athletes to become champions in their respective fields.', 'info@parachampions.org', '101 Victory Lane, Chennai, Tamil Nadu', '9876543213'),
('Inclusive Sports Trust', 5, 'Fostering an inclusive environment for para-athletes to participate and succeed in sports.', 'contact@inclusivesportstrust.org', '567 Gandhi Nagar, Kolkata, West Bengal', '9876543214');


-- DELETE FROM Cart WHERE cart_id BETWEEN 1 AND 10;
INSERT INTO Cart (CartID, UserID, NumberOfItems, TotalAmount)
VALUES
(1, 1, 0, 0.00),
(2, 2, 0, 0.00),
(3, 3, 0, 0.00),
(4, 4, 0, 0.00),
(5, 5, 0, 0.00),
(6, 6, 0, 0.00),
(7, 7, 0, 0.00),
(8, 8, 0, 0.00),
(9, 9, 0, 0.00),
(10, 10, 0, 0.00),
(11, 11, 0, 0.00),
(12, 12, 0, 0.00),
(13, 13, 0, 0.00),
(14, 14, 0, 0.00),
(15, 15, 0, 0.00),
(16, 16, 0, 0.00),
(17, 17, 0, 0.00),
(18, 18, 0, 0.00),
(19, 19, 0, 0.00),
(20, 20, 0, 0.00);


-- INSERT INTO Supplier (Name, SupplierID, State, City, Street, Appartmentnumber, Phone_number, AccountNumber, IFSCcode, UPI_id)
INSERT INTO Supplier (Name, SupplierID, State, City, Street, Appartmentnumber, Phone_number, AccountNumber, IFSCcode, UPI_id)
VALUES
('ParaSports Emporium', 1, 'Maharashtra', 'Mumbai', 'Bandra West', 101, '9876543210', 1234567890123456, 123456, 'parasports@example.com'),
('Adaptive Equipment Co.', 2, 'Delhi', 'New Delhi', 'Connaught Place', 202, '9876543211', 2345678901234567, 234567, 'adaptive@example.com'),
('ParaProsthetics Ltd.', 3, 'Karnataka', 'Bangalore', 'Indiranagar', 303, '9876543212', 3456789012345678, 345678, 'paraprosthetics@example.com'),
('Wheelchairs & More', 4, 'Tamil Nadu', 'Chennai', 'T Nagar', 404, '9876543213', 4567890123456789, 456789, 'wheelchairs@example.com'),
('Athletic Aids Co.', 5, 'Rajasthan', 'Jaipur', 'Vaishali Nagar', 505, '9876543214', 5678901234567890, 567890, 'athleticaids@example.com');


INSERT INTO DeliveryAgent (ID, FirstName, LastName, Age, Gender, City, State, Street, Apartmentno, Pincode, Product, Email, Phone_number, AccountNo, IFSCcode, License_code, UPI_ID, Salary)
VALUES
(1, 'Amit', 'Sharma', 32, 'Male', 'New Delhi', 'Delhi', 'Park Avenue', 'Apt 101', 110001, 'Wheelchairs', 'amit.sharma@example.com', '9876543210', 'ACC123456789', 'IFSC1234', 'DL123456789', 'amit.sharma@upi', 25000.00),
(2, 'Priya', 'Patel', 28, 'Female', 'Mumbai', 'Maharashtra', 'Main Street', 'Apt 202', 400050, 'Prosthetic limbs', 'priya.patel@example.com', '9876543211', 'ACC234567890', 'IFSC2345', 'DL234567890', 'priya.patel@upi', 28000.00),
(3, 'Rahul', 'Singh', 35, 'Male', 'Bangalore', 'Karnataka', 'Indiranagar', 'Apt 303', 560038, 'Blindfold goggles', 'rahul.singh@example.com', '9876543212', 'ACC345678901', 'IFSC3456', 'DL345678901', 'rahul.singh@upi', 27000.00),
(4, 'Neha', 'Yadav', 30, 'Female', 'Hyderabad', 'Telangana', 'Banjara Hills', 'Apt 404', 500034, 'Hearing aids', 'neha.yadav@example.com', '9876543213', 'ACC456789012', 'IFSC4567', 'DL456789012', 'neha.yadav@upi', 26000.00),
(5, 'Rakesh', 'Gupta', 33, 'Male', 'Jaipur', 'Rajasthan', 'Vaishali Nagar', 'Apt 505', 302021, 'Sports wheelchairs', 'rakesh.gupta@example.com', '9876543214', 'ACC567890123', 'IFSC5678', 'DL567890123', 'rakesh.gupta@upi', 30000.00),
(6, 'Anjali', 'Verma', 29, 'Female', 'Kolkata', 'West Bengal', 'Park Street', 'Apt 606', 700016, 'Wheelchair gloves', 'anjali.verma@example.com', '9876543215', 'ACC678901234', 'IFSC6789', 'DL678901234', 'anjali.verma@upi', 27000.00),
(7, 'Vikram', 'Singh', 40, 'Male', 'Chennai', 'Tamil Nadu', 'T Nagar', 'Apt 707', 600017, 'Handcycles', 'vikram.singh@example.com', '9876543216', 'ACC789012345', 'IFSC7890', 'DL789012345', 'vikram.singh@upi', 32000.00),
(8, 'Deepika', 'Yadav', 27, 'Female', 'Indore', 'Madhya Pradesh', 'MG Road', 'Apt 808', 452001, 'Track and field equipment', 'deepika.yadav@example.com', '9876543217', 'ACC890123456', 'IFSC8901', 'DL890123456', 'deepika.yadav@upi', 28000.00),
(9, 'Sanjay', 'Kumar', 37, 'Male', 'Patna', 'Bihar', 'Frazer Road', 'Apt 909', 800001, 'Sports prostheses', 'sanjay.kumar@example.com', '9876543218', 'ACC901234567', 'IFSC9012', 'DL901234567', 'sanjay.kumar@upi', 30000.00),
(10, 'Pooja', 'Gupta', 26, 'Female', 'Guwahati', 'Assam', 'GS Road', 'Apt 1010', 781001, 'Sports wheelchairs accessories', 'pooja.gupta@example.com', '9876543219', 'ACC012345678', 'IFSC0123', 'DL012345678', 'pooja.gupta@upi', 27000.00);



INSERT INTO Product (Product_ID, Name, Description, SupplierID, Company_name, Category, Status)
VALUES
(1, 'Sports Wheelchair', 'A lightweight and durable wheelchair designed specifically for sports activities.', 1, 'Wheelchair Emporium', 'Wheelchairs', true),
(2, 'Prosthetic Limb', 'High-quality prosthetic limb suitable for para-athletes to enhance mobility.', 2, 'Limbs R Us', 'Prosthetics', true),
(3, 'Blindfold Goggles', 'Special goggles designed to block vision for blindfolded sports competitions.', 3, 'Vision Solutions', 'Equipment', true),
(4, 'Hearing Aid', 'Advanced hearing aid technology to assist para-athletes with hearing impairments.', 4, 'Hearing Technologies', 'Assistive Devices', true),
(5, 'Handcycle', 'An ergonomic hand-operated cycle for upper body exercise and mobility.', 5, 'Cycle Innovations', 'Cycles', true),
(6, 'Wheelchair Gloves', 'Durable gloves designed to provide grip and comfort for wheelchair users during sports activities.', 1, 'Wheelchair Emporium', 'Accessories', true),
(7, 'Track and Field Equipment', 'Various equipment such as javelins, shot puts, and racing chairs designed for track and field events.', 2, 'Athletic Gear Co.', 'Equipment', true),
(8, 'Sports Prostheses', 'Specialized prosthetic devices designed specifically for para-athletes to participate in sports.', 3, 'Prosthetic Solutions', 'Prosthetics', true),
(9, 'Sports Wheelchair Accessories', 'Accessories such as cushions, tires, and push rims to customize and maintain sports wheelchairs.', 1, 'Wheelchair Emporium', 'Accessories', true),
(10, 'Track Racing Chair', 'A lightweight and aerodynamic racing wheelchair designed for track competitions.', 5, 'Race Wheels Inc.', 'Wheelchairs', true);




INSERT INTO OrderTable (
    OrderID, CartID, Discount, Price, State, City, PaymentMode, Street, Pincode, TransactionID, ProductAmount, DeliveryAgentID, SupplierID, UserID, OrderDate, OrderStatus
) VALUES
(
    1, 1, 0.1, 500.00, 'Maharashtra', 'Mumbai', 'UPI', 'Main Street', 400050, 101, 450.00, 1, 1, 1, '2024-02-12', 'Delivered'
),
(
    2, 2, 0.05, 700.00, 'Delhi', 'New Delhi', 'Cash on Delivery', 'Park Avenue', 110001, 102, 650.00, 1, 2, 2, '2024-02-11', 'Pending'
),
(
    3, 3, 0.2, 1200.00, 'Tamil Nadu', 'Chennai', 'Credit Card', 'MG Road', 600017, 103, 1000.00, 3, 3, 3, '2024-02-10', 'Shipped'
),
(
    4, 4, 0.15, 800.00, 'Karnataka', 'Bangalore', 'Net Banking', 'Indiranagar', 560038, 104, 680.00, 4, 4, 4, '2024-02-09', 'Processing'
),
(
    5, 5, 0.1, 600.00, 'Rajasthan', 'Jaipur', 'UPI', 'Vaishali Nagar', 302021, 105, 540.00, 5, 5, 5, '2024-02-08', 'Delivered'
);




INSERT INTO LoginCredentials (UserID, Username, Password)
VALUES
(1, 'rahul_gupta', 'Rahul@123'),
(2, 'priya_sharma', 'Priya@456'),
(3, 'amit_patel', 'Amit@789'),
(4, 'neha_sinha', 'Neha@101'),
(5, 'raj_kumar', 'Raj@202'),
(6, 'anjali_verma', 'Anjali@303'),
(7, 'vikram_singh', 'Vikram@404'),
(8, 'deepika_yadav', 'Deepika@505'),
(9, 'rakesh_joshi', 'Rakesh@606'),
(10, 'pooja_gupta', 'Pooja@707'),
(11, 'sanjay_kumar', 'Sanjay@808'),
(12, 'meera_shah', 'Meera@909'),
(13, 'arjun_sinha', 'Arjun@1010'),
(14, 'nisha_goyal', 'Nisha@1111'),
(15, 'manish_verma', 'Manish@1212'),
(16, 'sakshi_mishra', 'Sakshi@1313'),
(17, 'alok_singh', 'Alok@1414'),
(18, 'radha_patel', 'Radha@1515'),
(19, 'vivek_mishra', 'Vivek@1616'),
(20, 'shalini_sharma', 'Shalini@1717');


INSERT INTO ProductReview (UserID, Rating, Description, Review_ID)
VALUES
(1, 4.5, 'Great wheelchair! Very comfortable and sturdy.', 1),
(2, 5.0, 'The prosthetic limb fits perfectly and is very lightweight.', 2),
(3, 4.0, 'Good quality blindfold goggles. Could be more adjustable.', 3),
(4, 4.2, 'The hearing aids work well, but the battery life could be improved.', 4),
(5, 4.8, 'Excellent sports wheelchair accessories! Highly recommend.', 5),
(6, 4.6, 'Wheelchair gloves provide great grip and comfort.', 6),
(7, 4.9, 'Handcycle is fantastic for outdoor activities.', 7),
(8, 4.3, 'Track and field equipment is of good quality.', 8),
(9, 4.7, 'Sports prostheses are durable and functional.', 9),
(10, 4.4, 'Sports wheelchairs accessories are very useful.', 10);



INSERT INTO ReviewReply (ReviewReplyID, Review_ID, UserID, ReplyText, ReplyDate)
VALUES
(1, 1, 2, 'Thank you for your review! We\'re glad you enjoyed the product.', '2024-02-12'),
(2, 3, 4, 'We apologize for any inconvenience caused. Please contact our customer support for assistance.', '2024-02-11'),
(3, 5, 1, 'We appreciate your feedback! Your satisfaction is our priority.', '2024-02-10'),
(4, 1, 3, 'We\'re sorry to hear about your experience. We\'ll work to improve our products and services.', '2024-02-09'),
(5, 6, 5, 'Thank you for bringing this to our attention. We\'ll look into the issue and address it promptly.', '2024-02-08');
-- Insert data into UserCart table
INSERT INTO UserCart (UserID, CartID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

INSERT INTO CartOrder (CartID, OrderID, OrderDate)
VALUES
(1, 1, '2024-02-12'), -- CartID 1 is associated with OrderID 1, and the order date is '2024-02-12'
(2, 2, '2024-02-11'),
(3, 3, '2024-02-10'),
(4, 4, '2024-02-09'),
(5, 5, '2024-02-08');

-- Example data for demonstration purposes
INSERT INTO PickUp (DeliveryAgentID, SupplierID)
VALUES
(1, 1), -- Delivery Agent with ID 1 picks up from Supplier with ID 1
(1, 2),
(3, 3),
(4, 4),
(5, 5);






-- SELECT UserID, firstname, lastname, Age, Gender, EmailAddress1
-- FROM Users;

-- SELECT *
-- FROM Product
-- WHERE Category = 'Wheelchairs';

-- UPDATE Users
-- SET Age = Age + 1
-- WHERE UserID = 1;

-- DELETE FROM ProductReview
-- WHERE UserID = 1 AND Rating < 4;


-- SELECT AVG(Rating) AS AverageRating
-- FROM ProductReview;

-- SELECT City, COUNT(*) AS NumOfOrders
-- FROM OrderTable
-- GROUP BY City;

-- SELECT *
-- FROM Users
-- WHERE Age > (SELECT AVG(Age) FROM Users);

-- (SELECT * FROM Users WHERE isPremiumMember = 'Yes')
-- UNION
-- (SELECT * FROM Users WHERE isPremiumMember = 'No');

-- SELECT u.UserID, p.Product_ID
-- FROM Users u
-- CROSS JOIN Product p;


-- SELECT Users.firstname, Users.lastname, PremiumMember.Duration
-- FROM Users
-- JOIN PremiumMember ON Users.UserID = PremiumMember.UserID;


-- SELECT Users.UserID, Users.firstname, Users.lastname, SUM(OrderTable.Price) AS TotalAmountSpent
-- FROM Users
-- JOIN OrderTable ON Users.UserID = OrderTable.UserID
-- GROUP BY Users.UserID, Users.firstname, Users.lastname;

-- DELETE FROM Supplier
-- WHERE SupplierID NOT IN (SELECT DISTINCT SupplierID FROM Product WHERE Status = true);

-- -- UPDATE DeliveryAgent
-- -- SET Salary = Salary * 1.10;

-- -- INSERT INTO Admin (Name, AdminID, Password)
-- -- VALUES
-- -- ('Raj', 3, '1234');

-- -- INSERT INTO Users (UserID, firstname, lastname, Age, Gender, PhoneNumber1, EmailAddress1, State, City, Street, ApartmentNo, Pincode, isPremiumMember)
-- -- VALUES
-- -- (21, 'Rahulaa', 'Guptaaa', 28, 'Male', 12, 'rahl.gupta@example.com', 'Maharashtra', 'Mumbai', 'Bandra West', 'Apt 102', '400050', 'Yes');



-- SELECT *
-- FROM OrderTable
-- WHERE UserID IN (
--     SELECT UserID
--     FROM Users
--     WHERE isPremiumMember = 'Yes'
-- ) AND State = 'Maharashtra';

-- SELECT ID, FirstName, LastName
-- FROM DeliveryAgent
-- WHERE ID IN (
--     SELECT DeliveryAgentID
--     FROM OrderTable
--     GROUP BY DeliveryAgentID
--     HAVING COUNT(DISTINCT City) > 1
-- );


-- SELECT Product_ID,Name, SupplierID
-- FROM Product
-- WHERE SupplierID IN (SELECT SupplierID FROM Supplier WHERE AccountNumber = 111);



-- SELECT DISTINCT s.*
-- FROM Supplier s
-- INNER JOIN Product p ON s.SupplierID = p.SupplierID
-- INNER JOIN ProductReview pr ON p.Product_ID = pr.UserID
-- WHERE pr.Rating >= 4;


DELIMITER //
CREATE TRIGGER prevent_invalid_age BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
    IF NEW.Age <= 0 THEN
        SET NEW.Age = 18;
    END IF;
END;
//
DELIMITER ;
INSERT INTO Users (UserID, firstname, lastname, Age, Gender, PhoneNumber1, EmailAddress1, State, City, Street, ApartmentNo, Pincode, isPremiumMember)
VALUES
(21, 'Test', 'User', -5, 'Male', 9876543230, 'test.user@example.com', 'Test State', 'Test City', 'Test Street', 'Apt 2121', '123456', 'No');


-- DROP TRIGGER IF EXISTS block_user;
-- DELIMITER //
-- CREATE TRIGGER block_user
-- AFTER INSERT ON UserLoginAttempts
-- FOR EACH ROW
-- BEGIN
--     DECLARE attempts INT;
--     SELECT COUNT(*) INTO attempts FROM login_attempts WHERE UserID = NEW.UserID;
--     IF attempts >= 3 THEN
--         UPDATE users SET account_status = 'Blocked' WHERE UserID = NEW.UserID;
--     END IF;
-- END;
-- //
-- DELIMITER ;

DROP TRIGGER IF EXISTS block_user_after_failures;
DELIMITER //

CREATE TRIGGER block_user_after_failures
AFTER INSERT ON UserLoginAttempts
FOR EACH ROW
BEGIN
    DECLARE attempt_count INT;
    SELECT COUNT(*) INTO attempt_count FROM UserLoginAttempts WHERE UserID = NEW.UserID;
    IF attempt_count >= 3 THEN
        UPDATE Users SET account_status = 'Blocked' WHERE UserID = NEW.UserID;
    END IF;
END;
//

DELIMITER ;


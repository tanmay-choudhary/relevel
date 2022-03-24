--creating user table
CREATE TABLE Users (
    UserId varchar(255) PRIMARY KEY,
    Password varchar(255),
    Name varchar(255),
    Email varchar(255),
    Phone varchar(255),
    City varchar(255)
);
--adding mock values to the user table
INSERT INTO Users (UserId, Password, Name, Email, Phone, City)  
   VALUES ('user1', 'password', 'TestUser', 'testuser@relevel.com', '7777000055', 'Hyderabad');
INSERT INTO Users (UserId, Password, Name, Email, Phone, City)  
   VALUES ('user2', 'password2', 'TestUser2', 'testuser2@relevel.com', '8899554712', 'Hyderabad');

--creating admin table
CREATE TABLE AdminDetails (
    AdminId varchar(255) PRIMARY KEY,
    AdminPassword varchar(255)
);
--adding mock values to the admin table
INSERT INTO AdminDetails (AdminId, AdminPassword)  
   VALUES ('admin','admin');
   
--creating Services table
CREATE TABLE Services (
    ServiceId INTEGER PRIMARY KEY,
    ServiceCategory varchar(255),
    ServiceName varchar(255),
    InitialEstimate DECIMAL
);

--adding mock values to the Services table
INSERT INTO Services (ServiceId, ServiceCategory, ServiceName, InitialEstimate)  
   VALUES (4414, 'Plumbing', 'Tap Replacement', 150);
INSERT INTO Services (ServiceId, ServiceCategory, ServiceName, InitialEstimate)
      VALUES (4415, 'Plumbing', 'Tap Repair', 100);
INSERT INTO Services (ServiceId, ServiceCategory, ServiceName, InitialEstimate)
   VALUES (4416, 'AC Expert', 'AC Service', 650);
INSERT INTO Services (ServiceId, ServiceCategory, ServiceName, InitialEstimate)
   VALUES (4417, 'AC Expert', 'AC Installation', 1450);
INSERT INTO Services (ServiceId, ServiceCategory, ServiceName, InitialEstimate)
   VALUES (4418, 'AC Expert', 'AC Uninstallation', 1000);
INSERT INTO Services (ServiceId, ServiceCategory, ServiceName, InitialEstimate)
   VALUES (4419, 'Carpentering', 'Bed repair', 500);
INSERT INTO Services (ServiceId, ServiceCategory, ServiceName, InitialEstimate)
   VALUES (4420, 'Carpentering', 'Cupboard and Drawer', 1500);
INSERT INTO Services (ServiceId, ServiceCategory, ServiceName, InitialEstimate)
   VALUES (4421, 'Carpentering', 'Door', 1000);
   
   
--creating ExpertDetails table
CREATE TABLE ExpertDetails (
    ExpertId INTEGER PRIMARY KEY,
    Expertise varchar(255),
    ExpertName varchar(255),
    ExpertMobile varchar(255),
    Status varchar(255)
);

--adding mock values to the ExpertDetails table
INSERT INTO ExpertDetails (ExpertId, Expertise, ExpertName, ExpertMobile, Status)  
   VALUES (7758, 'Plumbing', 'Ramesh', '7784455677', 'Approved');
INSERT INTO ExpertDetails (ExpertId, Expertise, ExpertName, ExpertMobile, Status)  
   VALUES (4457, 'Plumbing', 'Suresh', '7784447477', 'Waiting for Admin Approval');
INSERT INTO ExpertDetails (ExpertId, Expertise, ExpertName, ExpertMobile, Status)
    VALUES (6658, 'AC Expert', 'Kiran', '8869741297', 'Waiting for Admin Approval');
INSERT INTO ExpertDetails (ExpertId, Expertise, ExpertName, ExpertMobile, Status)
     VALUES (9987, 'Carpentering', 'Mahesh', '7725479638', 'Approved');



--creating BookingDetails table
CREATE TABLE BookingDetails (
    BookingId INTEGER PRIMARY KEY,
    UserId varchar(255) references Users(UserId),
    ServiceId INTEGER references Services(ServiceId),
    ExpertId INTEGER references ExpertDetails(ExpertId),
    FinalPrice DECIMAL,
    BookingStatus varchar(255),
    Rating DECIMAL
);


--adding mock values to the BookingDetails table
INSERT INTO BookingDetails (BookingId, UserId, ServiceId, ExpertId, BookingStatus)  
   VALUES (88547, 'user1', 4414, 7758, 'Pending with expert');

INSERT INTO BookingDetails (BookingId, UserId, ServiceId, ExpertId, BookingStatus) 
   VALUES (88555, 'user1', 4415, 7758, 'Accepted by expert');

INSERT INTO BookingDetails (BookingId, UserId, ServiceId, ExpertId, BookingStatus)
   VALUES (88500, 'user2', 4415, 7758, 'Rejected by expert');

INSERT INTO BookingDetails (BookingId, UserId, ServiceId, ExpertId, FinalPrice, BookingStatus, Rating)
   VALUES (88564, 'user2', 4415, 7758, 446, 'Completed', 4.5);










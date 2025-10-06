-- 1. Table: Surgery
-- Primary key: Name
CREATE TABLE Surgery (
    Name VARCHAR(100) PRIMARY KEY,
    LocationAddress VARCHAR(255) NOT NULL,
    TelephoneNumber VARCHAR(20)
);

-- 2. Table: Dentist
-- Primary key: ID
CREATE TABLE Dentist (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    ContactPhoneNumber VARCHAR(20),
    Email VARCHAR(100) UNIQUE,
    Specialization VARCHAR(100),
    INDEX idx_dentist_name (LastName, FirstName)
);

-- 3. Table: Patient
-- Primary key: ID
CREATE TABLE Patient (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    ContactPhoneNumber VARCHAR(20),
    Email VARCHAR(100) UNIQUE,
    MailingAddress VARCHAR(255),
    DateOfBirth DATE,
    INDEX idx_patient_name (LastName, FirstName)
);

-- 4. Table: Appointment
-- Primary Key: A composite key of (Date, Time, DentistID)
CREATE TABLE Appointment (
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    SurgeryName VARCHAR(100) NOT NULL,
    DentistID INT NOT NULL,
    PatientID INT NOT NULL,
    
    PRIMARY KEY (Date, Time, DentistID),
    
    FOREIGN KEY (SurgeryName) REFERENCES Surgery(Name),
    FOREIGN KEY (DentistID) REFERENCES Dentist(ID),
    FOREIGN KEY (PatientID) REFERENCES Patient(ID)
);

-- 5. Table: EmailNotification
CREATE TABLE EmailNotification (
    NotificationID INT PRIMARY KEY AUTO_INCREMENT,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    DentistID INT NOT NULL,
    ConfirmationStatus BOOLEAN DEFAULT TRUE,
    
    FOREIGN KEY (AppointmentDate, AppointmentTime, DentistID) 
        REFERENCES Appointment(Date, Time, DentistID)
);

-- 6. Table: Billing
-- Primary Key: BillingID
CREATE TABLE Billing (
    BillingID INT PRIMARY KEY AUTO_INCREMENT,
    Amount DECIMAL(10, 2) NOT NULL,
    Status ENUM('Paid', 'Unpaid', 'Pending') DEFAULT 'Unpaid',
    PatientID INT NOT NULL,
    AppointmentDate DATE,
    AppointmentTime TIME,
    DentistID INT,
    
    FOREIGN KEY (PatientID) REFERENCES Patient(ID),
    FOREIGN KEY (AppointmentDate, AppointmentTime, DentistID) 
        REFERENCES Appointment(Date, Time, DentistID),
    
    UNIQUE KEY uk_billing_appointment (AppointmentDate, AppointmentTime, DentistID)
);

-- 7. Table: OfficeManager
-- Primary Key: ManagerID
CREATE TABLE OfficeManager (
    ManagerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    INDEX idx_manager_name (LastName, FirstName)
);

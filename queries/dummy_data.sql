-- DUMMY DATA INSERTION

-- 1. Insert data into Surgery (Name is PK)
INSERT INTO Surgery (Name, LocationAddress, TelephoneNumber) VALUES
('Downtown Dental', '123 Main St, Farifield', '555-1001'),
('Northside Smiles', '45 Elm Rd, Farifield', '555-1002'),
('Central Ortho', '789 Oak Ave, Farifield', '555-1003');

-- 2. Insert data into Dentist (ID is PK)
INSERT INTO Dentist (ID, FirstName, LastName, ContactPhoneNumber, Email, Specialization) VALUES
(101, 'Alice', 'Smith', '555-2001', 'a.smith@dental.com', 'General Dentistry'),
(102, 'Bob', 'Johnson', '555-2002', 'b.johnson@dental.com', 'Orthodontics'),
(103, 'Charlie', 'Davis', '555-2003', 'c.davis@dental.com', 'Pediatric Dentistry'),
(104, 'Diana', 'Jones', '555-2004', 'd.jones@dental.com', 'Oral Surgery');

-- 3. Insert data into Patient (ID is PK)
INSERT INTO Patient (ID, FirstName, LastName, ContactPhoneNumber, Email, MailingAddress, DateOfBirth) VALUES
(1, 'Emma', 'Brown', '555-3001', 'e.brown@mail.com', '10 Pine Ln', '1990-05-15'),
(2, 'Frank', 'Garcia', '555-3002', 'f.garcia@mail.com', '20 Cedar Dr', '1985-11-20'),
(3, 'Grace', 'Miller', '555-3003', 'g.miller@mail.com', '30 Birch Ct', '2005-01-25');

-- 4. Insert data into Appointment (Composite PK: Date, Time, DentistID)
INSERT INTO Appointment (Date, Time, Status, SurgeryName, DentistID, PatientID) VALUES
('2025-10-10', '09:00:00', 'Scheduled', 'Downtown Dental', 101, 1),
('2025-10-10', '10:30:00', 'Scheduled', 'Northside Smiles', 102, 2),
('2025-10-10', '11:00:00', 'Completed', 'Downtown Dental', 101, 3),
('2025-10-11', '14:00:00', 'Scheduled', 'Central Ortho', 104, 1),
('2025-10-12', '09:30:00', 'Scheduled', 'Northside Smiles', 103, 2);

-- 5. Insert data into Billing (Links to Patient and Appointment)
INSERT INTO Billing (Amount, Status, PatientID, AppointmentDate, AppointmentTime, DentistID) VALUES
(150.00, 'Unpaid', 1, '2025-10-10', '09:00:00', 101),
(80.50, 'Paid', 3, '2025-10-10', '11:00:00', 101), 
(200.00, 'Pending', 2, '2025-10-10', '10:30:00', 102); 

-- 6. Insert data into EmailNotification (Links to Appointment)
INSERT INTO EmailNotification (AppointmentDate, AppointmentTime, DentistID, ConfirmationStatus) VALUES
('2025-10-10', '09:00:00', 101, TRUE),
('2025-10-11', '14:00:00', 104, TRUE);

-- 7. Insert data into OfficeManager 
INSERT INTO OfficeManager (FirstName, LastName) VALUES
('David', 'Lee');

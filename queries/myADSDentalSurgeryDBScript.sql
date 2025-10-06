
-- 1. Display the list of ALL Dentists registered in the system, sorted in ascending order of their lastNames
SELECT
    ID AS DentistID,
    FirstName,
    LastName,
    Specialization,
    Email
FROM
    Dentist
ORDER BY
    LastName ASC;



-- 2. Display the list of ALL Appointments for a given Dentist by their DentistID number. 
--    Include in the result, the Patient information.

SELECT
    A.Date,
    A.Time,
    A.Status,
    P.ID AS PatientID,
    P.FirstName AS PatientFirstName,
    P.LastName AS PatientLastName,
    P.ContactPhoneNumber AS PatientPhone,
    S.Name AS SurgeryLocation
FROM
    Appointment A
JOIN
    Patient P ON A.PatientID = P.ID
JOIN
    Dentist D ON A.DentistID = D.ID
JOIN
    Surgery S ON A.SurgeryName = S.Name
WHERE
    A.DentistID = 101
ORDER BY
    A.Date, A.Time;


-- 3. Display the list of ALL Appointments that have been scheduled at a Surgery Location
--    (I use 'Downtown Dental' as the example SurgeryName)
SELECT
    A.Date,
    A.Time,
    A.Status,
    D.FirstName AS DentistFirstName,
    D.LastName AS DentistLastName,
    P.FirstName AS PatientFirstName,
    P.LastName AS PatientLastName,
    S.Name AS SurgeryName,
    S.LocationAddress
FROM
    Appointment A
JOIN
    Surgery S ON A.SurgeryName = S.Name
JOIN
    Dentist D ON A.DentistID = D.ID
JOIN
    Patient P ON A.PatientID = P.ID
WHERE
    S.Name = 'Downtown Dental'
ORDER BY
    A.Date, A.Time;



-- 4. Display the list of the Appointments booked for a given Patient on a given Date.
--    (We will use PatientID = 1 and Date = '2025-10-10' as the example values)
SELECT
    A.Time,
    A.Status,
    D.FirstName AS DentistFirstName,
    D.LastName AS DentistLastName,
    S.Name AS SurgeryLocation
FROM
    Appointment A
JOIN
    Dentist D ON A.DentistID = D.ID
JOIN
    Surgery S ON A.SurgeryName = S.Name
WHERE
    A.PatientID = 1
    AND A.Date = '2025-10-10'
ORDER BY
    A.Time;








-- Add a new patient
CREATE OR REPLACE PROCEDURE add_patient (
    p_aadharID IN VARCHAR,
    p_name IN VARCHAR,
    p_age IN INTEGER,
    p_address IN VARCHAR,
    p_primary_physician IN VARCHAR
) AS
BEGIN
    INSERT INTO patients (aadharID, name, age, address, primary_physician)
    VALUES (p_aadharID, p_name, p_age, p_address, p_primary_physician);
END;

-- Add a new pharmacy
CREATE OR REPLACE PROCEDURE add_pharmacy (
    p_phname IN VARCHAR,
    p_address IN VARCHAR,
    p_phone IN VARCHAR
) AS 
BEGIN
    INSERT INTO pharmacies (phname, address, phone)
    VALUES (p_phname, p_address, p_phone);
END;

-- Add a new doctor
CREATE OR REPLACE PROCEDURE add_doctor(
    p_aadharID IN VARCHAR,
    p_dname IN VARCHAR,
    p_speciality IN VARCHAR,
    p_yrs_exp IN INTEGER
) AS 
BEGIN 
    INSERT INTO doctors (aadharID, dname, speciality, yrs_exp) 
    VALUES (p_aadharID, p_dname, p_speciality, p_yrs_exp);
END;

-- Add a new pharma company
CREATE OR REPLACE PROCEDURE add_pharma_company(
    p_pcname IN VARCHAR,
    p_phone IN VARCHAR
) AS
BEGIN
    INSERT INTO pharma_companies (pcname, phone)
    VALUES (p_pcname, p_phone);
END;




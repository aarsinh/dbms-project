-- Add a new patient
CREATE OR REPLACE PROCEDURE add_patient (
    p_aadharID IN VARCHAR2,
    p_name IN VARCHAR2,
    p_age IN INTEGER,
    p_address IN VARCHAR2,
    p_primary_physician IN VARCHAR2
) AS
BEGIN
    INSERT INTO patients(aadharID, pname, age, home_address, primary_physician)
    VALUES (p_aadharID, p_name, p_age, p_address, p_primary_physician);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding new patient: ' || SQLERRM);
END;
/

-- Add a new pharmacy
CREATE OR REPLACE PROCEDURE add_pharmacy (
    p_phname IN VARCHAR2,
    p_address IN VARCHAR2,
    p_phone IN VARCHAR2
) AS 
BEGIN
    INSERT INTO pharmacies (phname, pharma_address, phone)
    VALUES (p_phname, p_address, p_phone);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding new pharma: ' || SQLERRM);
END;
/
 
-- Add a new doctor
CREATE OR REPLACE PROCEDURE add_doctor(
    p_aadharID IN VARCHAR2,
    p_dname IN VARCHAR2,
    p_speciality IN VARCHAR2,
    p_yrs_exp IN INTEGER
) AS 
BEGIN 
    INSERT INTO doctors (aadharID, dname, speciality, yrs_exp) 
    VALUES (p_aadharID, p_dname, p_speciality, p_yrs_exp);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding new doctor: ' || SQLERRM);
END;
/
 
-- Add a new pharma company
CREATE OR REPLACE PROCEDURE add_pharma_company(
    p_pcname IN VARCHAR2,
    p_phone IN VARCHAR2
) AS
BEGIN
    INSERT INTO pharma_companies (pcname, phone)
    VALUES (p_pcname, p_phone);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding new pharma company: ' || SQLERRM);
END;
/

-- Add a new drug
CREATE OR REPLACE PROCEDURE add_drug(
    p_trdname IN VARCHAR2,
    p_pcname IN VARCHAR2,
    p_formula IN VARCHAR2
) AS
BEGIN
    INSERT INTO drugs(trdname, pcname, formula) 
    VALUES (p_trdname, p_pcname, p_formula);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding new drug: ' || SQLERRM);
END;
/

-- Add a new consultation
CREATE OR REPLACE PROCEDURE add_consultation(
    p_doctorID IN VARCHAR2,
    p_patientID IN VARCHAR2
) AS 
BEGIN 
    INSERT INTO consultations (doctorID, patientID)
    VALUES (p_doctorID, p_patientID);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding consultation: ' || SQLERRM);
END;
/

-- Add a new prescription
CREATE OR REPLACE PROCEDURE add_prescription(
    p_doctorID IN VARCHAR2,
    p_patientID IN VARCHAR2,
    p_drug_name IN VARCHAR2,
    p_pcname IN VARCHAR2,
    p_date IN DATE,
    p_qty IN INTEGER
) AS
    pres_count INTEGER;
    existing_date DATE;     
BEGIN
    SELECT COUNT(*) INTO pres_count FROM prescriptions WHERE doctorID = p_doctorID AND patientID = p_patientID;
    IF pres_count = 0 THEN
        INSERT INTO prescriptions (doctorID, patientID, drug_name, pcname, prescription_date, quantity)
        VALUES (p_doctorID, p_patientID, p_drug_name, p_pcname, p_date, p_qty);
    ELSE  
        SELECT prescription_date INTO existing_date FROM prescriptions
        WHERE doctorID = p_doctorID AND patientID = p_patientID;    

        IF p_date > existing_date THEN
            UPDATE prescriptions
            SET prescription_date = p_date,
                drug_name = p_drug_name,
                pcname = p_pcname,
                quantity = p_qty;
        END IF;
    END IF;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inserting prescription: ' || SQLERRM);
END;
/

-- Add a new drug sale
CREATE OR REPLACE PROCEDURE add_drug_sale(
    p_phname IN VARCHAR2,
    p_drug_name IN VARCHAR2,
    p_pcname IN VARCHAR2,
    p_drug_price IN DECIMAL
) AS
BEGIN
    INSERT INTO drug_sales(phname, drug_name, pcname, drug_price) 
    VALUES (p_phname, p_drug_name, p_pcname, p_drug_price);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating drug sale: ' || SQLERRM);
END;
/

-- Add a new contract
CREATE OR REPLACE PROCEDURE add_contract(
    p_pcname VARCHAR2,
    p_phname VARCHAR2,
    p_start_date DATE,
    p_end_date DATE,
    p_content VARCHAR2,
    p_supervisorID VARCHAR2
) AS
BEGIN 
    INSERT INTO contracts (pcname, phname, start_date, end_date, content, supervisorID)
    VALUES (p_pcname, p_phname, p_start_date, p_end_date, p_content, p_supervisorID);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating contract: ' || SQLERRM);
END;
/
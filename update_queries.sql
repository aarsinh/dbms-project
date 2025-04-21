CREATE OR REPLACE PROCEDURE update_patient(
    p_patientID IN VARCHAR2,
    p_name IN VARCHAR2,
    p_age INTEGER,
    p_address VARCHAR2,
    p_physician VARCHAR2
) AS
BEGIN 
    UPDATE patients
    SET pname = p_name,
        age = p_age,
        home_address = p_address,
        primary_physician = p_physician
    WHERE aadharID = p_patientID;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating patient with id: ' || p_patientID || ' : ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_doctor(
    p_doctorID IN VARCHAR2,
    p_name IN VARCHAR2,
    p_speciality IN VARCHAR2,
    p_yrs_exp IN INTEGER
) AS
BEGIN 
    UPDATE doctors
    SET dname = p_name,
        speciality = p_speciality,
        yrs_exp = p_yrs_exp
    WHERE aadharID = p_doctorID;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating doctor with id: ' || p_doctorID || ' : ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_pharmacy(
    p_phname VARCHAR2,
    p_address VARCHAR2,
    p_phone VARCHAR2
) AS 
BEGIN
    UPDATE pharmacies
    SET pharma_address = p_address,
        phone = p_phone
    WHERE phname = p_phname;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating pharmacy with name: ' || p_phname || ' : ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_pc(
    p_pcname IN VARCHAR2,
    p_phone IN VARCHAR2
) AS
BEGIN 
    UPDATE pharma_companies
    SET phone = p_phone
    WHERE pcname = p_pcname;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating pharma company with name: ' || p_pcname || ' : ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_drug(
    p_trdname IN VARCHAR2,
    p_pcname IN VARCHAR2,
    p_formula IN VARCHAR2
) AS
BEGIN 
    UPDATE drugs
    SET formula = p_formula
    WHERE trdname = p_trdname AND pcname = p_pcname;
END;
/

CREATE OR REPLACE PROCEDURE update_sale(
    p_phname IN VARCHAR2,
    p_drug_name IN VARCHAR2,
    p_pcname IN VARCHAR2,
    p_drug_price IN DECIMAL
) AS
BEGIN 
    UPDATE drug_sales 
    SET drug_price = p_drug_price
    WHERE phname = p_phname AND drug_name = p_drug_name AND pcname = p_pcname;
END;
/
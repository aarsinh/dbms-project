CREATE OR REPLACE PROCEDURE update_patient(
    p_patientID IN patients.aadharID%TYPE,
    p_name IN patients.pname%TYPE,
    p_age patients.age%TYPE,
    p_address patients.home_address%TYPE,
    p_physician patients.primary_physician%TYPE
) AS
BEGIN 
    UPDATE patients
    SET pname = p_name,
        age = p_age,
        home_address = p_address,
        primary_physician = p_physician
    WHERE aadharID = p_patientID;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating patient with id: ' || p_patientID || ' : ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_doctor(
    p_doctorID IN doctors.aadharID%TYPE,
    p_name IN doctors.dname%TYPE,
    p_speciality IN doctors.speciality%TYPE,
    p_yrs_exp IN doctors.yrs_exp%TYPE
) AS
BEGIN 
    UPDATE doctors
    SET dname = p_name,
        speciality = p_speciality,
        yrs_exp = p_yrs_exp
    WHERE aadharID = p_doctorID;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating doctor with id: ' || p_doctorID || ' : ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_pharmacy(
    p_phname pharmacies.phname%TYPE,
    p_address pharmacies.pharma_address%TYPE,
    p_phone pharmacies.phone%TYPE
) AS 
BEGIN
    UPDATE pharmacies
    SET pharma_address = p_address,
        phone = p_phone
    WHERE phname = p_phname;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating pharmacy with name: ' || p_phname || ' : ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_pc(
    p_pcname IN pharma_companies.pcname%TYPE,
    p_phone IN pharma_companies.phone%TYPE
) AS
BEGIN 
    UPDATE pharma_companies
    SET phone = p_phone
    WHERE pcname = p_pcname;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating pharma company with name: ' || p_pcname || ' : ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_drug(
    p_trdname IN drugs.trdname%TYPE,
    p_pcname IN drugs.pcname%TYPE,
    p_formula IN drugs.formula%TYPE
) AS
BEGIN 
    UPDATE drugs
    SET formula = p_formula
    WHERE trdname = p_trdname AND pcname = p_pcname;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error updating drug with trdname: ' || p_trdname || ', pcname: ' || p_pcname);
END;
/

CREATE OR REPLACE PROCEDURE update_sale(
    p_phname IN drug_sales.phname%TYPE,
    p_drug_name IN drug_sales.drug_name%TYPE,
    p_pcname IN drug_sales.pcname%TYPE,
    p_drug_price IN drug_sales.drug_price%TYPE
) AS
BEGIN 
    UPDATE drug_sales 
    SET drug_price = p_drug_price
    WHERE phname = p_phname AND drug_name = p_drug_name AND pcname = p_pcname;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating drug sale with phname: ' || p_phname || ', drug name: ' || p_drug_name || ', pcname: ' || p_pcname);
END;
/

CREATE OR REPLACE PROCEDURE update_contract(
    p_pcname IN contracts.phname%TYPE,
    p_phname IN contracts.pcname%TYPE,
    p_start_date IN contracts.start_date%TYPE,
    p_end_date IN contracts.end_date%TYPE,
    p_content IN contracts.content%TYPE,
    p_supervisorID IN contracts.supervisorID%TYPE
) AS 
BEGIN
    UPDATE contracts
    SET end_date = p_end_date,
        content = p_content,
        supervisorID = p_supervisorID
    WHERE pcname = p_pcname AND phname = p_phname AND start_date = p_start_date;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating contract with phname: ' || p_phname || ', pcname: ' || p_pcname || ', start_date: ' || p_start_date);
END;
/
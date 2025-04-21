CREATE OR REPLACE PROCEDURE delete_patient(
    p_patientID IN patients.aadharID%TYPE
) AS
BEGIN
    DELETE FROM patients WHERE aadharID = p_patientID;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error deleting patient: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE delete_doctor(
    p_doctorID IN doctors.aadharID%TYPE
) AS
BEGIN
    DELETE FROM doctors WHERE aadharID = p_doctorID;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error deleting doctor: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE delete_pharmacy(
    p_phname IN pharmacies.phname%TYPE
) AS
BEGIN
    DELETE FROM pharmacies WHERE phname = p_phname;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error deleting pharmacy: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE delete_pharma_company (
    p_pcname IN pharma_companies.pcname%TYPE
) AS
BEGIN
    DELETE FROM pharma_companies WHERE pcname = p_pcname;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error deleting pharma company: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE delete_drug (
    p_drug_name IN drugs.trdname%TYPE,
    p_pcname IN drugs.pcname%TYPE
) AS
BEGIN
    DELETE FROM drugs WHERE trdname = p_drug_name AND pcname = p_pcname;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error deleting drug: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE delete_consultation(
    p_doctorID IN consultations.doctorID%TYPE,
    p_patientID IN consultations.patientID%TYPE
) AS
BEGIN 
    DELETE FROM consultations WHERE doctorID = p_doctorID AND patientID = p_patientID;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error deleting consultation: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE delete_prescription(
    p_patientID IN prescriptions.patientID%TYPE,
    p_doctorID IN prescriptions.doctorID%TYPE,
    p_drug_name IN prescriptions.drug_name%TYPE,
    p_pcname IN prescriptions.pcname%TYPE,
    p_prescription_date IN prescriptions.prescription_date%TYPE
) AS 
BEGIN
    DELETE FROM prescriptions WHERE 
    doctorID = p_doctorID AND
    patientID = p_patientID AND
    drug_name = p_drug_name AND
    pcname = p_pcname AND
    prescription_date = p_prescription_date;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error deleting prescription: ' || SQLERRM);
END;
/


CREATE OR REPLACE PROCEDURE delete_sale(
    p_phname IN drug_sales.phname%TYPE,
    p_drug_name IN drug_sales.drug_name%TYPE,
    p_pcname IN drug_sales.pcname%TYPE
) AS 
BEGIN 
    DELETE FROM drug_sales WHERE phname = p_phname AND drug_name = p_drug_name AND pcname = p_pcname;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error deleting sale: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE delete_contract(
    p_pcname contracts.pcname%TYPE,
    p_phname contracts.phname%TYPE,
    p_start_date contracts.start_date%TYPE
) AS
BEGIN 
    DELETE FROM contracts WHERE pcname = p_pcname AND phname = p_phname AND start_date = p_start_date;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error deleting contract: ' || SQLERRM);
END;
/
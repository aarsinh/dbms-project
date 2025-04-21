CREATE OR REPLACE PROCEDURE delete_patient(
    p_patientID IN VARCHAR2
) AS
BEGIN
    DELETE FROM patients WHERE aadharID = p_patientID;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error deleting patient: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE delete_doctor(
    p_doctorID IN VARCHAR2
) AS
BEGIN
    DELETE FROM doctors WHERE aadharID = p_doctorID;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error deleting doctor: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE delete_pharmacy(
    p_phname IN VARCHAR2
) AS
BEGIN
    DELETE FROM pharmacies WHERE phname = p_phname;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error deleting pharmacy: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE delete_pharma_company (
    p_pcname IN VARCHAR2
) AS
BEGIN
    DELETE FROM pharma_companies WHERE pcname = p_pcname;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error deleting pharma company: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE delete_drug (
    p_drug_name IN VARCHAR2,
    p_pcname IN VARCHAR2
) AS
BEGIN
    DELETE FROM drugs WHERE drug_name = p_drug_name AND pcname = p_pcname;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error deleting pharma company: ' || SQLERRM);
END;


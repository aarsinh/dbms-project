CREATE OR REPLACE PROCEDURE print_prescription_details (
    p_patientID IN VARCHAR2,
    p_date IN DATE
) AS
BEGIN
    FOR rec IN (
        SELECT 
            p.doctorID,
            d.dname AS doctor_name,
            p.drug_name,
            p.pcname,
            prc.formula,
            p.prescription_date,
            p.quantity
        FROM 
            prescriptions p
        JOIN 
            doctors d ON p.doctorID = d.aadharID
        JOIN 
            drugs prc ON p.drug_name = prc.trdname AND p.pcname = prc.pcname
        WHERE 
            p.patientID = p_patientID AND
            p.prescription_date = p_date
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('--- Prescription Details ---');
        DBMS_OUTPUT.PUT_LINE('Doctor ID     : ' || rec.doctorID);
        DBMS_OUTPUT.PUT_LINE('Doctor Name   : ' || rec.doctor_name);
        DBMS_OUTPUT.PUT_LINE('Drug Name     : ' || rec.drug_name);
        DBMS_OUTPUT.PUT_LINE('Pharma Company: ' || rec.pcname);
        DBMS_OUTPUT.PUT_LINE('Formula       : ' || rec.formula);
        DBMS_OUTPUT.PUT_LINE('Date          : ' || TO_CHAR(rec.prescription_date, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Quantity      : ' || rec.quantity);
        DBMS_OUTPUT.PUT_LINE('----------------------------');
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error fetching prescription details: ' || SQLERRM);
END;
/
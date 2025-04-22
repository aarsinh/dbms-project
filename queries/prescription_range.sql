CREATE OR REPLACE PROCEDURE print_prescriptions_in_range (
    p_patientID IN VARCHAR2,
    p_start_date IN DATE,
    p_end_date IN DATE
) AS
BEGIN
    FOR rec IN (
        SELECT 
            p.doctorID,
            d.dname AS doctor_name,
            p.drug_name,
            p.prescription_date,
            pa.pname,
            p.quantity
        FROM 
            prescriptions p
        JOIN 
            doctors d ON p.doctorID = d.aadharID
        JOIN 
            drugs dr ON p.drug_name = dr.trdname AND p.pcname = dr.pcname
        JOIN 
            patients pa ON pa.aadharID = p_patientID
        WHERE 
            p.patientID = p_patientID AND
            p.prescription_date BETWEEN p_start_date AND p_end_date
        ORDER BY 
            p.prescription_date
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('--- Prescription Details ---');
        DBMS_OUTPUT.PUT_LINE('Date          : ' || TO_CHAR(rec.prescription_date, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Doctor ID     : ' || rec.doctorID);
        DBMS_OUTPUT.PUT_LINE('Doctor Name   : ' || rec.doctor_name);
        DBMS_OUTPUT.PUT_LINE('Patient ID     : ' || p_patientID);
        DBMS_OUTPUT.PUT_LINE('Patient Name   : ' || rec.pname);
        DBMS_OUTPUT.PUT_LINE('Drug Name     : ' || rec.drug_name);
        DBMS_OUTPUT.PUT_LINE('Quantity      : ' || rec.quantity);
        DBMS_OUTPUT.PUT_LINE('----------------------------');
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error retrieving prescriptions: ' || SQLERRM);
END;
/
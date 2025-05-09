CREATE OR REPLACE PROCEDURE print_prescription_details(
    p_patientID IN VARCHAR2,
    p_date IN DATE
) AS
    v_found BOOLEAN := FALSE;
    v_first_row BOOLEAN := TRUE;

    v_patient_name      patients.pname%TYPE;
BEGIN
    SELECT p.pname
    INTO v_patient_name
    FROM patients p
    WHERE p.aadharID = p_patientID;

    -- Prescription info
    FOR rec IN (
        SELECT 
            p.doctorID,
            d.dname AS doctor_name,
            p.drug_name,
            p.pcname,
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
        IF v_first_row THEN
            DBMS_OUTPUT.PUT_LINE('=== Prescription Details for ' || v_patient_name || ' on date: ' || TO_CHAR(rec.prescription_date, 'DD-MON-YYYY') || ' ===');
            DBMS_OUTPUT.PUT_LINE('Consulting Physician:');
            DBMS_OUTPUT.PUT_LINE('ID: ' || rec.doctorID);
            DBMS_OUTPUT.PUT_LINE('Name: ' || rec.doctor_name);
            DBMS_OUTPUT.PUT_LINE('');
            DBMS_OUTPUT.PUT_LINE('Medicines Prescribed:');
            DBMS_OUTPUT.PUT_LINE(RPAD('Name', 25) || 'Qty');
            DBMS_OUTPUT.PUT_LINE(RPAD('-', 25, '-') || '----');
            v_first_row := FALSE;
        END IF;

        v_found := TRUE;
        DBMS_OUTPUT.PUT_LINE(RPAD(rec.drug_name, 25) || LPAD(rec.quantity, 4));
    END LOOP;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE('No prescription found for patient ' || p_patientID || ' on ' || TO_CHAR(p_date, 'DD-MON-YYYY'));
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error fetching prescription details: ' || SQLERRM);
END;
/

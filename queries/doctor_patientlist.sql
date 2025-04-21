SET SERVEROUTPUT ON;
-- list out all patients for a given doctor
CREATE OR REPLACE PROCEDURE patients_list(dID IN INT) AS
    docname doctors.dname%TYPE;
    rows INT;
    CURSOR patient_cursor IS
        SELECT pname, age FROM patients P
        JOIN consultations C ON P.aadharID = C.patientID
        WHERE C.doctorID = dID;
BEGIN
    SELECT COUNT(*) INTO rows FROM consultations WHERE doctorID = dID;
    SELECT dname INTO docname FROM doctors where aadharID = dID;
    DBMS_OUTPUT.PUT_LINE('Patients treated by ' || docname);
    IF rows = 0 THEN
        DBMS_OUTPUT.PUT_LINE('None');
    ELSE
        DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------');
        FOR patient IN patient_cursor LOOP
            DBMS_OUTPUT.PUT_LINE('Name: ' || patient.pname || '    ' || 'Age: ' || patient.age);
            DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------');
        END LOOP;
    END IF;
END patients_list;
/

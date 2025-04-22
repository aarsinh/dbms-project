-- display drug details of a pharma company
CREATE OR REPLACE PROCEDURE display_drug_details(p_pcname IN VARCHAR2) AS
    rows INT;
    CURSOR drug_cursor IS
        SELECT trdname, formula
            FROM drugs
            WHERE pcname = p_pcname;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Drugs manufactured by ' || p_pcname);
    SELECT COUNT(*) INTO rows FROM drugs WHERE p_pcname = pcname;
    IF rows = 0 THEN 
        DBMS_OUTPUT.PUT_LINE('None');
    ELSE
        DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------');
        FOR drug_record IN drug_cursor LOOP
             DBMS_OUTPUT.PUT_LINE('Trade name: ' || drug_record.trdname);
            DBMS_OUTPUT.PUT_LINE('Formula: ' || drug_record.formula);
            DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------');
        END LOOP;
    END IF;
END display_drug_details;
/
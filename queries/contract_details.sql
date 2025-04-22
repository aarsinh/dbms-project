CREATE OR REPLACE PROCEDURE print_contract(
    p_pcname IN VARCHAR2,
    p_phname IN VARCHAR2
) AS
BEGIN
    FOR it IN (
        SELECT pcname, phname, start_date, end_date, content, supervisorID
        FROM contracts
        WHERE pcname = p_pcname AND phname = p_phname
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Pharma Company : ' || it.pcname);
        DBMS_OUTPUT.PUT_LINE('Pharmacy       : ' || it.phname);
        DBMS_OUTPUT.PUT_LINE('Start Date     : ' || TO_CHAR(it.start_date, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('End Date       : ' || TO_CHAR(it.end_date, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Supervisor ID  : ' || it.supervisorID);
        DBMS_OUTPUT.PUT_LINE('Contract Content:');
        DBMS_OUTPUT.PUT_LINE(it.content);
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
    END LOOP;
END;
/

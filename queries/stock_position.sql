CREATE OR REPLACE PROCEDURE stock_position(
    p_phname IN VARCHAR2
) AS
BEGIN
    FOR it IN (
        SELECT drug_name, quantity 
        FROM drug_sales 
        WHERE phname = p_phname
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Drug Name: ' || RPAD(it.drug_name, 20) || ' Quantity: ' || it.quantity);
    END LOOP;
END;
/

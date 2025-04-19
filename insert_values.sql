EXEC add_doctor('123456789012', 'Dr. John Smith', 'Cardiologist', 15);
EXEC add_patient('987654321098', 'Alice Johnson', 45, '123 Elm St, City', '123456789012');
EXEC add_pharmacy('PharmCity', '456 Market St, City', '555-1234');
EXEC add_pharma_company('PharmaCo', '555-5678');
EXEC add_drug('Aspirin', 'PharmaCo', 'C9H8O4');
EXEC add_consultation('123456789012', '987654321098');
EXEC add_prescription('123456789012', '987654321098', 'Aspirin', 'PharmaCo', TO_DATE('2025-04-19', 'YYYY-MM-DD'), 30);
EXEC add_drug_sale('PharmCity', 'Aspirin', 'PharmaCo', 10.99);
EXEC add_contract('PharmaCo', 'PharmCity', TO_DATE('2025-05-01', 'YYYY-MM-DD'), TO_DATE('2026-05-01', 'YYYY-MM-DD'), 'Supply agreement for Aspirin and other medications', 'Super123');

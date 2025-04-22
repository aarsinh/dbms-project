EXEC delete_doctor('123456789001');
EXEC delete_doctor('123456789002');

EXEC delete_patient('987654321001');
EXEC delete_patient('987654321002');

EXEC delete_pharmacy('PharmCity');
EXEC delete_pharmacy('MediCare Pharmacy');

EXEC delete_pharma_company('PharmaCo');
EXEC delete_pharma_company('Medica Ltd');

EXEC delete_drug('Aspirin', 'PharmaCo');
EXEC delete_drug('Paracetamol', 'Medica Ltd');

EXEC delete_consultation('123456789001', '987654321001');
EXEC delete_consultation('123456789002', '987654321002');

EXEC delete_prescription('987654321001', '123456789001', 'Aspirin', 'PharmaCo', TO_DATE('2025-04-19', 'YYYY-MM-DD'));
EXEC delete_prescription('987654321002', '123456789002', 'Paracetamol', 'Medica Ltd', TO_DATE('2025-04-20', 'YYYY-MM-DD'));

EXEC delete_sale('PharmCity', 'Aspirin', 'PharmaCo');
EXEC delete_sale('MediCare Pharmacy', 'Paracetamol', 'Medica Ltd');

EXEC delete_contract('PharmaCo', 'PharmCity', TO_DATE('2025-05-01', 'YYYY-MM-DD'));
EXEC delete_contract('Medica Ltd', 'MediCare Pharmacy', TO_DATE('2025-05-01', 'YYYY-MM-DD'));

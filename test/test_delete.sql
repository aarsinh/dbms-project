-- DELETE 2 Doctor Records
EXEC delete_doctor('123456789001');
EXEC delete_doctor('123456789002');

-- DELETE 2 Patient Records
EXEC delete_patient('987654321001');
EXEC delete_patient('987654321002');

-- DELETE 2 Pharmacy Records
EXEC delete_pharmacy('PharmCity');
EXEC delete_pharmacy('MediCare Pharmacy');

-- DELETE 2 Pharma Company Records
EXEC delete_pharma_company('PharmaCo');
EXEC delete_pharma_company('Medica Ltd');

-- DELETE 2 Drug Records
EXEC delete_drug('Aspirin', 'PharmaCo');
EXEC delete_drug('Paracetamol', 'Medica Ltd');

-- DELETE 2 Consultation Records
EXEC delete_consultation('123456789001', '987654321001');
EXEC delete_consultation('123456789002', '987654321002');

-- DELETE 2 Prescription Records
EXEC delete_prescription('987654321001', '123456789001', 'Aspirin', 'PharmaCo', TO_DATE('2025-04-19', 'YYYY-MM-DD'));
EXEC delete_prescription('987654321002', '123456789002', 'Paracetamol', 'Medica Ltd', TO_DATE('2025-04-20', 'YYYY-MM-DD'));

-- DELETE 2 Drug Sale Records
EXEC delete_sale('PharmCity', 'Aspirin', 'PharmaCo');
EXEC delete_sale('MediCare Pharmacy', 'Paracetamol', 'Medica Ltd');

-- DELETE 2 Contract Records
EXEC delete_contract('PharmaCo', 'PharmCity', TO_DATE('2025-05-01', 'YYYY-MM-DD'));
EXEC delete_contract('Medica Ltd', 'MediCare Pharmacy', TO_DATE('2025-05-01', 'YYYY-MM-DD'));

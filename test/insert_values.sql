-- INSERT TEST DATA (5 records each)
EXEC add_doctor('123456789001', 'Dr. John Smith', 'Cardiologist', 15);
EXEC add_doctor('123456789002', 'Dr. Emily White', 'Dermatologist', 10);
EXEC add_doctor('123456789003', 'Dr. Michael Brown', 'Orthopedic', 20);
EXEC add_doctor('123456789004', 'Dr. Sarah Lee', 'Pediatrician', 5);
EXEC add_doctor('123456789005', 'Dr. David Green', 'Neurologist', 12);

EXEC add_patient('987654321001', 'Alice Johnson', 45, '123 Elm St, City', '123456789001');
EXEC add_patient('987654321002', 'Bob Martinez', 34, '456 Oak St, City', '123456789002');
EXEC add_patient('987654321003', 'Charlie Davis', 50, '789 Pine St, City', '123456789003');
EXEC add_patient('987654321004', 'Diana Clark', 28, '101 Maple St, City', '123456789004');
EXEC add_patient('987654321005', 'Eva White', 65, '202 Birch St, City', '123456789005');

EXEC add_pharmacy('PharmCity', '456 Market St, City', '555-1234');
EXEC add_pharmacy('MediCare Pharmacy', '789 High St, City', '555-5678');
EXEC add_pharmacy('HealthPlus', '123 Oak St, City', '555-8765');
EXEC add_pharmacy('Wellness Pharm', '101 Elm St, City', '555-3456');
EXEC add_pharmacy('LifeCare Pharmacy', '202 Pine St, City', '555-2345');

EXEC add_pharma_company('PharmaCo', '555-5678');
EXEC add_pharma_company('Medica Ltd', '555-6789');
EXEC add_pharma_company('BioPharm', '555-7890');
EXEC add_pharma_company('HealthCorp', '555-8901');
EXEC add_pharma_company('CureCo', '555-9012');

EXEC add_drug('Aspirin', 'PharmaCo', 'C9H8O4');
EXEC add_drug('Levocet', 'PharmaCo', 'C10H11');
EXEC add_drug('Drug 3', 'PharmaCo', 'C14H20O24');
EXEC add_drug('Drug 4', 'Medica Ltd', 'C11H19N20');
EXEC add_drug('Paracetamol', 'Medica Ltd', 'C8H9NO2');
EXEC add_drug('Ibuprofen', 'BioPharm', 'C13H18O2');
EXEC add_drug('Amoxicillin', 'HealthCorp', 'C16H19N3O5S');
EXEC add_drug('Cetirizine', 'CureCo', 'C21H25ClN2O3');

EXEC add_consultation('123456789001', '987654321001');
EXEC add_consultation('123456789001', '987654321002')
EXEC add_consultation('123456789002', '987654321002');
EXEC add_consultation('123456789003', '987654321003');
EXEC add_consultation('123456789004', '987654321004');
EXEC add_consultation('123456789005', '987654321005');

EXEC add_prescription('123456789001', '987654321001', 'Aspirin', 'PharmaCo', TO_DATE('2025-04-19', 'YYYY-MM-DD'), 30);
EXEC add_prescription('123456789003', '987654321001', 'Aspirin', 'PharmaCo', TO_DATE('2025-04-21', 'YYYY-MM-DD'), 40);
EXEC add_prescription('123456789002', '987654321001', 'Aspirin', 'PharmaCo', TO_DATE('2025-04-25', 'YYYY-MM-DD'), 50);
EXEC add_prescription('123456789002', '987654321002', 'Paracetamol', 'Medica Ltd', TO_DATE('2025-04-20', 'YYYY-MM-DD'), 20);
EXEC add_prescription('123456789003', '987654321003', 'Ibuprofen', 'BioPharm', TO_DATE('2025-04-21', 'YYYY-MM-DD'), 15);
EXEC add_prescription('123456789004', '987654321004', 'Amoxicillin', 'HealthCorp', TO_DATE('2025-04-22', 'YYYY-MM-DD'), 10);
EXEC add_prescription('123456789005', '987654321005', 'Cetirizine', 'CureCo', TO_DATE('2025-04-23', 'YYYY-MM-DD'), 25);

EXEC add_drug_sale('PharmCity', 'Aspirin', 'PharmaCo', 10.99, 100);
EXEC add_drug_sale('MediCare Pharmacy', 'Paracetamol', 'Medica Ltd', 5.99, 100);
EXEC add_drug_sale('HealthPlus', 'Ibuprofen', 'BioPharm', 8.99, 100);
EXEC add_drug_sale('Wellness Pharm', 'Amoxicillin', 'HealthCorp', 12.99, 100);
EXEC add_drug_sale('LifeCare Pharmacy', 'Cetirizine', 'CureCo', 7.99, 100);

EXEC add_contract('PharmaCo', 'PharmCity', TO_DATE('2025-05-01', 'YYYY-MM-DD'), TO_DATE('2026-05-01', 'YYYY-MM-DD'), 'Supply agreement for Aspirin and other medications', 'Super123');
EXEC add_contract('Medica Ltd', 'MediCare Pharmacy', TO_DATE('2025-05-01', 'YYYY-MM-DD'), TO_DATE('2026-05-01', 'YYYY-MM-DD'), 'Supply agreement for Paracetamol and other medications', 'Super234');
EXEC add_contract('BioPharm', 'HealthPlus', TO_DATE('2025-05-01', 'YYYY-MM-DD'), TO_DATE('2026-05-01', 'YYYY-MM-DD'), 'Supply agreement for Ibuprofen and other medications', 'Super345');
EXEC add_contract('HealthCorp', 'Wellness Pharm', TO_DATE('2025-05-01', 'YYYY-MM-DD'), TO_DATE('2026-05-01', 'YYYY-MM-DD'), 'Supply agreement for Amoxicillin and other medications', 'Super456');
EXEC add_contract('CureCo', 'LifeCare Pharmacy', TO_DATE('2025-05-01', 'YYYY-MM-DD'), TO_DATE('2026-05-01', 'YYYY-MM-DD'), 'Supply agreement for Cetirizine and other medications', 'Super567');
EXEC update_patient('987654321001', 'Alice Thompson', 46, '124 Oak St, City', '123456789001');
EXEC update_doctor('123456789001', 'Dr. Johnathan Smith', 'Cardiologist', 16);
EXEC update_pharmacy('PharmCity', '457 Market St, City', '555-5678');
EXEC update_pc('PharmaCo', '555-9999');
EXEC update_drug('Aspirin', 'PharmaCo', 'C9H8O5');
EXEC update_sale('PharmCity', 'Aspirin', 'PharmaCo', 11.99);
EXEC update_contract('PharmaCo', 'PharmCity', TO_DATE('2025-05-01', 'YYYY-MM-DD'), TO_DATE('2026-05-01', 'YYYY-MM-DD'), 'Updated supply terms again', 'Supervisor1234');

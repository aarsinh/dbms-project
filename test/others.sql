EXEC patients_list('123456789001');
EXEC display_drug_details('PharmaCo');
EXEC display_drug_details('Medica Ltd');
EXEC print_prescription_details('987654321001', TO_DATE('2025-04-19', 'YYYY-MM-DD'));
EXEC print_prescriptions_in_range('987654321001', TO_DATE('2025-04-19', 'YYYY-MM-DD'), TO_DATE('2025-04-19', 'YYYY-MM-DD'));
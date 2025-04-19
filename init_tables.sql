-- Create doctors table
CREATE TABLE doctors (
    aadharID VARCHAR2(12) PRIMARY KEY NOT NULL,
    dname VARCHAR2(50) NOT NULL,
    speciality VARCHAR2(50) NOT NULL,
    yrs_exp INTEGER NOT NULL
);

-- Create patient table (FK to be added later)
CREATE TABLE patients (
    aadharID VARCHAR2(12) PRIMARY KEY NOT NULL,
    pname VARCHAR2(50) NOT NULL,
    age INTEGER NOT NULL,
    home_address VARCHAR2(50) NOT NULL,
    primary_physician VARCHAR2(12) NOT NULL
);

-- Create pharmacies table
CREATE TABLE pharmacies (
    phname VARCHAR2(50) PRIMARY KEY NOT NULL,
    address VARCHAR2(50) NOT NULL,
    phone VARCHAR2(50) NOT NULL
);

-- Create pharma companies table
CREATE TABLE pharma_companies (
    pcname VARCHAR2(50) PRIMARY KEY NOT NULL,
    phone VARCHAR2(50) NOT NULL
);

-- Create drug table (FK to be added later)
CREATE TABLE drugs (
    trdname VARCHAR2(50) NOT NULL,
    pcname VARCHAR2(50) NOT NULL,
    formula VARCHAR2(50) NOT NULL,
    PRIMARY KEY(trdname, pcname)
);

-- Create consultations table (FKs to be added later)
CREATE TABLE consultations (
    doctorID VARCHAR2(12) NOT NULL,
    patientID VARCHAR2(12) NOT NULL,
    PRIMARY KEY(doctorID, patientID)
);

-- Create prescriptions table (FKs to be added later)
CREATE TABLE prescriptions (
    doctorID VARCHAR2(12) NOT NULL,
    patientID VARCHAR2(12) NOT NULL,
    drug_name VARCHAR2(50) NOT NULL,
    pcname VARCHAR2(50) NOT NULL,
    prescription_date DATE NOT NULL,
    quantity INTEGER NOT NULL, 
    PRIMARY KEY(doctorID, patientID, drug_name, pcname)
);

-- Create drug sales table (FKs to be added later)
CREATE TABLE drug_sales (
    phname VARCHAR2(50) NOT NULL,
    drug_name VARCHAR2(50) NOT NULL,
    pcname VARCHAR2(50) NOT NULL,
    drug_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY(phname, drug_name, pcname)
);

-- Create contracts table (FKs to be added later)
CREATE TABLE contracts (
    pcname VARCHAR2(50) NOT NULL,
    phname VARCHAR2(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    content VARCHAR2(1000) NOT NULL,
    supervisorID VARCHAR2(50) NOT NULL,
    PRIMARY KEY (pcname, phname)
);

-- ADDING FOREIGN KEY CONSTRAINTS
ALTER TABLE patients
ADD CONSTRAINT fk_patients_doctor FOREIGN KEY (primary_physician)
REFERENCES doctors(aadharID);

ALTER TABLE drugs
ADD CONSTRAINT fk_drugs_company FOREIGN KEY (pcname)
REFERENCES pharma_companies(pcname);

ALTER TABLE consultations
ADD CONSTRAINT fk_consultations_doctor FOREIGN KEY (doctorID)
REFERENCES doctors(aadharID);

ALTER TABLE consultations
ADD CONSTRAINT fk_consultations_patient FOREIGN KEY (patientID)
REFERENCES patients(aadharID);

ALTER TABLE prescriptions
ADD CONSTRAINT fk_presc_doctor FOREIGN KEY (doctorID)
REFERENCES doctors(aadharID);

ALTER TABLE prescriptions
ADD CONSTRAINT fk_presc_patient FOREIGN KEY (patientID)
REFERENCES patients(aadharID);

ALTER TABLE prescriptions
ADD CONSTRAINT fk_presc_drug FOREIGN KEY (drug_name, pcname)
REFERENCES drugs(trdname, pcname);

ALTER TABLE drug_sales
ADD CONSTRAINT fk_sales_pharmacy FOREIGN KEY (phname)
REFERENCES pharmacies(phname);

ALTER TABLE drug_sales
ADD CONSTRAINT fk_sales_drug FOREIGN KEY (drug_name, pcname)
REFERENCES drugs(trdname, pcname);

ALTER TABLE contracts
ADD CONSTRAINT fk_contracts_company FOREIGN KEY (pcname)
REFERENCES pharma_companies(pcname);

ALTER TABLE contracts
ADD CONSTRAINT fk_contracts_pharmacy FOREIGN KEY (phname)
REFERENCES pharmacies(phname);
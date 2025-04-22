-- Create doctors table
CREATE TABLE doctors (
    aadharID VARCHAR2(12) PRIMARY KEY NOT NULL,
    dname VARCHAR2(50) NOT NULL,
    speciality VARCHAR2(50) NOT NULL,
    yrs_exp INTEGER NOT NULL
);

-- Create patient table
CREATE TABLE patients (
    aadharID VARCHAR2(12) PRIMARY KEY NOT NULL,
    pname VARCHAR2(50) NOT NULL,
    age INTEGER NOT NULL,
    home_address VARCHAR2(50) NOT NULL,
    primary_physician VARCHAR2(12) NOT NULL,
    FOREIGN KEY(primary_physician) REFERENCES doctors(aadharID) ON DELETE CASCADE 
);

-- Create pharmacies table
CREATE TABLE pharmacies (
    phname VARCHAR2(50) PRIMARY KEY NOT NULL,
    pharma_address VARCHAR2(50) NOT NULL,
    phone VARCHAR2(50) NOT NULL
);

-- Create pharma companies table
CREATE TABLE pharma_companies (
    pcname VARCHAR2(50) PRIMARY KEY NOT NULL,
    phone VARCHAR2(50) NOT NULL
);

-- Create drug table
CREATE TABLE drugs (
    trdname VARCHAR2(50) NOT NULL,
    pcname VARCHAR2(50) NOT NULL,
    formula VARCHAR2(50) NOT NULL,
    PRIMARY KEY(trdname, pcname),
    FOREIGN KEY(pcname) REFERENCES pharma_companies(pcname) ON DELETE CASCADE
);

-- Create consultations table 
CREATE TABLE consultations (
    doctorID VARCHAR2(12) NOT NULL,
    patientID VARCHAR2(12) NOT NULL,
    PRIMARY KEY(doctorID, patientID),
    FOREIGN KEY(doctorID) REFERENCES doctors(aadharID) ON DELETE CASCADE,
    FOREIGN KEY(patientID) REFERENCES patients(aadharID) ON DELETE CASCADE
);

-- Create prescriptions table
CREATE TABLE prescriptions (
    doctorID VARCHAR2(12) NOT NULL,
    patientID VARCHAR2(12) NOT NULL,
    drug_name VARCHAR2(50) NOT NULL,
    pcname VARCHAR2(50) NOT NULL,
    prescription_date DATE NOT NULL,
    quantity INTEGER NOT NULL, 
    PRIMARY KEY(doctorID, patientID, drug_name, pcname, prescription_date),
    FOREIGN KEY(doctorID) REFERENCES doctors(aadharID) ON DELETE CASCADE,
    FOREIGN KEY(patientID) REFERENCES patients(aadharID) ON DELETE CASCADE,
    FOREIGN KEY(drug_name, pcname) REFERENCES drugs(trdname, pcname) ON DELETE CASCADE
);

-- Create drug sales table 
CREATE TABLE drug_sales (
    phname VARCHAR2(50) NOT NULL,
    drug_name VARCHAR2(50) NOT NULL,
    pcname VARCHAR2(50) NOT NULL,
    drug_price DECIMAL(10, 2) NOT NULL,
    quantity INTEGER NOT NULL,
    PRIMARY KEY(phname, drug_name, pcname),
    FOREIGN KEY (phname) REFERENCES pharmacies(phname) ON DELETE CASCADE,
    FOREIGN KEY(drug_name, pcname) REFERENCES drugs(trdname, pcname) ON DELETE CASCADE
);

-- Create contracts table 
CREATE TABLE contracts (
    pcname VARCHAR2(50) NOT NULL,
    phname VARCHAR2(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    content CLOB NOT NULL,
    supervisorID VARCHAR2(50) NOT NULL,
    PRIMARY KEY (pcname, phname, start_date),
    FOREIGN KEY(pcname) REFERENCES pharma_companies(pcname) ON DELETE CASCADE,
    FOREIGN KEY (phname) REFERENCES pharmacies(phname) ON DELETE CASCADE
);
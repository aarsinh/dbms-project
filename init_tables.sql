-- Create patient table
CREATE TABLE patients (
    aadharID VARCHAR(12) PRIMARY KEY NOT NULL,
    pname VARCHAR(50) NOT NULL,
    age INTEGER NOT NULL,
    address VARCHAR(50) NOT NULL,
    primary_physician VARCHAR(12) NOT NULL,
    FOREIGN KEY(primary_physician) REFERENCES doctors(aadharID)
);

-- Create doctors table
CREATE TABLE doctors (
    aadharID VARCHAR(12) PRIMARY KEY NOT NULL,
    dname VARCHAR(50) NOT NULL,
    speciality VARCHAR(50) NOT NULL,
    yrs_exp INTEGER NOT NULL
);

-- Create drug table
CREATE TABLE drugs (
    trdname VARCHAR(50) NOT NULL,
    pcname VARCHAR(50) NOT NULL,
    formula VARCHAR(50) NOT NULL,
    PRIMARY KEY(trdname, pcname),
    FOREIGN KEY(pcname) REFERENCES pharma_companies(pcname)
);

-- Create pharmacies table
CREATE TABLE pharmacies (
    phname VARCHAR(50) PRIMARY KEY NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL
);

-- Create pharma companies table
CREATE TABLE pharma_companies (
    pcname VARCHAR(50) PRIMARY KEY NOT NULL,
    phone VARCHAR(50) NOT NULL
);

-- Create consults table(relship between patient and doctor)
CREATE TABLE consultations (
    doctorID VARCHAR(12) NOT NULL,
    patientID VARCHAR(12) NOT NULL,
    PRIMARY KEY(doctorID, patientID),
    FOREIGN KEY(doctorID) REFERENCES doctors(aadharID),
    FOREIGN KEY(patientID) REFERENCES patients(aadharID)
);

-- Create prescriptions table(relship between patient, drug, doctor)
CREATE TABLE prescriptions (
    doctorID VARCHAR(12) NOT NULL,
    patientID VARCHAR(12) NOT NULL,
    drug_name VARCHAR(50) NOT NULL,
    pcname VARCHAR(50) NOT NULL,
    prescription_date DATETIME NOT NULL,
    quantity INTEGER NOT NULL, 
    PRIMARY KEY(doctorID, patientID, drug_name, pcname),
    FOREIGN KEY(doctorID) REFERENCES doctors(aadharID),
    FOREIGN KEY(patientID) REFERENCES patients(aadharID),
    FOREIGN KEY(drug_name, pcname) REFERENCES drugs(trdname, pcname)
);

-- Create drug sales table(relationship between pharma and drug)
CREATE TABLE drug_sales (
    phname VARCHAR(50) NOT NULL,
    drug_name VARCHAR(50) NOT NULL,
    pcname VARCHAR(50) NOT NULL,
    drug_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY(phname, drug_name, pcname),
    FOREIGN KEY (phname) REFERENCES pharmacies(phname),
    FOREIGN KEY(drug_name, pcname) REFERENCES drugs(trdname, pcname)
);

-- Create contracts table(relship between pc and pharma)
CREATE TABLE contracts (
    pcname VARCHAR(50) NOT NULL,
    phname VARCHAR(50) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    content VARCHAR(65535) NOT NULL,
    supervisorID VARCHAR(50) NOT NULL,
    PRIMARY KEY (pcname, phname),
    FOREIGN KEY(pcname) REFERENCES pharma_companies(pcname),
    FOREIGN KEY (phname) REFERENCES pharmacies(phname)
);
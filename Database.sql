

-- Sử dụng cơ sở dữ liệu vừa tạo
CREATE DATABASE DBBV;
GO

USE DBBV;
GO

-- Bảng địa điểm (location)
CREATE TABLE location (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    name NVARCHAR(255),
    address NVARCHAR(255)
);

GO

-- Bảng điều trị (treatment)
CREATE TABLE treatment (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    name NVARCHAR(255),
    description NVARCHAR(255)
);
GO

-- Bảng khoa/phòng ban (department)
CREATE TABLE department (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    name NVARCHAR(255),
    location_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (location_id) REFERENCES location(id)
);
GO

-- Bảng bác sĩ (doctor)
CREATE TABLE doctor (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    name NVARCHAR(255),
    address NVARCHAR(255),
    degree NVARCHAR(255),
    phone NVARCHAR(255),
    department_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(id)
);
GO

-- Bảng bệnh nhân (patient)
CREATE TABLE patient (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    name NVARCHAR(255),
    address NVARCHAR(255),
    dob DATE,
    gender NVARCHAR(255),
    phone NVARCHAR(255),
    department_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(id)
);
GO

-- Bảng phác đồ điều trị (treatment_regime)
CREATE TABLE treatment_regime (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    time DATETIME,
    price FLOAT,
    doctor_id VARCHAR(255) NOT NULL,
    treatment_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES doctor(id),
    FOREIGN KEY (treatment_id) REFERENCES treatment(id)
);
GO

-- Bảng ghi nhận điều trị (treatment_record)
CREATE TABLE treatment_record (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    description NVARCHAR(255),
    result NVARCHAR(255),
    treatment_regime_id VARCHAR(255) NOT NULL,
    patient_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (treatment_regime_id) REFERENCES treatment_regime(id),
    FOREIGN KEY (patient_id) REFERENCES patient(id)
);
GO

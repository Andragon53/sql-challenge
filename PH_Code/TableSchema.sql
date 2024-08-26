-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/

CREATE TABLE Titles (
    title_id VARCHAR(5) NOT NULL UNIQUE,
    title VARCHAR(50) NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE Employees (
    emp_no INTEGER NOT NULL UNIQUE,
    emp_title VARCHAR(5) NOT NULL,
    birth_date DATE,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex VARCHAR(5) NOT NULL,
    hire_date DATE,
    PRIMARY KEY (emp_no)
    FOREIGN KEY (emp_title) REFERENCES Titles (title_id);
);

CREATE TABLE Departments (
    dept_no VARCHAR(4) NOT NULL UNIQUE,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (dept_no)
);

CREATE TABLE EmployeeDepartments (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no)
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no);
    FOREIGN KEY (dept_no) REFERENCES Departments (dept_no);
);

CREATE TABLE DepartmentManager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INTEGER NOT NULL,
    PRIMARY KEY (dept_no, emp_no)
    FOREIGN KEY (dept_no) REFERENCES Departments (dept_no);
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no);
);

CREATE TABLE Salaries (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    PRIMARY KEY (emp_no)
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no);
);
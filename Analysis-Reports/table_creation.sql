-- Create the employees table
CREATE TABLE employees (
  emp_no INT PRIMARY KEY NOT NULL,
  emp_title VARCHAR(5) NOT NULL,
  birth_date DATE,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  sex VARCHAR(1) NOT NULL,
  hire_date DATE NOT NULL
);

-- Create the title tables
CREATE TABLE titles (
  title_id VARCHAR(5) PRIMARY KEY NOT NULL,
  title VARCHAR(50) NOT NULL
);

-- Add a foreign key reference into the employees table
ALTER TABLE employees
ADD FOREIGN KEY(emp_title)
REFERENCES titles(title_id)
ON DELETE SET NULL;

-- Create the salaries tables
-- Include the foreign key since the employees table has already been created
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary VARCHAR(50) NOT NULL,
  PRIMARY KEY(emp_no),
  FOREIGN KEY(emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE
);

-- Create the departments table
CREATE TABLE departments (
  dept_no VARCHAR(5) PRIMARY KEY NOT NULL,
  dept_name VARCHAR(50) 
);

-- Create the dept_emp table
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(5) NOT NULL,
  PRIMARY KEY(emp_no, dept_no),
  FOREIGN KEY(emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE,
  FOREIGN KEY(dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE
);

-- Create the dept_manager table
CREATE TABLE dept_manager (
  dept_no VARCHAR(5) NOT NULL,
  emp_no INT NOT NULL,
  PRIMARY KEY(dept_no, emp_no),
  FOREIGN KEY(dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE,
  FOREIGN KEY(emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE
);

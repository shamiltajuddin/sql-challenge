----Data Engineering (PART 2):


CREATE TABLE employees(
	"emp_no" INT NOT NULL,
	"birth_date" DATE NOT NULL,
	"first_name" VARCHAR NOT NULL,
	"last_name" VARCHAR NOT NULL,
	"gender" VARCHAR NOT NULL,
	"hire_date" DATE NOT NULL,
		PRIMARY KEY ("emp_no")
);

SELECT * from employees;

CREATE TABLE departments(
	"dept_no" VARCHAR NOT NULL,
	"dept_name" VARCHAR NOT NULL,
		PRIMARY KEY ("dept_no")
);

SELECT * from departments;

CREATE TABLE department_employees(
	"emp_no" INT NOT NULL,
	"dept_no" VARCHAR NOT NULL,
	"from_date" DATE NOT NULL,
	"to_date" DATE NOT NULL,
		FOREIGN KEY ("emp_no") REFERENCES employees("emp_no"),
		FOREIGN KEY ("dept_no") REFERENCES departments ("dept_no")
);

SELECT * from department_employees;

CREATE TABLE department_manager(
	"dept_no" VARCHAR NOT NULL,
	"emp_no" INT NOT NULL,
	"from_date" DATE NOT NULL,
	"to_date" DATE NOT NULL,
		FOREIGN KEY ("emp_no") REFERENCES employees("emp_no"),
		FOREIGN KEY ("dept_no") REFERENCES departments ("dept_no")
);	

SELECT * from department_manager;

CREATE TABLE salaries(
	"emp_no" INT NOT NULL,
	"salary" INT NOT NULL,
	"from_date" DATE NOT NULL,
	"to_date" DATE NOT NULL,
		FOREIGN KEY ("emp_no") REFERENCES employees("emp_no")
);

SELECT * from salaries;

CREATE TABLE titles(
	"emp_no" INT NOT NULL,
	"title" VARCHAR NOT NULL,
	"from_date" DATE NOT NULL,
	"to_date" DATE NOT NULL,
		FOREIGN KEY ("emp_no") REFERENCES employees("emp_no")
);

SELECT * from titles; 
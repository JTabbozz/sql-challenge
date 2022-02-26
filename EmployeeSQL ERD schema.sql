-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- EmployeeSQL ERD

CREATE TABLE "Department" (
    "dept_noID" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_noID"
     )
);

CREATE TABLE "Dept_emp" (
    "emp_no_id" INT   NOT NULL,
    "dep_no_id" VARCHAR   NOT NULL
);

CREATE TABLE "Dept_manager" (
    "dept_no_id" VARCHAR   NOT NULL,
    "emp_no_id" INT   NOT NULL
);

CREATE TABLE "Employee" (
    "emp_noID" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "emp_noID"
     )
);

CREATE TABLE "Salaries" (
    "emp_no_id" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "Title" (
    "titleID" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Title" PRIMARY KEY (
        "titleID"
     )
);

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no_id" FOREIGN KEY("emp_no_id")
REFERENCES "Employee" ("emp_noID");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dep_no_id" FOREIGN KEY("dep_no_id")
REFERENCES "Department" ("dept_noID");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_dept_no_id" FOREIGN KEY("dept_no_id")
REFERENCES "Department" ("dept_noID");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_emp_no_id" FOREIGN KEY("emp_no_id")
REFERENCES "Employee" ("emp_noID");

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Title" ("titleID");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no_id" FOREIGN KEY("emp_no_id")
REFERENCES "Employee" ("emp_noID");


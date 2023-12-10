create database NSDL;
use nsdl;
create table employee(
empployee_id int primary key auto_increment,
first_name char(10),
last_name char(10),
city char(10),
state varchar(20)
);
alter table employee add column joining_date varchar(20);
alter table employee add column designation char(20);
create table department(
department_id int primary key auto_increment,
department_name varchar(20)
);
create table salary(
salary_id int primary key auto_increment,
gross_salary bigint,
hourly_pay bigint,
state_tax bigint,
federal_tax bigint,
account_id bigint
);
create table attendance(
attendance_id int primary key auto_increment,
hours_worked time
);
create table Worklocaion(
Location_id int primary key auto_increment,
city char(10),
state char(20),
pin_code bigint
);
create table accounts_details(
account_id int primary key auto_increment,
bank_name varchar(20),
account_num varchar(20)
);

create table projects(
project_id int primary key auto_increment,
project_name varchar(20)
);
#adding foreign key to account_details table
alter table accounts_details add column emp_id int;
alter table accounts_details add foreign key (emp_id) references employee(empployee_id);
alter  table accounts_details drop column e_id;
alter table accounts_details add column sal_id int;
alter table accounts_details add foreign key (sal_id) references salary (salary_id);

#adding foreign key to salary table
alter table salary add column acc_id int;
alter table salary add foreign key (acc_id) references accounts_details(account_id);
alter table salary add column emp_id int;
alter table salary add foreign key (emp_id) references employee(empployee_id);
alter table salary drop column account_id;

#adding foreign key to attendance table 
alter table attendance add column e_id int;
alter table attendance add foreign key (e_id) references employee (empployee_id);

#adding foreign key to worklaocation table 
alter table worklocaion add column emp_id int;
alter table worklocaion add foreign key (emp_id) references employee (empployee_id);

#adding foreign key to department table
alter table department add column emp_id int;
alter table department add column pro_id int;
alter table department add foreign key (emp_id) references employee (empployee_id);
alter table department add foreign key (pro_id) references employee (empployee_id);

#adding foreign key to project table 
alter table projects add column dep_id int;
alter table projects add column emp_id int;
alter table projects add foreign key (dep_id) references department (department_id);
alter table projects add foreign key (emp_id) references employee (empployee_id);


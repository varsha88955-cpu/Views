
-- 1. Create a view to display all employee details.
create view vw_all_employees as select * from employee;


-- 2. Create a view to display emp_id, emp_name, and salary.
create view vw_id_name_salary as select emp_id, emp_name, salary from employee;


-- 3. Create a view to display emp_name and department.
create view vw_name_department as select emp_name, department from employee;


-- 4. Create a view to display IT employees.
create view vw_it_employees as select * from employee where department = 'IT';


-- 5. Create a view to display HR employees.
create view vw_hr_employees as select * from employee where department = 'HR';


-- 6. Create a view to display Hyderabad employees.
create view vw_hyderabad_employees as select * from employee where city = 'Hyderabad';


-- 7. Create a view to display employees with salary greater than 40,000.
create view vw_salary_gt_40000 as select * from employee where salary > 40000;


-- 8. Create a view to display employees whose age is greater than 25.
create view vw_age_gt_25 as select * from employee where age > 25;


-- 9. Create a view to display employees with salary between 30,000 and 60,000.
create view vw_salary_between_30k_60k as select * from employee where salary between 30000 and 60000;


-- 10. Create a view to display employees whose name starts with A.
create view vw_name_starts_with_A as select * from employee where emp_name like 'A%';


-- 11. Create a view to display IT employees with salary greater than 50,000.
create view vw_it_salary_gt_50000 as select * from employee where department = 'IT' and salary > 50000;


-- 12. Create a view to display Hyderabad employees with salary less than 60,000.
create view vw_hyderabad_salary_lt_60000 as select * from employee where city = 'Hyderabad' and salary < 60000;


-- 13. Create a view to display employees whose age is between 25 and 30.
create view vw_age_between_25_30 as select * from employee where age between 25 and 30;


-- 14. Create a view to display employees who are not from Chennai.
create view vw_not_chennai as select * from employee where city != 'Chennai';


-- 15. Create a view to display IT and HR employees.
create view vw_it_hr_employees as select * from employee where department in ('IT', 'HR');


-- 16. Create a view to display employees with salary > 40,000 and age > 25.
create view vw_salary_gt_40000_and_age_gt_25 as select * from employee where salary > 40000 and age > 25;


-- 17. Create a view to display Hyderabad or Bangalore employees.
create view vw_hyderabad_or_bangalore as select * from employee where city in ('Hyderabad', 'Bangalore');


-- 18. Create a view to display employees whose salary is not equal to 40,000.
create view vw_salary_not_40000 as select * from employee where salary != 40000;


-- 19. Create a view to display employees who are not in Finance.
create view vw_department_not_finance as select * from employee where department != 'Finance';


-- 20. Create a view to display employees whose name contains the letter 'a' (case-insensitive).
create view vw_name_contains_a as select * from employee where lower(emp_name) like '%a%';


-- DATA MANIPULATION THROUGH VIEWS


-- 21. Using vw_all_employees, update Karthik's salary to 55,000.
update vw_all_employees set salary = 55000 where emp_name = 'Karthik';


-- 22. Using vw_id_name_salary, update Rahul's salary to 38,000.
update vw_id_name_salary set salary = 38000 where emp_name = 'Rahul';


-- 23. Using vw_it_employees, update Priya's salary to 65,000.
update vw_it_employees set salary = 65000 where emp_name = 'Priya';


-- 24. Using vw_hyderabad_employees, update Arjun's salary to 45,000.
update vw_hyderabad_employees set salary = 45000 where emp_name = 'Arjun';


-- 25. Change Sneha's city to Hyderabad using a suitable view.
create view vw_name_city as select emp_name, city from employee;
update vw_name_city set city = 'Hyderabad' where emp_name = 'Sneha';


-- 26. Using vw_salary_gt_40000, update Divya's salary to 75,000.
update vw_salary_gt_40000 set salary = 75000 where emp_name = 'Divya';


-- 27. Create a view showing employee name and age, then update Pooja's age to 24.
create view vw_name_age as select emp_name, age from employee;
update vw_name_age set age = 24 where emp_name = 'Pooja';


-- 28. Create a view showing emp_id, department, and salary, then change Manoj's department to IT.
create view vw_id_dept_salary as select emp_id, department, salary from employee;
update vw_id_dept_salary set department = 'IT' where emp_id = (select emp_id from employee where emp_name = 'Manoj' limit 1);


-- 29. Using vw_hr_employees, change Arjun's salary to 42,000.
update vw_hr_employees set salary = 42000 where emp_name = 'Arjun';


-- 30. Increase every IT employee's salary by 5,000.
update vw_it_employees set salary = salary + 5000;


-- 31. Insert a new IT employee using vw_it_employees (provide all required columns).
insert into vw_it_employees values (101, 'Ramesh', 50000, 25, 'IT', 'Hyderabad');


-- 32. Attempt to insert a Chennai employee using vw_hyderabad_employees.
insert into vw_hyderabad_employees values (102, 'Suresh', 40000, 26, 'HR', 'Chennai');


-- 33. Attempt to insert an employee with salary 30,000 using vw_salary_gt_40000.
insert into vw_salary_gt_40000 values (103, 'Anil', 30000, 24, 'IT', 'Hyderabad');


-- 34. Attempt to insert an employee aged 22 using vw_age_gt_25.
insert into vw_age_gt_25 values (104, 'Ajay', 45000, 22, 'HR', 'Bangalore');


-- 35. Attempt to insert a Finance employee using vw_hr_employees.
insert into vw_hr_employees values (105, 'Kiran', 40000, 28, 'Finance', 'Chennai');


-- 36. Insert a new employee using vw_id_name_salary.
insert into vw_id_name_salary (emp_id, emp_name, salary) values (106, 'Ravi', 35000);


-- 37. Create a Bangalore view and attempt to insert a Hyderabad employee.
create view vw_bangalore_employees as select * from employee where city = 'Bangalore';
insert into vw_bangalore_employees values (107, 'Varun', 45000, 25, 'IT', 'Hyderabad');


-- 38. Create a view showing employees with salary less than 50,000 and attempt to insert an employee with salary 70,000.
create view vw_salary_lt_50000 as select * from employee where salary < 50000;
insert into vw_salary_lt_50000 values (108, 'Rohit', 70000, 27, 'HR', 'Hyderabad');

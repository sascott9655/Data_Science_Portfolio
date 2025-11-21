select e.employeeNumber, e.firstName, e.lastName from employees e inner join offices o on e.officeCode = o.officeCode and o.city like '%Boston%';

-- Write a query will retrieve the phone number (office phone number, followed by extension) of the president of the company
SELECT phone, jobTitle FROM offices JOIN employees on offices.officeCode = employees.officeCode WHERE jobTitle LIKE '%President%';


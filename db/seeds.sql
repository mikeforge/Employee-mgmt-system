INSERT INTO department (dept_name)
VALUES 
('Front of House'),
('Back of House');


INSERT INTO role (title, salary, department_id)
VALUES
('Server', 60000, (select id from department where dept_name ='Front of House')),
('Host', 25000, (select id from department where dept_name ='Front of House')),
('Busser', 25000, (select id from department where dept_name ='Front of House')),
('Bartender', 80000, (select id from department where dept_name ='Front of House')),
('Asst Mgr', 50000, (select id from department where dept_name ='Front of House')),
('General Mgr', 75000, (select id from department where dept_name ='Front of House')),
('Line cook', 35000, (select id from department where dept_name = 'Back of House')),
('Sous Chef', 50000, (select id from department where dept_name = 'Back of House')),
('Pastry Chef', 45000, (select id from department where dept_name = 'Back of House')),
('Head Chef', 75000, (select id from department where dept_name = 'Back of House')),
('Dishwasher', 20000, (select id from department where dept_name = 'Back of House')),
('Prep Cook', 30000, (select id from department where dept_name = 'Back of House'));


INSERT INTO  employee (first_name, last_name, role_id, mgr_id)
VALUES
('John', 'Smith', (select r.id from role r where r.title = 'Head Chef'), NULL),
('Susan', 'Smith', (select r.id from role r where r.title = 'General Mgr'), NULL); 

INSERT INTO employee (first_name, last_name, role_id, mgr_id)
VALUES
('Liz', 'Otter', (select r.id from role r  where r.title = 'Pastry Chef'), (select e.id from employee e where e.first_name = 'John' and e.last_name = 'Smith')),
('Dude', 'Jackson', (select r.id from role r  where r.title = 'Sous Chef'), (select e.id from employee e where first_name = 'John' and last_name = 'Smith')),
('Guy', 'West', (select r.id from role r where r.title = 'Asst Mgr'), (select e.id from employee e where first_name = 'Susan' and last_name = 'Smith')),
('Carmen', 'Nifty', (select r.id from role r where r.title = 'Bartender'), (select e.id from employee e where first_name = 'Susan' and last_name = 'Smith')),
('Sally', 'Nifty', (select r.id from role r where r.title = 'Server'), (select e.id from employee e where first_name = 'Susan' and last_name = 'Smith')),
('Suzie', 'Nifty', (select r.id from role r where r.title = 'Host'), (select e.id from employee e where first_name = 'Guy' and last_name = 'West')),
('Bobby', 'Nifty', (select r.id from role r where r.title = 'Busser'), (select e.id from employee e where first_name = 'Guy' and last_name = 'West')),
('Jenny', 'Something', (select r.id from role r where r.title = 'Prep Cook'), (select e.id from employee e where first_name = 'Liz' and last_name = 'Otter')),
('George', 'Something', (select r.id from role r where r.title = 'Line cook'), (select e.id from employee e where first_name = 'Dude' and last_name = 'Jackson')),
('Mike', 'Something', (select r.id from role r where r.title = 'Dishwasher'), (select e.id from employee e where first_name = 'Dude' and last_name='Jackson'));

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


INSERT INTO  employee (first_name, last_name, role_id, manager_id)
VALUES
('John', 'Smith', select (r.id from role r JOIN department on d.id = r.department_id where title = 'Head Chef'), NULL),
('Susan', 'Smith', select (r.id from role r JOIN department on d.id = r.department_id where title = 'General Mgr'), NULL),
('Guy', 'West', select (r.id from role r JOIN department on d.id = r.department_id where title = 'Asst Mgr'), select(e.id from employee where title = 'General Mgr')),
('Carmen', 'Nifty', select (r.id from role r JOIN department on d.id = r.department_id where title = 'Bartender'), select(e.id from employee where title = 'General Mgr')),
('Sally', 'Nifty', select (r.id from role r JOIN department on d.id = r.department_id where title = 'Server'), select(e.id from employee where title = 'General Mgr')),
('Suzie', 'Nifty', select (r.id from role r JOIN department on d.id = r.department_id where title = 'Host'), select(e.id from employee where title = 'Asst Mgr')),
('Bobby', 'Nifty', select (r.id from role r JOIN department on d.id = r.department_id where title = 'Busser'), select(e.id from employee where title = 'Asst Mgr')),
('Mike', 'Something', select (r.id from role r JOIN department on d.id = r.department_id where title = 'Dishwasher'), select(e.id from employee where title = 'Sous Chef')),
('Jenny', 'Something', select (r.id from role r JOIN department on d.id = r.department_id where title = 'Prep Cook'), select(e.id from employee where title = 'Pastry Chef')),
('George', 'Something', select (r.id from role r JOIN department on d.id = r.department_id where title = 'Line cook'), select(e.id from employee where title = 'Sous Chef')),
('Liz', 'Otter', select (r.id from role r JOIN department on d.id = r.department_id where title = 'Pastry Chef'), select(e.id from employee where title = 'Sous Chef')),
('Humble', 'Johnson', select (r.id from role r JOIN department on d.id = r.department_id where title = 'Sous Chef'), select(e.id from employee where title = 'Head Chef')),
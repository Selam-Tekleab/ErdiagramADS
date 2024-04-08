CREATE TABLE dentist (
  	id int NOT NULL,
	firstname varchar(50) NULL,
	lastname varchar(50) NULL,
	contactphone varchar(50) NULL,
	email varchar(50) NULL,
	specialization varchar(50) NULL,
	PRIMARY KEY (id)
);

CREATE TABLE address (
	id int NOT NULL,
  	street varchar(50) NULL,
	state varchar(50) NULL,
	city varchar(50) NULL,
	zipcode int NULL,
	PRIMARY KEY (id)
);

CREATE TABLE patient (
	id int NOT NULL,
	firstname varchar(50) NULL,
	lastname varchar(50) NULL,
	phone varchar(50) NULL,
	email varchar(50) NULL,
	dob date NULL,
	a_id int,
	PRIMARY KEY (id),
	FOREIGN KEY (a_id) REFERENCES address(id)
);


CREATE TABLE surgerylocation (
	id int NOT NULL,
	name varchar(50) NULL,
	phonenumber varchar(50) NULL,
	a_id int,
	PRIMARY KEY (id),
	FOREIGN KEY (a_id) REFERENCES address(id)
);

CREATE TABLE appointment (
	id int NOT NULL,
	appdate date NULL,
	location varchar(50) NULL,
	status varchar(50) NULL,
	a_id int,
	d_id int,
	p_id int,
	PRIMARY KEY (id),
	FOREIGN KEY (a_id) REFERENCES address(id),
	FOREIGN KEY (d_id) REFERENCES dentist(id),
	FOREIGN KEY (p_id) REFERENCES patient(id)
);


INSERT INTO dentist (id, firstname, lastname, contactphone, email, specialization)
VALUES 
    (1, 'Selam', 'Tekleab', '222-222-2222', 'selam.tekleab@miu.edu', 'Doctor'),
    (2, 'Mary', 'Barry', '111-111-1111', 'mary.barry@miu.com', 'ENT');

INSERT INTO address (id, street, state, city, zipcode)
VALUES 
    (1, '2234 N 4th Street', 'MD', 'Silver Spring', 20906),
    (2, '5767 Town St', 'NY', 'New Jersey', 22334),
    (3, '14456 Elmont St', 'TX', 'Austin', 12464);

INSERT INTO patient (id, firstname, lastname, phone, email, dob, a_id)
VALUES 
    (1, 'Abebe', 'Beso', '222-333-4444', 'Abebe.beso@miu.com', '2000-05-10',1),
    (2, 'Bela', 'Betam', '555-666-7777', 'bela.betam@example.com', '1989-12-15',3);


INSERT INTO surgerylocation (id, name, phonenumber, a_id)
VALUES 
    (1, 'Faifiled clinic', '555-123-4567',2),
    (2, 'Austin Orthodontics Center', '555-987-6543',2);


INSERT INTO appointment (id, appdate, location, status, a_id, d_id, p_id)
VALUES 
    (1, '2024-12-2', 'Fairfield clinic', 'Scheduled', 2, 1, 1),
    (2, '2024-11-12', 'Austin Orthodontics Center', 'Scheduled', 2, 1, 2);


SELECT * FROM Dentist ORDER BY lastname  ASC;

SELECT A.*, P.firstname  AS patient_first_name, P.lastname  AS patient_last_name
FROM Appointment A
JOIN Patient P ON A.p_id  = P.id 
JOIN dentist d ON A.d_id = d.id 
WHERE A.d_id = d.id;


SELECT * FROM Appointment WHERE location = 'Fairfield clinic';

SELECT * 
FROM Appointment A
JOIN patient p on a.p_id  = p.id 
WHERE appdate  = '2024-12-2';

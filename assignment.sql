CREATE DATABASE assignment_1;
use assignment_1;

CREATE TABLE Sir_Usama(
id INT PRIMARY KEY IDENTITY(1,1),
names VARCHAR(200) NOT NULL,
Semester VARCHAR(200) NOT NULL
);

INSERT INTO Sir_Usama(names , Semester) VALUES ('Subhan' , '2ND Semester'),
('Subhan' , '3ND Semester'),
('Rehman' , '1ND Semester'),
('Ubaid' , '3ND Semester'),
('Zain' , '3ND Semester'),
('Faizan' , '1ND Semester'),
('Zakir' , '2ND Semester');

SELECT * FROM Sir_Usama;


CREATE TABLE Students(
std_id INT PRIMARY KEY IDENTITY(1,2),
names VARCHAR(200)NOT NULL,
subject varchar(200)NOT NULL
);

INSERT INTO Students(names , subject) VALUES ('Subhan' , 'SQL server'),
('Shazaib' , 'Java'),
('Rehman' , 'Html'),
('Ubaid' , 'SQL Server'),
('Zain' , 'JavaScript'),
('Faizan' , 'Bootstrap'),
('Zakir' , 'XML');

select * from Students;

CREATE TABLE Principle(
id INTEGER,
std_id INTEGER,
FOREIGN KEY(id) REFERENCES Sir_usama(id)ON DELETE CASCADE,
FOREIGN KEY(std_id) REFERENCES Students(std_id)ON DELETE CASCADE
);


INSERT INTO Principle(id , std_id) VALUES
(1,1),
(2,3),
(3,5),
(4,7),
(5,9),
(6,11),
(7,13);

--JOIN QUERY

SELECT * FROM Sir_usama JOIN students ON Sir_usama.id = students.std_id;


--VIEW QUERY

CREATE VIEW Sir_Usama_Students_Info AS
SELECT Sir_Usama.names AS Students_names, semester, subject
FROM Sir_Usama
JOIN Students ON Sir_Usama.names = Students.names;


SELECT * FROM Sir_Usama_Students_Info;

--SUBQUIRIES

SELECT * FROM Principle;
SELECT * FROM Students;
SELECT * FROM Sir_Usama;

select names from Sir_Usama where id in(
select std_id from Principle where id = (
select std_id from Students where Students.names = 'Subhan'
)
);

--TRIGGER QUERY

CREATE TABLE TC_STUDENTS(
Id INT PRIMARY KEY IDENTITY(1,2),
Names VARCHAR(200) NOT NULL,
Action VARCHAR(200)NOT NULL
);

SELECT * FROM TC_STUDENTS;
SELECT * FROM Students;
CREATE TRIGGER Bad_Students
ON students
AFTER DELETE
AS
BEGIN
    INSERT INTO TC_STUDENTS(Names, Action)
    SELECT Names, 'TC'
    FROM deleted;
END;

DELETE FROM Students WHERE names = 'zain';
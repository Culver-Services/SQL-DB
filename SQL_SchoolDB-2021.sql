	-- 1. create a “School” database.

CREATE DATABASE SchoolDB-2021;									

USE SchoolDB-2021;


-- 2. Create a “Classes” table, with the following columns:
CREATE TABLE tbl_classes (									
	class_id INT NOT NULL PRIMARY KEY IDENTITY (1,1),		-- Class_ID (primary key)
	class_name VARCHAR(30) NOT NULL							-- Class_Name
);



-- 3. Create a “students” table, with the following columns:
CREATE TABLE tbl_students (									
	student_id INT NOT NULL PRIMARY KEY IDENTITY (1,1),		-- student_ID (primary key)
	student_name VARCHAR(30) NOT NULL,						-- student_Name


-- 5. Within the Students table, add the following foreign keys, allow NULL values. 
	studentClass_id INT,									
	CONSTRAINT fk_studentClass_id FOREIGN KEY (studentClass_id)
	REFERENCES tbl_classes(class_id),

	studentInstructor_id INT,
	CONSTRAINT fk_studentInstructor_id FOREIGN KEY (studentInstructor_id)
	REFERENCES tbl_instructors(instructor_id)
);



-- 4. Create a “instructors” table, with the following columns:
CREATE TABLE tbl_instructors (								
	instructor_id INT NOT NULL PRIMARY KEY IDENTITY (1,1),	-- instructor_ID (primary key)
	instructor_name VARCHAR(30) NOT NULL					-- instructor_Name
);




-- 6. Populate the Classes table with two classes: Software Developer Boot Camp & C# Boot Camp
INSERT INTO tbl_classes										
	(class_name)
	VALUES
	('Software Developer Boot Camp'),
	('C# Boot Camp')
;

SELECT * FROM tbl_classes;


-- 7. Populate the Students table with six student names of your choosing.
INSERT INTO tbl_students									
	(student_name)
	VALUES
	('Elon'),
	('Alica'),
	('Scott'),
	('Flynn'),
	('Hayley'),
	('Courtney')
;

SELECT * FROM tbl_students;


-- 8. Populate the Instructors table with two Instructor names of your choosing.
INSERT INTO tbl_instructors									
	(instructor_name)
	VALUES
	('Wyatt'),
	('Chad')
;

SELECT * FROM tbl_instructors;





-- 9. Within the Student table, assign values to the Class_ID foreign key 
UPDATE tbl_students											
SET studentClass_id = 1						        -- (i.e. assign half the students to one class and the other half to the other class).
WHERE student_id BETWEEN 1 AND 3;



UPDATE tbl_students
SET studentClass_id = 2 
WHERE student_id BETWEEN 4 AND 6;


SELECT * FROM tbl_students;


-- 10. Within the Students table, assign values to the Instructor_ID foreign key
UPDATE tbl_students												
SET studentInstructor_id = 2						-- (i.e. assign half the students to one class and the other half to the other class).
WHERE student_id BETWEEN 1 AND 3;


UPDATE tbl_students
SET studentInstructor_id = 1 
WHERE student_id BETWEEN 4 AND 6;


SELECT * FROM tbl_students;



-- 11. Run a query to display all Instructor names.
SELECT instructor_name											
FROM tbl_instructors;



-- 12. Run a query to display all student names in alphabetical order.
SELECT * FROM tbl_students										
ORDER BY student_name ASC;


	

-- 13. Run a query that displays all classes, with the students and Instructors assigned to each.
FROM tbl_students
SELECT Student_name, instructor_name, class_name				
INNER JOIN tbl_instructors ON tbl_instructors.instructor_id = tbl_students.studentInstructor_id
INNER JOIN tbl_classes ON tbl_classes.class_id = tbl_students.studentClass_id



DROP TABLE IF EXISTS tbl_classes;
DROP TABLE IF EXISTS tbl_students;
DROP TABLE IF EXISTS tbl_instructors;
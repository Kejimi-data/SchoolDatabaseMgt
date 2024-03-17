CREATE TABLE Student( 		 StudentId INT PRIMARY KEY IDENTITY(1,1)
				 ,FirstName VARCHAR (50)
				 ,MiddleName VARCHAR (50)
				 ,LastName VARCHAR (50)
				 ,DateOfBirth DATE
				 ,Gender CHAR (10)
				 ,Address VARCHAR (255)
				 ,StudentCode VARCHAR(4)
				 ,CONSTRAINT CK_Student_Name CHECK (FirstName IS NOT NULL AND LastName IS NOT NULL)
				 )
	
CREATE TABLE Enrollment(	 StudentId INT 
				,EnrollmentId INT PRIMARY KEY IDENTITY(1,1) 
				,EnrollmentDate DATE
				,ClassName VARCHAR (10)
				,EnrollmentAge INT
				,CONSTRAINT FK_Student_Enrollment FOREIGN KEY (StudentId) REFERENCES Student(StudentId)
				)

CREATE TABLE Subjects(		SubjectId INT PRIMARY KEY IDENTITY(1,1)
				,ClassOffered VARCHAR (10)
				,SubjectName VARCHAR (50)
				)
		
CREATE TABLE Class(		ClassID INT PRIMARY KEY IDENTITY (1,1)
				,ClassName VARCHAR (10)
				)
		
CREATE TABLE GRADES(		GradeId INT PRIMARY KEY IDENTITY(1,1)
				,SubjectId INT
				,StudentId INT
				,AssessmentDate DATE
				,Score FLOAT
				,Grade VARCHAR (1)
				,ClassID INT
				CONSTRAINT FK_Grade_Student FOREIGN KEY (StudentId) REFERENCES Student(StudentId),
			        CONSTRAINT FK_Grade_Class FOREIGN KEY (ClassId) REFERENCES Class(ClassId),
		            	CONSTRAINT FK_Grade_Subjects FOREIGN KEY (SubjectId) REFERENCES Subjects (SubjectId)
				)

INSERT INTO Student (FirstName,LastName,MiddleName,DateOfBirth,Gender,Address,StudentCode) 
VALUES 	('Adedolu','Titilayo','Promise','12/12/2002','F','Surulere','ATP'),
	('Oyemakinde','Ibukun','Emmanuel','12/02/2005','M','Surulere','OIE'),
	('Adebalu', 'Tobiloba', 'Great', '01/01/2003', 'F', 'Costain','ATG'),
	('Ibidapo', 'Funmilola', 'Desire', '06/05/2004', 'F', 'Marina','IFD'),
	('Ibidapo', 'Funmilola', 'Desire', '06/05/2004', 'F', 'Marina','IFD'),
	('Obinna', 'Chinaaza', 'Endurance', '05/31/2004', 'F', 'Tradefair','OCE'),
	('Nasiru', 'Ibrahim', 'Ridwan', '02/24/2006', 'M', 'Marina','NIR'),
	('Chinnedu', 'Osas', 'Fortune', '02/28/2006', 'M', 'Ojuelegba','COF'),
	('Chukwudi', 'Chidera', 'Chineye', '01/10/2007', 'F', 'Ikeja','CCC'),
	('Oyedapo', 'Adeola', 'Paul', '11/24/2006', 'M', 'Marina','OAP'),
	('Ibitola', 'Emmanuel', 'Prince', '07/07/2005', 'M', 'Marina','NIR');

DELETE FROM Student
WHERE StudentId = '5';

INSERT INTO Enrollment(StudentId,EnrollmentDate,ClassName,EnrollmentAge)
VALUES  ('4','03/11/2014','JSS1','10'),
	('3','03/11/2013','JSS1','10'),
	('2','03/11/2015','JSS1','10'),
	('1','03/11/2012','JSS1','10'),
	('6','03/11/2014','JSS1','10'),
	('7','03/11/2016','JSS1','10'),
	('8','03/11/2016','JSS1','10'),
	('9','03/11/2017','JSS1','10'),
	('10','03/11/2016','JSS1','10'),
	('11','03/11/2015','JSS1','10');

INSERT INTO Class(ClassName)
VALUES  ('JSS1'),
	('JSS2'),
	('JSS3');

sp_rename 'Subjects.ClassOffered', 'ClassName', 'COLUMN';

INSERT INTO Subjects(ClassName,SubjectName)
VALUES   ('JSS1','Mathematics'),
	 ('JSS1','EnglishLanguage'),
	 ('JSS1','BasicScience'),
	 ('JSS1','Yoruba'),
	 ('JSS1','CivicEducation'),
	 ('JSS1','BusinessStudies');


INSERT INTO GRADES(SubjectId,StudentId, AssessmentDate,Score,Grade,ClassID)
VALUES    ('13','1','03/11/2024','78','A','1'),
	  ('14','1','03/11/2024','78','A','1'), 
	  ('15','1','03/11/2024','80','A','1'), 
	  ('16','1','03/10/2024','82','B','1'), 
	  ('17','1','03/11/2024','84','A','1'),
	  ('13','2','03/11/2024','76','A','1'),
	  ('14','2','03/11/2024','72','B','1'),
	  ('15','2','03/11/2024','90','A','1'), 
	  ('16','2','03/11/2024','62','C','1'),
	  ('17','2','03/11/2024','94','A','1'),
	  ('13','3','03/11/2024','96','A','1'),
	  ('14','3','03/11/2024','56','D','1'),
	  ('15','3','03/11/2024','100','A','1'),
	  ('16','3','03/11/2024','75','A','1'),
	  ('17','3','03/11/2024','70','B','1'),
	  ('13','4','03/11/2024','96','A','1'), 
	  ('14','4','03/11/2024','68','C','1'),
	  ('15','4','03/11/2024','70','B','1'),
	  ('16','4','03/11/2024','62','C','1'),
	  ('17','4','03/11/2024','74','B','1'), 
	  ('13','6','03/11/2024','74','B','1'),
	  ('14','6','03/11/2024','88','A','1'), 
	  ('15','6','03/11/2024','80','A','1'),
	  ('16','6','03/11/2024','72','B','1'),
	  ('17','6','03/11/2024','64','C','1'),
	  ('13','7','03/11/2024','86','A','1'),
	  ('14','7','03/11/2024','68','C','1'),
	  ('15','7','03/11/2024','70','B','1'),
	  ('16','7','03/11/2024','72','B','1'),
	  ('17','7','03/11/2024','74','B','1'),
	  ('13','8','03/11/2024','67','C','1'),
	  ('14','8','03/11/2024','48','D','1'),
	  ('15','8','03/11/2024','50','C','1'),
	  ('16','8','03/11/2024','42','E','1'),
	  ('17','8','03/11/2024','74','B','1'),
	  ('13','9','03/11/2024','66','C','1'),
	  ('14','9','03/11/2024','58','D','1'),
	  ('15','9','03/11/2024','70','B','1'),
	  ('16','9','03/11/2024','62','C','1'),
	  ('17','9','03/11/2024','64','C','1'),
	  ('13','10','03/11/2024','66','C','1'),
	  ('14','10','03/11/2024','68','C','1'),
	  ('15','10','03/11/2024','70','B','1'),
	  ('16','10','03/11/2024','72','B','1'),
	  ('17','10','03/11/2024','64','C','1'),
	  ('13','11','03/11/2024','76','A','1'),
	  ('14','11','03/11/2024','78','A','1'),
	  ('15','11','03/11/2024','80','A','1'), 
	  ('16','11','03/11/2024','82','A','1'),
	  ('17','11','03/11/2024','84','A','1');


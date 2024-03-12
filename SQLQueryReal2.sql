--Update student name to Tolulope--
UPDATE Student
SET FirstName = 'Tolulope'
WHERE StudentCode = 'ATP';

--Delete Business Studies from the list of Subjects--
DELETE FROM Subjects
WHERE SubjectName = 'BusinessStudies';

--Get the full name of all students--
SELECT LastName + ' ' + FirstName + ' ' + MiddleName AS FullName
FROM Student
ORDER BY FullName;

--Filter student based on student Average---
SELECT LastName + ' ' + FirstName + ' ' + MiddleName AS FullName, Grades.StudentId,
       COUNT(Grades.SubjectId) AS TotalSubjectTaken, SUM(Score) AS TotalSore, AVG(Score) AS AverageScore
FROM Student 
JOIN Grades
ON Student.StudentId = Grades.StudentId
GROUP BY Grades.StudentId, LastName, FirstName, MiddleName
ORDER BY AverageScore DESC;

--List of subject and number of enrolled student per course--
SELECT Subjects.SubjectId, Subjects.SubjectName, COUNT(Grades.StudentId) AS StudentEnrolled
FROM Subjects
JOIN Grades
on Subjects.subjectId = Grades.SubjectId
GROUP BY subjects.subjectId, Subjects.SubjectName; 

--Retrieving students list classified by gender--
SELECT gender, Count(StudentCode) AS Countstudent
FROM student
GROUP BY Gender;

--Student enrolled in Mathematics and their score --
SELECT LastName + ' ' + FirstName + ' ' + MiddleName AS FullName, g.Score
FROM student s
JOIN Grades g
ON s.StudentId = g.StudentId
JOIN Subjects e
ON g.SubjectId = e.SubjectId
WHERE SubjectName = 'Mathematics'
GROUP BY g.score, LastName, FirstName, MiddleName
ORDER BY g.score DESC;

--Retrieving students that scored above class avarage--
SELECT LastName + ' ' + FirstName + ' ' + MiddleName AS FullName, Gender, StudentCode, SUM(score) AS TotalScore, 
		AVG(Score) AS AverageScore 
FROM Student s
JOIN Grades g
ON s.StudentId = g.StudentId
GROUP BY StudentCode, LastName, FirstName, MiddleName, gender
HAVING AVG(Score) > (SELECT AVG(score) AS AvgScore
					  FROM grades)
ORDER BY AverageScore DESC;	

--Retrieving students that scored below class avarage--
SELECT LastName + ' ' + FirstName + ' ' + MiddleName AS FullName, Gender, StudentCode, SUM(score) AS TotalScore, 
		AVG(Score) AS AverageScore 
FROM Student s
JOIN Grades g
ON s.StudentId = g.StudentId
GROUP BY StudentCode, LastName, FirstName, MiddleName, gender
HAVING AVG(Score) < (SELECT AVG(score) AS AvgScore
					  FROM grades)
ORDER BY AverageScore DESC;	

--Retrieving scores ad Grade of Student with StudentId '4'--
SELECT SubjectName, score, grade 
FROM Grades g
JOIN Subjects e
ON g.SubjectId = e.SubjectId
WHERE g.StudentId = 4

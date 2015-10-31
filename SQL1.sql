CREATE TABLE Employee (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(80),
    BossID INT,
    DepartID INT,
    Salary INT);
    
CREATE TABLE Depart (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(80));
    
CREATE TABLE Meeting (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(80),
    time DATETIME,
    durtaion INT);

#simple version
CREATE TABLE MeetingEmployee (
    EmployeeID INT NOT NULL,
    MeetingID INT NOT NULL,
    PRIMARY KEY (EmployeeID, MeetingID));

#contrainsted version


#INSERT DATA
INSERT INTO employee(name,BossID,DepartID,Salary) 
VALUES 
("Hungct", 6, 0, 5000),
("Quannh", 6, 1, 50000),
("BinhTG", -1, 0, 500000000);

select ID from Employee where name="BinhTG";



SELECT E1.name NhanVien, E2.name Sep 
FROM employee E1 left join employee E2 ON E1.BossID = E2.ID;

INSERT INTO Depart (name) 
VALUES ("Phong1"),("Phong2");

SELECT E.name, D.name AS Phong
FROM employee E left join depart D ON E.departID = D.ID;

ALTER TABLE Meeting
CHANGE COLUMN `durtaion` `duration` INT(11) NULL DEFAULT NULL ;
 
INSERT INTO Meeting(name,time,duration)
VALUES 
("Hop dau tuan 1", '2015/11/15 8:0:0',1),
("Hop cuoi tuan 1", '2015/11/20 17:30:0',1);

SELECT * 
FROM Meeting
WHERE time BETWEEN '2015/10/31' AND '2015/11/6';

INSERT INTO MeetingEmployee(EmployeeID, MeetingID)
VALUES
(1,1),
(2,1),
(4,1),
(3,2),
(4,2),
(1,3),
(5,3);
select MeetingEmployee.MeetingID, Meeting.name,
Meeting.time, Meeting.duration,
group_concat(concat(Employee.name,
'(', IF(Depart.name IS NULL,'null',Depart.name), ')')) as Nguoithamgia
from
Employee left join Depart on Employee.DepartID = Depart.ID
join MeetingEmployee on MeetingEmployee.EmployeeID = Employee.ID,
Meeting where Meeting.ID = MeetingEmployee.MeetingID
group by (MeetingID);

  
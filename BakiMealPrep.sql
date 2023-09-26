CREATE DATABASE BakiMealPrep



--Staff
CREATE TABLE MsStaff(
StaffID CHAR (10) NOT NULL PRIMARY KEY CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
StaffName VARCHAR (255) NOT NULL CHECK (LEN (StaffName) > 3),
StaffAdress VARCHAR(255) NOT NULL,
StaffGender CHAR (6) NOT NULL CHECK (StaffGender LIKE 'Male' OR StaffGender LIKE 'Female'),
StaffEmail VARCHAR(255) NOT NULL CHECK(StaffEmail LIKE '%@%'),
StaffPhone VARCHAR(255) NOT NULL CHECK (LEN(StaffPhone)= 13),
StaffSalary INT NOT NULL,
)


--RegionalBranch 


CREATE TABLE RegionalBranch (
  RegionalBranchID CHAR(5) NOT NULL PRIMARY KEY CHECK (RegionalBranchID LIKE 'RB[0-9][0-9][0-9]'),
  RegionalBranchName VARCHAR(50) NOT NUll, CHECK (LEN(RegionalBranchName) > 5),
  RegionalBranchEmail VARCHAR(50) NOT NULL, CHECK (RegionalBranchEmail LIKE '%@%.com'),
  RegionalBranchPhone VARCHAR(13) NOT NULL, CHECK (LEN(RegionalBranchPhone) = 13),
  RegionalBranchAddress VARCHAR(50) NOT NULL,
)

--MealPrep
CREATE TABLE MealPrep (
MealPrepID CHAR (5) PRIMARY KEY CHECK (MealPrepID LIKE 'PM[0-9][0-9][0-9]')NOT NULL, 
MealPrepName VARCHAR (50) NOT NULL, 
MealPrepExpiryDate DATE NOT NULL, 
MealPrepSalesPrice INT NOT NULL, 
MealPrepPurchasePrice INT NOT NULL,
MealPrepStock INT NOT NULL
)

--Customer
CREATE TABLE MsCustomer (
 CustomerID CHAR(5) PRIMARY KEY CHECK (CustomerID LIKE 'CS[0-9][0-9][0-9]'),
 CustomerName VARCHAR(50) NOT NULL, CHECK (LEN(CustomerName) > 5),
 CustomerGender VARCHAR(10) NOT NULL, CHECK (CustomerGender LIKE 'Male' or CustomerGender LIKE'Female'),
 CustomerPhone VARCHAR(13) NOT NULL, CHECK (LEN(CustomerPhone) = 13),
 CustomerEmail VARCHAR(50) NOT NULL, CHECK (CustomerEmail LIKE '%@%.com')
)

--Sales transaction 
CREATE TABLE SalesTransaction(
SalesTransactionID CHAR(5) PRIMARY KEY NOT NULL CHECK (SalesTransactionID LIKE 'SS[0-9][0-9][0-9]'),
StaffID CHAR(10) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
CustomerID CHAR(5) FOREIGN KEY REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
SalesDate DATE NOT NULL
)

--SalesTransactionDetail

CREATE TABLE SalesTransDetail(
SalesTransactionID CHAR(5) FOREIGN KEY REFERENCES  SalesTransaction(SalesTransactionID) ON UPDATE CASCADE ON DELETE CASCADE ,
MealPrepID CHAR(5) FOREIGN KEY REFERENCES MealPrep(MealPrepID) ON UPDATE CASCADE ON DELETE CASCADE,
QtySold INT NOT NULL
)

--PurchaseTransaction
CREATE TABLE PurchaseTransaction (
PurchaseTransactionID CHAR(5) PRIMARY KEY NOT NULL CHECK (PurchaseTransactionID LIKE 'PC[0-9][0-9][0-9]'), 
StaffID CHAR(10) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
RegionalBranchID CHAR(5) FOREIGN KEY REFERENCES RegionalBranch (RegionalBranchID) ON UPDATE CASCADE ON DELETE CASCADE,
PurchaseDate DATE NOT NULL
)


--PurchaseTransDetail
CREATE TABLE PurchaseTransDetail(
PurchaseTransactionID CHAR(5) FOREIGN KEY REFERENCES PurchaseTransaction(PurchaseTransactionID)ON UPDATE CASCADE ON DELETE CASCADE,
MealPrepID CHAR(5) FOREIGN KEY REFERENCES MealPrep(MealPrepID) ON UPDATE CASCADE ON DELETE CASCADE,
QtyPurchased INT NOT NULL
)

INSERT INTO MsStaff VALUES
('ST001', 'Justin Tim', 'Jl. Benyamin', 'Male', 'justin@gmail.com','0812957556890','4000000'),
('ST002', 'Ruru kiki', 'Jl. Sudirman','Female','ruru@gmail.com','0812958609546','8000000'),
('ST003', 'Koko nut', 'Jl. Jendral','Male','koko@gmail.com','0812567489765','7000000'),
('ST004', 'Momo koni', 'Jl. Benyek','Female','momo@gmail.com','0812876545678','3000000'),
('ST005', 'Nina jun', 'Jl. Monas','Female','nina@gmail.com','0812901298768','6000000'),
('ST006', 'Budi jaya', 'Jl. Sukabumi','Male','budi@gmail.com','0812897665430','4000000'),
('ST007', 'Afgan istan', 'Jl. Monako','Male','afgan@gmail.com','0812789654739','7000000'),
('ST008', 'Raka jiwa', 'Jl. Nikungcowo','Male','raka@gmail.com','0812890798762','3000000'),
('ST009', 'Alvin chip', 'Jl. Maunikah','Male','alvin@gmail.com','0812876543290','10000000'),
('ST010', 'Julian mon','Jl. Susahduit','Male','ruru@gmail.com','0812832134766','2000000')


INSERT INTO RegionalBranch VALUES 
('RB001', 'Citayem', 'bakimealcitayem@gmail.com','0824168917634','Jl. Harapan 5'),
('RB002', 'Tangerang Selatan Adem', 'bakimealtangerang@gmail.com','0815165716084','Jl. Garuda 10'),
('RB003', 'Bojong Gede', 'bakimealbojonggede@gmail.com', '0812178917023', 'Jl. Antasari 12'),
('RB004', 'Cikupa', 'bakimealcikupa@gmail.com', '0856158934298', 'Jl. Senopati 5'),
('RB005', 'Cimahi', 'bakimealcimahi@gmail.com','0824567413452', 'Jl. Pattimura 9'),
('RB006', 'Menteng', 'bakimealmenteng@gmail.com', '0815416781334', 'Jl. Pegangsaan 14'),
('RB007', 'Cengkareng', 'bakimealcengkareng@gmail.com', '0858886775714', 'Jl. Mawar 9'),
('RB008', 'Serang', 'bakimealserang@gmail.com','0857321088791', 'Jl. Pancasila 2'),
('RB009', 'Bintara', 'bakimealbintara@gmail.com', '0817886516055', 'Jl. Bintara 6'),
('RB010', 'Seminyak', 'bakimealseminyak@gmail.com', '0856120988711', 'Jl. Taman Ganesha 3')


INSERT INTO MealPrep VALUES 
('PM001', 'Salad', '2025-01-25', 52000, 25000, 112),
('PM002', 'Acai Bowl', '2023-09-22', 68000, 45000, 173),
('PM003', 'Tuna Salad with Cranberries', '2022-08-12', 75000, 59000, 134),
('PM004', 'Veggie Quesadilla', '2022-11-11', 68000, 49000, 91),
('PM005', 'Italian Pasta Salad', '2022-12-30', 65000, 50000, 79),
('PM006', 'Banana Bowl', '2022-10-25', 64500, 50000, 82),
('PM007', 'Fruit Salad', '2023-06-05', 70000, 55000, 106),
('PM008', 'Sweet Potato Black Bean', '2024-03-23', 78000, 54000, 61),
('PM009', 'Healthy Tacos', '2024-07-15', 61500, 48500, 88),
('PM010', 'Boiled Chicken', '2025-04-18', 56500, 43000, 108)


INSERT INTO MsCustomer VALUES 
 ('CS001', 'Ardhito Pramono', 'Male', '0821577698245', 'ardh1to@gmail.com'),
 ('CS002', 'Sadie Sink', 'Female', '0857899001221', 'maxcool@gmail.com'),
 ('CS003', 'Henry Creel', 'Male', '0855990827144', 'h3nrycr33l@gmail.com'),
 ('CS004', 'James Wilson', 'Male', '0889766724457', 'wilsonganteng@gmail.com'),
 ('CS005', 'Sandy Cheeks', 'Female', '5558926653218', 'sandysandysandy@gmail.com'),
 ('CS006', 'Cristiano Ronaldo', 'Male', '5589766253492', 'cristiano@business.com'),
 ('CS007', 'Steve Harrington', 'Male', '0812237849953', 'steve123123@home.com'),
 ('CS008', 'Maya Hawke', 'Female', '0857700928553', 'hawkemaya@outlook.com'),
 ('CS009', 'Niki Zefanya', 'Female', '0812211298263', 'nikizef@home.com'),
 ('CS010', 'Anya Geraldine', 'Female', '0855722983123', 'nuranya@gmail.com')


 --Master Table
UPDATE RegionalBranch
SET RegionalBranchAddress = 'Jl. Mustang 1'
WHERE RegionalBranchAddress = 'Jl. Senopati 5'

UPDATE MsStaff
SET StaffEmail = 'julian@gmail.com'
WHERE StaffName = 'Julian'


--Stimulate The Transaction Processes
INSERT INTO SalesTransaction VALUES
('SS001', 'ST004', 'CS004', '2021-03-08'),
('SS002', 'ST003', 'CS003', '2021-04-10'),
('SS003', 'ST002', 'CS007', '2021-02-03'),
('SS004', 'ST001', 'CS009', '2021-06-20'),  
('SS005', 'ST009', 'CS001', '2021-04-17'),
('SS006', 'ST008', 'CS006', '2021-09-26'),
('SS007', 'ST010', 'CS002', '2021-08-18'),
('SS008', 'ST005', 'CS010', '2021-08-22'),
('SS009', 'ST006', 'CS008', '2021-10-12'),
('SS010', 'ST007', 'CS005', '2021-09-30'),
('SS011', 'ST009', 'CS010', '2021-11-11'),
('SS012', 'ST001', 'CS008', '2021-03-15'),
('SS013', 'ST002', 'CS006', '2021-10-04'),
('SS014', 'ST007', 'CS004', '2021-02-20'),
('SS015', 'ST005', 'CS001', '2021-12-01'),
('SS016', 'ST003', 'CS003', '2021-03-09'),
('SS017', 'ST004', 'CS009', '2021-05-10'),
('SS018', 'ST005', 'CS007', '2021-03-11'),
('SS019', 'ST006', 'CS004', '2021-08-17'),
('SS020', 'ST008', 'CS003', '2021-05-20'),
('SS021', 'ST007', 'CS006', '2021-10-02'),
('SS022', 'ST010', 'CS001', '2021-10-09'),
('SS023', 'ST002', 'CS005', '2021-11-03'),
('SS024', 'ST005', 'CS002', '2021-12-12'),
('SS025', 'ST001', 'CS009', '2021-09-22')



INSERT INTO SalesTransDetail VALUES 
('SS001','PM002',3),
('SS002','PM003',14),
('SS003','PM001',2),
('SS004','PM005',16),
('SS005','PM004',12),
('SS006','PM007',16),
('SS007','PM006',26),
('SS008','PM008',21),
('SS009','PM010',30),
('SS010','PM009',16),
('SS011', 'PM004', 3),
('SS012', 'PM004', 5),
('SS013', 'PM001', 2),
('SS014', 'PM002', 6),
('SS015', 'PM005', 1),
('SS016', 'PM002', 3),
('SS017', 'PM003', 7),
('SS018', 'PM001', 2),
('SS019', 'PM005', 2),
('SS020', 'PM004', 1),
('SS021', 'PM007', 3),
('SS022', 'PM006', 2),
('SS023', 'PM008', 2),
('SS024', 'PM010', 2),
('SS025', 'PM009', 1)


INSERT INTO PurchaseTransaction VALUES 
('PC001', 'ST002', 'RB007', '2021-01-02'), 
('PC002', 'ST004', 'RB004', '2021-02-03'), 
('PC003', 'ST003', 'RB003', '2021-03-05'),  
('PC004', 'ST009', 'RB001', '2021-04-17'),  
('PC005', 'ST001', 'RB009', '2021-05-28'),  
('PC006', 'ST010', 'RB002', '2021-06-12'),  
('PC007', 'ST008', 'RB006', '2021-07-19'),  
('PC008', 'ST005', 'RB010', '2021-08-22'),  
('PC009', 'ST007', 'RB005', '2021-09-30'),  
('PC010', 'ST006', 'RB008', '2021-10-12'),
('PC011', 'ST005', 'RB004', '2021-10-09'),
('PC012', 'ST009', 'RB007', '2021-12-24'),
('PC013', 'ST001', 'RB005', '2021-02-22'),
('PC014', 'ST002', 'RB010', '2021-09-17'),
('PC015', 'ST007', 'RB003', '2021-01-28'),
('PC016', 'ST009', 'RB004', '2021-02-15'),
('PC017', 'ST008', 'RB005', '2021-09-19'),
('PC018', 'ST007', 'RB006', '2021-02-03'),
('PC019', 'ST006', 'RB007', '2021-03-18'),
('PC020', 'ST005', 'RB008', '2021-04-11'),
('PC021', 'ST008', 'RB009', '2021-01-12'),
('PC022', 'ST003', 'RB010', '2021-06-15'),
('PC023', 'ST002', 'RB001', '2021-07-20'),
('PC024', 'ST001', 'RB002', '2021-09-07'),
('PC025', 'ST010', 'RB003', '2021-05-21')



INSERT INTO PurchaseTransDetail VALUES
('PC001', 'PM001', 26), 
('PC002', 'PM002', 53), 
('PC003', 'PM003', 58),  
('PC004', 'PM004', 55),  
('PC005', 'PM005', 48),  
('PC006', 'PM006', 54),  
('PC007', 'PM007', 24),  
('PC008', 'PM008', 42),  
('PC009', 'PM009', 41),  
('PC010', 'PM010', 36),
('PC011', 'PM005', 57),
('PC012', 'PM003', 50),
('PC013', 'PM004', 33),
('PC014', 'PM001', 20),
('PC015', 'PM002', 16),
('PC016', 'PM004', 49),
('PC017', 'PM005', 37),
('PC018', 'PM001', 31),
('PC019', 'PM002', 23),
('PC020', 'PM003', 19),
('PC021', 'PM006', 52),
('PC022', 'PM007', 33),
('PC023', 'PM008', 36),
('PC024', 'PM009', 27),
('PC025', 'PM010', 16)



--Query to answer the 10 cases 
--1
SELECT RegionalBranchName, PurchaseDate, [Total Item Purchase] = SUM (QtyPurchased)
FROM RegionalBranch rb JOIN PurchaseTransaction pt ON rb.RegionalBranchID = pt.RegionalBranchID 
JOIN PurchaseTransDetail ptd ON ptd.PurchaseTransactionID = pt.PurchaseTransactionID
WHERE  DATENAME(DAY,PurchaseDate) < 20 AND RegionalBranchName LIKE '%Tangerang%'
GROUP BY  RegionalBranchName, PurchaseDate

--2
SELECT StaffName, [SalesDate] = CONVERT(VARCHAR, SalesDate, 106), [Total Sales] = SUM (QtySold) 
FROM MsStaff ms JOIN SalesTransaction st ON ms.StaffID = st.StaffID
JOIN SalesTransDetail std ON st.SalesTransactionID = std.SalesTransactionID
WHERE StaffSalary < 5000000 AND DATENAME(MONTH, SalesDate) = 'October'  OR DATENAME(MONTH, SalesDate) = 'November'
GROUP BY StaffName, SalesDate 

--3
SELECT StaffName, [Average Purchase Quantity] = AVG (QtyPurchased), 
[Total Meal Supplied] = CONVERT(VARCHAR, SUM(QtyPurchased)) + ' Meal'
FROM MsStaff ms JOIN PurchaseTransaction pt ON ms.StaffID = pt.StaffID 
JOIN PurchaseTransDetail ptd ON pt.PurchaseTransactionID = ptd.PurchaseTransactionID
WHERE StaffGender LIKE 'Female' AND QtyPurchased < 8 
GROUP BY StaffName

--4
SELECT RegionalBranchName, [Total Purchase] = SUM(QtyPurchased),
[Average Purchase Price] = 'Rp. ' + Convert(VARCHAR, AVG(MealPrepPurchasePrice))
FROM RegionalBranch rb JOIN  PurchaseTransaction pt ON rb.RegionalBranchID = pt.RegionalBranchID
JOIN PurchaseTransDetail ptd ON pt.PurchaseTransactionID = ptd.PurchaseTransactionID 
JOIN MealPrep mp ON ptd.MealPrepID = mp.MealPrepID
WHERE  LEN(RegionalBranchName) > 15 AND RegionalBranchName LIKE '% % %'
GROUP BY RegionalBranchName

--5
SELECT RegionalBranchAddress, [RegionalBranchPhone] = REPLACE(RegionalBranchPhone, '08','+62'), PurchaseDate, StaffName,
[Quantity] = CONVERT(VARCHAR, SUM(QtyPurchased)) + ' pcs'
FROM RegionalBranch rb JOIN PurchaseTransaction pt ON rb.RegionalBranchID = pt.RegionalBranchID
JOIN MsStaff ms ON ms.StaffID = pt.StaffID 
JOIN PurchaseTransDetail ptd on pt.PurchaseTransactionID = ptd.PurchaseTransactionID,
(
	SELECT [Avg2] = AVG(QtyPurchased)
	FROM PurchaseTransDetail
)avg1 
WHERE QtyPurchased > avg1.Avg2 AND DATENAME(MONTH,PurchaseDate) = 'September' 
OR DATENAME(MONTH,PurchaseDate) = 'December'
GROUP BY RegionalBranchAddress,RegionalBranchPhone, PurchaseDate, StaffName


--6
SELECT [Customer ID] = REPLACE(CustomerID, 'CS','Customer '),
[Handle by] = REPLACE (ms.StaffID, LEFT(ms.StaffID , 4), 'Staff '),
[Total Meal Prep Sales price] = 'Rp. ' +  CONVERT(VARCHAR,(MealPrepSalesPrice* QtySold)),
MealPrepName
FROM MsStaff ms JOIN SalesTransaction st ON ms.StaffID = st.StaffID
JOIN SalesTransDetail std ON st.SalesTransactionID = std.SalesTransactionID 
JOIN MealPrep mp ON mp.MealPrepID = std.MealPrepID
GROUP BY CustomerID,ms.StaffID,MealPrepName,MealPrepSalesPrice,QtySold
HAVING  QtySold IN 
(
SELECT QtySold
FROM PurchaseTransDetail
WHERE MAX(QtySold) = [QtySold] AND QtySold > 2 
)

--7
SELECT [Last Name] = SUBSTRING (StaffName, CHARINDEX(' ',StaffName) + 1,
LEN(StaffName)) ,[Total Purchase Has Been done] = SUM(QtyPurchased),
StaffSalary
FROM MsStaff ms JOIN PurchaseTransaction pt On ms.StaffID = pt.StaffID
JOIN PurchaseTransDetail ptd ON pt.PurchaseTransactionID = ptd.PurchaseTransactionID,
(
	SELECT [Avg2] = AVG(StaffSalary)
	FROM MsStaff
)avg1 
WHERE StaffGender LIKE 'Female' AND StaffSalary < avg1.Avg2
GROUP BY StaffName, QtyPurchased,StaffSalary
       
--8
SELECT 'Staff Initial' = SUBSTRING(StaffName,1,1) + SUBSTRING(StaffName,CHARINDEX(' ',StaffName)+1,1), mc.CustomerID, 
'Total Sales' = SUM(QtySold), SalesDate
FROM MsStaff ms JOIN SalesTransaction st ON ms.StaffID = st.StaffID JOIN MsCustomer mc ON st.CustomerID = mc.CustomerID 
 JOIN SalesTransDetail std ON st.SalesTransactionID = std.SalesTransactionID,
(
 SELECT [MinQty] = MIN(QtySold)
 FROM SalesTransDetail
)min1
WHERE MONTH(SalesDate) = 9
GROUP BY SUBSTRING(StaffName,1,1) + SUBSTRING(StaffName,CHARINDEX(' ',StaffName)+1,1), mc.CustomerID, SalesDate, min1.MinQty
HAVING SUM(QtySold) = min1.MinQty

--9
CREATE VIEW ViewPurchaseTransaction
AS
SELECT StaffEmail, PurchaseDate, [Total Purchase Meal Prep] = SUM(QtyPurchased), [Total Purchase Transaction] = COUNT(mp.MealPrepID)
FROM MsStaff ms JOIN PurchaseTransaction pt ON ms.StaffID = pt.StaffID JOIN PurchaseTransDetail ptd ON pt.PurchaseTransactionID = ptd.PurchaseTransactionID JOIN MealPrep mp ON ptd.MealPrepID = mp.MealPrepID
WHERE StaffEmail LIKE'%@gmail%' OR StaffEmail LIKE '%@hotmail%'
GROUP BY StaffEmail, PurchaseDate
HAVING SUM(QtyPurchased) >50

--10
CREATE VIEW ViewSalesTransaction 
AS
SELECT StaffName, [SalesDate] = CONVERT(VARCHAR, SalesDate, 107), [Total Sales Transaction] = COUNT(MealPrepSalesPrice), [Total Sales Quantity] = SUM(QtySold)
FROM MsStaff ms JOIN SalesTransaction st ON ms.StaffID = st.StaffID JOIN SalesTransDetail std ON st.SalesTransactionID = std.SalesTransactionID
 JOIN MealPrep mp ON std.MealPrepID = mp.MealPrepID
WHERE MealPrepSalesPrice < 45000
GROUP BY StaffName, SalesDate
HAVING SUM(MealPrepStock) > 1





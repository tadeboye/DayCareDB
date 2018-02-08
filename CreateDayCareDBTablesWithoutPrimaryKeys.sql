USE DayCare --Specifies the database to create tables in.

--Creating childinfo table
--This table will store basic information 
--on all the children in our DayCare

IF OBJECT_ID('dbo.childinfo', 'U') IS NOT NULL 
  DROP TABLE dbo.childinfo; 

Create table ChildInfo
(
"Firstname" nvarchar(50),
"Lastname" nvarchar(50),
"MiddleName" nvarchar(50),
"Gender" char(1),
"Age" tinyint,
"Height" decimal(3,2),
"Weight" decimal(5,2),
"Race" nvarchar(50),
"DOB" Date,
"EnrolmentDate" Date,
"Grade" tinyint,
"Tuition" smallmoney,
"LivingWithBothParents" bit,
"NeedSpecialAccomodation" bit
)


--Creating Parentinfo table
--This table will store all the records
--Of the parent that has one or more child(ren)
--or ward in our day care.
IF OBJECT_ID('dbo.ParentInfo', 'U') IS NOT NULL 
  DROP TABLE dbo.ParentInfo;

Create table ParentInfo
(
"Firstname" nvarchar(50),
"Lastname" nvarchar(50),
"MiddleName" nvarchar(50),
"ParentChildRelationship" varchar(50),
"Race" nvarchar(50),
"Profession" nvarchar(250),
"LevelOfEducation" nvarchar(250),
"ChildLivesWithYou" bit,
"HomePhone" char(10),
"MobilePhone" char(10),
"WorkPhone" char(10),
"EmailAddress" nvarchar(50),
"BestTimeToContact" Time,
"HouseholdIncome" Money,
"MaritalStatus" char(1),
"PercentageOfTravel" tinyint
)

--Creating AddressInfo
--This table will store all addresses
--used throughout our database.
--It will be referenced by other tables
IF OBJECT_ID('dbo.AddressInfo', 'U') IS NOT NULL 
  DROP TABLE dbo.AddressInfo;

Create table AddressInfo
(
Address1 nvarchar(50),
Address2 nvarchar(50),
City nvarchar(50),
"State" char(2),
[Zip Code] char(5) 
)

IF OBJECT_ID('dbo.AllergyInfo', 'U') IS NOT NULL 
  DROP TABLE dbo.AllergyInfo;

Create table AllergyInfo
(
AllergyName nvarchar(50),
"Description" nvarchar(max),
Remedy  nvarchar(Max)
)

IF OBJECT_ID('dbo.GradeInfo', 'U') IS NOT NULL 
  DROP TABLE dbo.GradeInfo;

Create table GradeInfo
(
"ClassName" varchar(50),
"TeacherFirstName" nvarchar(50),
"TeacherLastName" nvarchar(50),
"NoOfStudent" Tinyint,
"ResumptionTime" Time,
"LunchTime" Time,
"RecessTime" Time,
"ClosingTime" Time
)

IF OBJECT_ID('dbo.EmergencyInfo', 'U') IS NOT NULL 
  DROP TABLE dbo.EmergencyInfo;

Create table EmergencyInfo
(
"FirstName" nvarchar(50),
"LastName" nvarchar(50),
"PhoneNumber" char(10)
)

IF OBJECT_ID('dbo.HospitalInfo', 'U') IS NOT NULL 
  DROP TABLE dbo.HospitalInfo;

Create table HospitalInfo
(
"HospitalName" nvarchar(150),
"PhoneNumber" char(10)
)

IF OBJECT_ID('dbo.DoctorInfo', 'U') IS NOT NULL 
  DROP TABLE dbo.DoctorInfo;

Create table DoctorInfo
(
"FirstName" nvarchar(50),
"LastName" nvarchar(50),
"PhoneNumber" char(10)
)

IF OBJECT_ID('dbo.SignIn', 'U') IS NOT NULL 
  DROP TABLE dbo.SignIn;

Create table SignIn
(
"ParentName" nVarchar(50),
"ChildName" nvarchar(50),
"SigninDate" Date,
"SigninTime" Time
)

IF OBJECT_ID('dbo.SignOut', 'U') IS NOT NULL 
  DROP TABLE dbo.SignOut;

Create table SignOut
(
"ParentName" nVarchar(50),
"ChildName" nvarchar(50),
"SignoutDate" Date,
"SignoutTime" Time
)
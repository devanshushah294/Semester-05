-- Select All wali procedure
Create or ALTER PROCEDURE [dbo].[PR_MST_Student_SelectAll]
as
Begin
	Select 
		[dbo].[MST_Student].[StudentID],
		[dbo].[MST_Student].[StudentName],
		[dbo].[MST_Student].[MobileNoFather],
		[dbo].[MST_Student].[MobileNoStudent],
		[dbo].[MST_Student].[Address],
		[dbo].[MST_Student].[Email],
		[dbo].[MST_Student].[Age],
		[dbo].[MST_Student].[Gender],
		[dbo].[MST_Student].[IsActive],
		[dbo].[MST_Student].[Password],
		[dbo].[MST_Student].[Created],
		[dbo].[MST_Student].[Modified],
		[dbo].[MST_Student].[BirthDate],
		[dbo].[LOC_City].[CityName]
	
	from [dbo].[MST_Student]
	INNER JOIN [dbo].[LOC_City]
	on [dbo].[MST_Student].[CityID] = [dbo].[LOC_City].[CityID]
End

-- Get by ID wali procedure
Create or ALTER PROCEDURE [dbo].[PR_MST_Student_GetStudentByID]
@StudentID int
as
Begin
Select 
	[dbo].[MST_Student].[StudentName],
	[dbo].[MST_Student].[MobileNoFather],
	[dbo].[MST_Student].[MobileNoStudent],
	[dbo].[MST_Student].[Address],
	[dbo].[MST_Student].[Email],
	[dbo].[MST_Student].[Age],
	[dbo].[MST_Student].[Gender],
	[dbo].[MST_Student].[IsActive],
	[dbo].[MST_Student].[Password],
	[dbo].[MST_Student].[Created],
	[dbo].[MST_Student].[Modified],
	[dbo].[MST_Student].[BirthDate],
	[dbo].[LOC_City].[CityName],
	[dbo].[LOC_City].[CityID],
	[dbo].[MST_Student].[BranchID]

from [dbo].[MST_Student]
INNER JOIN [dbo].[LOC_City]
on [dbo].[MST_Student].[CityID] = [dbo].[LOC_City].[CityID]

where [dbo].[MST_Student].[StudentID] = @StudentID
End

--Delete wali procedure 
Create or ALTER PROCEDURE [dbo].[PR_MST_Student_DeleteByStudentID]
@StudentID int
as
Begin
	Delete from [dbo].[MST_Student]
	where [dbo].[MST_Student].[StudentID] = @StudentID
End

--Add Student wali procedure
Create or ALTER Procedure [dbo].[PR_MST_Student_Insert] 
	@BranchID int,
	@CityID int,
	@StudentName varchar(100),
	@MobileNoStudent varchar(100),
	@Email varchar(100),
	@MobileNoFather varchar(100),
	@Address varchar(500),
	@BirthDate Datetime,
	@IsActive bit,
	@Gender varchar(50),
	@Password varchar(100)
as
Begin
	Insert into [dbo].[MST_Student] 
	(
		[dbo].[MST_Student].[BranchID],
		[dbo].[MST_Student].[CityID],
		[dbo].[MST_Student].[StudentName],
		[dbo].[MST_Student].[MobileNoStudent],
		[dbo].[MST_Student].[Email],
		[dbo].[MST_Student].[MobileNoFather],
		[dbo].[MST_Student].[Address],
		[dbo].[MST_Student].[BirthDate],
		[dbo].[MST_Student].[Age],
		[dbo].[MST_Student].[IsActive],
		[dbo].[MST_Student].[Gender],
		[dbo].[MST_Student].[Password],
		[dbo].[MST_Student].[Created],
		[dbo].[MST_Student].[Modified]
	)
	values
	(
		@BranchID,
		@CityID,
		@StudentName,
		@MobileNoStudent,
		@Email,
		@MobileNoFather,
		@Address,
		@BirthDate,
		datediff(YY,@BirthDate,GETDATE()),
		@IsActive,
		@Gender,
		@Password,
		GETDATE(),
		GETDATE()
	)
End

--Update by PK wali procedure
Create or ALTER Procedure [dbo].[PR_MST_Student_UpdateByPK]
	@StudentID int,
	@BranchID int,
	@CityID int,
	@StudentName varchar(100),
	@MobileNoStudent varchar(100),
	@Email varchar(100),
	@MobileNoFather varchar(100),
	@Address varchar(500),
	@BirthDate Datetime,
	@IsActive bit,
	@Gender varchar(50),
	@Password varchar(100),
	@Created Datetime = null,
	@Modified Datetime = null
as
Begin
	Update [dbo].[MST_Student]
	set 
		[dbo].[MST_Student].[BranchID] = @BranchID,
		[dbo].[MST_Student].[CityID] = @CityID,
		[dbo].[MST_Student].[StudentName] = @StudentName,
		[dbo].[MST_Student].[MobileNoStudent] = @MobileNoStudent,
		[dbo].[MST_Student].[MobileNoFather] = @MobileNoFather,
		[dbo].[MST_Student].[Email] = @Email,
		[dbo].[MST_Student].[BirthDate] = @BirthDate,
		[dbo].[MST_Student].[Age] = datediff(YY,@BirthDate,GETDATE()),
		[dbo].[MST_Student].[IsActive] = @IsActive,
		[dbo].[MST_Student].[Gender] = @Gender,
		[dbo].[MST_Student].[Password] = @Password,
		[dbo].[MST_Student].[Address] = @Address

	where [dbo].[MST_Student].[StudentID] = @StudentID

End
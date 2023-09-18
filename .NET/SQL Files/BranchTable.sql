Use Student_Reginstration

-- Select All
Create or Alter Procedure [dbo].[PR_MST_Branch_SelectAll] 
as
Begin
	Select 
		[dbo].[MST_Branch].[BranchID],
		[dbo].[MST_Branch].[BranchName],
		[dbo].[MST_Branch].[BranchCode],
		[dbo].[MST_Branch].[Created],
		[dbo].[MST_Branch].[Modified]
	from [dbo].[MST_Branch]
End


-- Select By PK
Create or Alter Procedure [dbo].[PR_MST_Branch_SelectByBranchID]
@branchID int
as
Begin
	Select 
		[dbo].[MST_Branch].[BranchID],
		[dbo].[MST_Branch].[BranchName],
		[dbo].[MST_Branch].[BranchCode],
		[dbo].[MST_Branch].[Created],
		[dbo].[MST_Branch].[Modified]
	from [dbo].[MST_Branch]

	where [dbo].[MST_Branch].[BranchID]=@branchID
End

-- Insert
Create or Alter Procedure [dbo].[PR_MST_Branch_Insert]
@BranchName varchar(100),
@BranchCode varchar(100),
@Created	datetime = null,
@Modified	datetime = null
as
Begin
	Insert into [dbo].[MST_Branch]
	(
		[dbo].[MST_Branch].[BranchName],
		[dbo].[MST_Branch].[BranchCode],
		[dbo].[MST_Branch].[Created],
		[dbo].[MST_Branch].[Modified]
	)
	values
	(
		@BranchName,
		@BranchCode,
		ISNULL(@Created, GETDATE()),
		ISNULL(@Modified, GETDATE())
	)
End


-- Update By PK
Create or Alter Procedure [dbo].[PR_MST_Branch_UpdateByBranchID]
@BranchID	int,
@BranchName varchar(100),
@BranchCode varchar(100),
@Created datetime = null,
@Modified datetime = null
as
Begin
	Update [dbo].[MST_Branch] set
		[dbo].[MST_Branch].[BranchCode] = @BranchCode,
		[dbo].[MST_Branch].[BranchName] = @BranchName,
		[dbo].[MST_Branch].[Created] = ISNULL(@Created,GetDate()),
		[dbo].[MST_Branch].[Modified] = ISNULL(@Modified,GETDATE())
	where [dbo].[MST_Branch].[BranchID] = @BranchID
End



-- Delete by PK
Create or Alter Procedure [dbo].[PR_MST_Branch_DeleteByBranchID]
@BranchID int
as
Begin
	Delete from [dbo].[MST_Branch] 
	where [dbo].[MST_Branch].[BranchID] = @BranchID
End

--Executions
Exec PR_MST_Branch_SelectAll
Execute PR_MST_Branch_SelectAll
Exec PR_MST_Branch_Insert 'CSE','210CS1010','',''
Execute PR_MST_Branch_SelectByBranchID 10

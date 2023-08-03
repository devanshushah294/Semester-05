Use Student_Reginstration
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

Execute PR_MST_Branch_SelectAll

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
Execute PR_MST_Branch_SelectByBranchID 10

Create or Alter Procedure [dbo].[PR_MST_Branch_Insert]
@BranchName varchar(100),
@BranchCode varchar(100),
@Created	datetime,
@Modified	datetime
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
		@Created,
		@Modified
	)
End
Exec PR_MST_Branch_Insert 'CSE','210CS1010','2003-2-2','2022-2-3'
Use Student_Reginstration
Create or ALter PROCEDURE [dbo].[PR_MST_Student_SelectAll]
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
		[dbo].[LOC_City].[CityName]
	
	from [dbo].[MST_Student]
	INNER JOIN [dbo].[LOC_City]
	on [dbo].[MST_Student].[CityID] = [dbo].[LOC_City].[CityID]
End
EXEC PR_MST_Student_SelectAll

Create or ALter PROCEDURE [dbo].[PR_MST_Student_GetStudentByID]
@StundentID int
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
		[dbo].[LOC_City].[CityName]
	
	from [dbo].[MST_Student]
	
	INNER JOIN [dbo].[LOC_City]
	on [dbo].[MST_Student].[CityID] = [dbo].[LOC_City].[CityID]
	
	where [dbo].[MST_Student].[StudentID] = @StundentID
End
EXEC PR_MST_Student_GetStudentByID 4

Create or ALter PROCEDURE [dbo].[PR_MST_Student_GetStudentByID]
@StundentID int
as
Begin
	Delete from [dbo].[MST_Student]
	where [dbo].[MST_Student].[StudentID] = @StundentID
End
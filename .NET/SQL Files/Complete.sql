USE [Student_Registration]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_Select_By_PrimaryKey]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [dbo].[PR_LOC_City_Select_By_PrimaryKey]
@CityID int
as
Begin
	Select 
		[dbo].[LOC_City].[CityID],
		[dbo].[LOC_City].[Citycode],
		[dbo].[LOC_City].[CityName],
		[dbo].[LOC_City].[StateID],
		[dbo].[LOC_City].[CreationDate],
		[dbo].[LOC_City].[Modified],
		[dbo].[LOC_City].[CountryID],
		[dbo].[LOC_State].[StateName],
		[dbo].[LOC_Country].[CountryName]
	from [dbo].[LOC_City] 

	INNER JOIN [dbo].[LOC_State]
	on [dbo].[LOC_City].[StateID] = [dbo].[LOC_State].[StateID]

	INNER JOIN [dbo].[LOC_Country]
	on [dbo].[LOC_City].[CountryID] = [dbo].[LOC_Country].[CountryID]

	where [dbo].[LOC_City].[CityID] = @CityID
End
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectAll]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   Procedure [dbo].[PR_LOC_City_SelectAll]
as
select 
	[dbo].[LOC_City].[CityID],
	[dbo].[LOC_City].[Citycode],
	[dbo].[LOC_City].[CityName],
	[dbo].[LOC_City].[StateID],
	[dbo].[LOC_City].[CreationDate],
	[dbo].[LOC_City].[Modified],
	[dbo].[LOC_City].[CountryID],
	[dbo].[LOC_State].[StateName],
	[dbo].[LOC_Country].[CountryName]
	
	from [dbo].[LOC_City] 

	INNER JOIN [dbo].[LOC_State]
	on [dbo].[LOC_City].[StateID] = [dbo].[LOC_State].[StateID]

	INNER JOIN [dbo].[LOC_Country]
	on [dbo].[LOC_City].[CountryID] = [dbo].[LOC_Country].[CountryID]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_Delete]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_Country_Delete]
@CountryID int
as
BEGIN
	Delete from [dbo].[LOC_Country]

	where [dbo].[LOC_Country].[CountryID] = @CountryID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_Insert]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     Procedure [dbo].[PR_LOC_Country_Insert]
@CountryName varchar(100),
@CountryCode varchar(50),
@Created datetime = null,
@Modified datetime = null
as
BEGIN
	Insert into [dbo].[LOC_Country]
	(
		[dbo].[LOC_Country].[CountryName],
		[dbo].[LOC_Country].[CountryCode],
		[dbo].[LOC_Country].[Created],
		[dbo].[LOC_Country].[Modified]
	)
	values
	(
		@CountryName,
		@CountryCode,
		ISNULL(@Created,GETDATE()),
		ISNULL(@Modified,GETDATE())
	)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectAll]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   Procedure [dbo].[PR_LOC_Country_SelectAll]
as
BEGIN
	Select 
		[dbo].[LOC_Country].[CountryID],
		[dbo].[LOC_Country].[CountryName],
		[dbo].[LOC_Country].[CountryCode],
		[dbo].[LOC_Country].[Created],
		[dbo].[LOC_Country].[Modified]
	from [dbo].[LOC_Country]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectByCountryID]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   Procedure [dbo].[PR_LOC_Country_SelectByCountryID]
@CountryID int
as
BEGIN
	Select 
		[dbo].[LOC_Country].[CountryID],
		[dbo].[LOC_Country].[CountryName],
		[dbo].[LOC_Country].[CountryCode],
		[dbo].[LOC_Country].[Created],
		[dbo].[LOC_Country].[Modified]
	from [dbo].[LOC_Country]

	where [dbo].[LOC_Country].[CountryID] = @CountryID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_Update]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   Procedure [dbo].[PR_LOC_Country_Update]
@CountryID		int,
@CountryName	varchar(100),
@CountryCode	varchar(50),
@Created		datetime = NULL,
@Modified		datetime = NULL
as
BEGIN
	Update [dbo].[LOC_Country]
	set
		[dbo].[Loc_Country].[CountryName] = @CountryName,
		[dbo].[Loc_Country].[CountryCode] = @CountryCode,
		[dbo].[Loc_Country].[Created] = ISNULL(@Created,(Select [dbo].[Loc_Country].[Created] from [dbo].[Loc_Country] where [dbo].[Loc_Country].[CountryID] = @CountryID)),
		[dbo].[Loc_Country].[Modified] = ISNULL(@Modified,GETDATE())
	where [dbo].[Loc_Country].[CountryID] = @CountryID

	Select * from [dbo].[LOC_City]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Branch_DeleteByBranchID]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   Procedure [dbo].[PR_MST_Branch_DeleteByBranchID]
@BranchID int
as
Begin
	Delete from [dbo].[MST_Branch] 
	where [dbo].[MST_Branch].[BranchID] = @BranchID
End
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Branch_Insert]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Procedure [dbo].[PR_MST_Branch_Insert]
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
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Branch_SelectAll]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[PR_MST_Branch_SelectAll]
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
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Branch_SelectByBranchID]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[PR_MST_Branch_SelectByBranchID]
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
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Branch_UpdateByBranchID]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Procedure [dbo].[PR_MST_Branch_UpdateByBranchID]
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
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Student_DeleteByStudentID]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [dbo].[PR_MST_Student_DeleteByStudentID]
@StudentID int
as
Begin
	Delete from [dbo].[MST_Student]
	where [dbo].[MST_Student].[StudentID] = @StudentID
End
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Student_GetStudentByID]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create     PROCEDURE [dbo].[PR_MST_Student_GetStudentByID]
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
	[dbo].[LOC_City].[CityName]

from [dbo].[MST_Student]
INNER JOIN [dbo].[LOC_City]
on [dbo].[MST_Student].[CityID] = [dbo].[LOC_City].[CityID]

where [dbo].[MST_Student].[StudentID] = @StudentID
End
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Student_Insert]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Procedure [dbo].[PR_MST_Student_Insert]
	@BranchID int,
	@CityID int,
	@StudentName int,
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
		ISNULL(@Created,GETDATE()),
		ISNULL(@Modified,GETDATE())
	)
End
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Student_SelectAll]    Script Date: 14-08-2023 18:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_Student_SelectAll]
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
GO

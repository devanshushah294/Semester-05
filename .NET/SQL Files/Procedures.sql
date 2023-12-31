USE [Student_Registration]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_DeleteByCityID]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_LOC_City_DeleteByCityID]
@CityID int
as
Begin
	Delete from LOC_City
	where [dbo].[LOC_City].[CityID] = @CityID
End
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_CITY_Filter_CountryName_StateName_CityName_CityCode]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE or Alter PROC [dbo].[PR_LOC_CITY_Filter_CountryName_StateName_CityName_CityCode]
@CityName varchar(50) = null ,
@StateName varchar(50) = null ,
@CountryName varchar(50) = null ,
@CityCode varchar(50) = null 
as
begin
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

Where (@CityName is null OR [dbo].[LOC_City].[CityName] like '%'+@CityName+'%')
AND	  (@StateName is null OR [dbo].[LOC_State].[StateName] like '%'+@StateName+'%')
AND	  (@CountryName is null OR [dbo].[LOC_Country].[CountryName] like '%'+@CountryName+'%')
AND   (@CityCode is null OR [dbo].[LOC_City].[CityCode] like '%'+@CityCode+'%')

ORDER BY [dbo].[LOC_City].[CityID]

end
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_Insert]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_LOC_City_Insert]
@CityName varchar(100),
@CityCode varchar(50),
@StateID int,
@CountryID int
as
Begin
	Insert into LOC_City
	(
		[dbo].[LOC_City].[CityName],
		[dbo].[LOC_City].[CityCode],
		[dbo].[LOC_City].[StateID],
		[dbo].[LOC_City].[CountryID],
		[dbo].[LOC_City].[CreationDate],
		[dbo].[LOC_City].[Modified]
	)
	values
	(
		@CityName,
		@CityCode,
		@StateID,
		@CountryID,
		GETDATE(),
		GETDATE()
	)
End
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_Select_By_PrimaryKey]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_LOC_City_Select_By_PrimaryKey]
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
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectAll]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_LOC_City_SelectAll]
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
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_Update]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_LOC_City_Update]
@CityID int,
@CityName varchar(100),
@CityCode varchar(50),
@StateID int,
@CountryID int
as
Begin
	Update LOC_City 
	set
		[dbo].[LOC_City].[CityName] = @CityName,
		[dbo].[LOC_City].[CityCode] = @CityCode,
		[dbo].[LOC_City].[StateID] = @StateID,
		[dbo].[LOC_City].[CountryID] = @CountryID,
		[dbo].[LOC_City].[Modified] = GETDATE()
	where [dbo].[LOC_City].[CityID] = @CityID
End
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_Delete]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE or Alter Procedure [dbo].[PR_LOC_Country_Delete]
@CountryID int
as
BEGIN
	Delete from [dbo].[LOC_Country]

	where [dbo].[LOC_Country].[CountryID] = @CountryID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_Insert]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE or Alter Procedure [dbo].[PR_LOC_Country_Insert]
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
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectAll]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_LOC_Country_SelectAll]
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
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectByCountryID]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_LOC_Country_SelectByCountryID]
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
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_Update]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_LOC_Country_Update]
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
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_Delete]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_LOC_State_Delete]
@StateID int
as
BEGIN
	Delete from [dbo].[LOC_State]
	where [dbo].[LOC_State].[StateID] = @StateID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_Insert]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_LOC_State_Insert]
@StateName varchar(100),
@CountryID int,
@StateCode varchar(50)
as
BEGIN
	Insert into [dbo].[LOC_State]
	(
		[dbo].[LOC_State].[StateName],
		[dbo].[LOC_State].[CountryID],
		[dbo].[LOC_State].[stateCode],
		[dbo].[LOC_State].[Created],
		[dbo].[LOC_State].[Modified]
	)
	values
	(
		@StateName,
		@CountryID,
		@StateCode,
		GETDATE(),
		GETDATE()
	)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_SelectAll]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_LOC_State_SelectAll]
as
BEGIN
	Select 
		[dbo].[LOC_State].[StateID],
		[dbo].[LOC_State].[StateName],
		[dbo].[LOC_State].[CountryID],
		[dbo].[LOC_State].[StateCode],
		[dbo].[LOC_State].[Created],
		[dbo].[LOC_State].[Modified],
		[dbo].[LOC_Country].[CountryName]
	from [dbo].[LOC_State]

	INNER JOIN [dbo].[LOC_Country]
	on [dbo].[LOC_State].[CountryID] = [dbo].[LOC_Country].[CountryID]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_SelectByStateID]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_LOC_State_SelectByStateID]
@StateID int
as
BEGIN
	Select 
		[dbo].[LOC_State].[StateID],
		[dbo].[LOC_State].[StateName],
		[dbo].[LOC_State].[CountryID],
		[dbo].[LOC_State].[StateCode],
		[dbo].[LOC_State].[Created],
		[dbo].[LOC_State].[Modified]
	from [dbo].[LOC_State]

	where [dbo].[LOC_State].[StateID] = @StateID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_Update]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_LOC_State_Update]
@StateID    int,
@StateName	varchar(100),
@CountryID  int,
@StateCode	varchar(50)
as
BEGIN
	Update [dbo].[LOC_State]
	set
		[dbo].[LOC_State].[StateName] = @StateName,
		[dbo].[LOC_State].[CountryID] = @CountryID,
		[dbo].[LOC_State].[StateCode] = @StateCode,
		[dbo].[LOC_State].[Created] = (Select [dbo].[Loc_State].[Created] from [dbo].[Loc_State] where [dbo].[Loc_State].[StateID] = @StateID),
		[dbo].[LOC_State].[Modified] = GETDATE()
	where [dbo].[LOC_State].[StateID] = @StateID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Branch_DeleteByBranchID]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_MST_Branch_DeleteByBranchID]
@BranchID int
as
Begin
	Delete from [dbo].[MST_Branch] 
	where [dbo].[MST_Branch].[BranchID] = @BranchID
End
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Branch_Insert]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Branch_SelectAll]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Branch_SelectByBranchID]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Branch_UpdateByBranchID]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Student_DeleteByStudentID]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_MST_Student_DeleteByStudentID]
@StudentID int
as
Begin
	Delete from [dbo].[MST_Student]
	where [dbo].[MST_Student].[StudentID] = @StudentID
End
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Student_GetStudentByID]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE or Alter PROCEDURE [dbo].[PR_MST_Student_GetStudentByID]
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
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Student_Insert]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter Procedure [dbo].[PR_MST_Student_Insert] 
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
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Student_SelectAll]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE or ALter PROCEDURE [dbo].[PR_MST_Student_SelectAll]
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
/****** Object:  StoredProcedure [dbo].[PR_MST_Student_UpdateByPK]    Script Date: 30-08-2023 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter Procedure [dbo].[PR_MST_Student_UpdateByPK]
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
GO

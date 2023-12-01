-- Country Table

-- Select All
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

EXEC PR_LOC_Country_SelectAll

-- Select By ID
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

Execute PR_LOC_Country_SelectByCountryID 1

-- Delete By ID
Create or Alter Procedure [dbo].[PR_LOC_Country_Delete]
@CountryID int
as
BEGIN
	Delete from [dbo].[LOC_Country]
	where [dbo].[LOC_Country].[CountryID] = @CountryID
END
Execute PR_LOC_Country_Delete 1

-- INSERT
Create or Alter Procedure [dbo].[PR_LOC_Country_Insert]
@CountryName varchar(100),
@CountryCode varchar(50),
@Created datetime,
@Modified datetime
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

	Select * from [dbo].[LOC_Country]
END

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
Exec PR_LOC_Country_Insert 'INDIA','IND','',''
Exec PR_LOC_Country_Update 1,'INDIA','IND'
Exec PR_LOC_Country_SelectAll

-- filter
Create or Alter PROC [dbo].[PR_LOC_Country_Filter_CountryName_CountryCode]
@CountryName varchar(50) = null ,
@CountryCode varchar(50) = null 
as
begin
Select 
	[dbo].[LOC_Country].[CountryCode],
	[dbo].[LOC_Country].[CountryID],
	[dbo].[LOC_Country].[CountryName],
	[dbo].[LOC_Country].[Created],
	[dbo].[LOC_Country].[Modified]
from [dbo].[LOC_Country]

Where (@CountryName is null OR [dbo].[LOC_Country].[CountryName] like '%'+@CountryName+'%')
AND   (@CountryCode is null OR [dbo].[LOC_Country].[CountryCode] like '%'+@CountryCode+'%')

end
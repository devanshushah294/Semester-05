---Country Table

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

Create or Alter Procedure [dbo].[PR_LOC_Country_Delete]
@CountryID int
as
BEGIN
	Delete from [dbo].[LOC_Country]
	where [dbo].[LOC_Country].[CountryID] = @CountryID
END
Execute PR_LOC_Country_Delete 1

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

	Select * from [dbo].[LOC_City]
END

EXEC PR_LOC_Country_Insert 
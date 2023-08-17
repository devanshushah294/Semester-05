Use Student_Reginstration
Create or Alter Procedure [dbo].[PR_LOC_City_SelectAll]
as
Begin
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
	End
Exec PR_LOC_City_SelectAll

Create or Alter PROCEDURE [dbo].[PR_LOC_City_Select_By_PrimaryKey]
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

EXEC [dbo].[PR_Select_By_PrimaryKey] 5
Create or Alter PROCEDURE [dbo].[PR_LOC_City_Update]
@CityID int,
@CityCode
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

Create or Alter Procedure [dbo].[PR_LOC_City_DeleteByCityID]
@CityID int
as
Begin
	Delete from LOC_City
	where [dbo].[LOC_City].[CityID] = @CityID
End

Select * from LOC_City

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

Exec PR_LOC_City_Insert 'Ahmedabad','Abd',1,1
Select * from LOC_City
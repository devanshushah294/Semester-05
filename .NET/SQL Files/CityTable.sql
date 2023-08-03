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

Create or Alter PROCEDURE PR_Select_By_PrimaryKey
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
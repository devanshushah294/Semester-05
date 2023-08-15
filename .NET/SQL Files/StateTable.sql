use Student_Registration

--State Procedures 

--SelectAll

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

--select By StateID

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

Exec [dbo].[PR_LOC_State_SelectByStateID] 4

select * from LOC_State

--insert in state

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


Exec [dbo].[PR_LOC_State_Insert] 'GUJARAT',4,'GUJ'

--Update in State

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

Exec [dbo].[PR_LOC_State_Update] 2,'gujarat',4,'guj'


--delete in state

Create or Alter Procedure [dbo].[PR_LOC_State_Delete]
@StateID int
as
BEGIN
	Delete from [dbo].[LOC_State]
	where [dbo].[LOC_State].[StateID] = @StateID
END

[PR_LOC_State_Delete] 2




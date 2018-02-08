declare @SigninDate date
declare @SignInTime time
declare @ChildID int, @ParentId int

--this will set the date to 04/16/2016
set @SigninDate = '2016-04-16' 

--As long as the sign in date is less than 04/21/2016
--We will insert a record for all the students and 
--increment the date by one
While @SignInDate < '2016-04-21'
Begin
  set @ChildID = 1
  set @SignInTime = '6:30:00'

  --As long as the child id is less than 29, we will 
  --get the parent1 of the child and add an entry in the
  --sign in table
	while @ChildID < 24	
		Begin
			--If (select ParentId from ParentChildRelationship where ChildID = @ChildID) is not NULL
			--	Begin
					Select @ParentId =  ParentId from ParentChildRelationship where ChildID = @ChildID
					
					--Add only if record does not already exist
					If not exists (select * from SignIn where ChildID = @ChildID 
					and ParentID = @ParentId and Date = @SigninDate and time = @SignInTime )
						Begin
						Insert into SignIn (childid,parentid, Signindate, SigninTime)
						Values (@ChildID, @ParentId, @SigninDate, @SignInTime)
						End
				--End
			set @ChildID = @ChildID + 1
			set @SignInTime = DATEADD (MInute, 10, @SignInTime)
		End
	Set @SigninDate = DATEADD (day, 1, @SigninDate)
End

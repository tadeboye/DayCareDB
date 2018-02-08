declare @SignoutDate date
declare @SignoutTime time
declare @ChildID int, @ParentId int

--this will set the date to 04/16/2016
set @SignoutDate = '2016-04-16' 

--As long as the sign out date is less than 04/21/2016
--We will insert a record for all the students and 
--increment the date by one
While @SignoutDate < '2016-04-21'
Begin
  set @ChildID = 1
  set @SignoutTime = '16:30:00'

  --As long as the child id is less than 29, we will 
  --get the parent1 of the child and add an entry out the
  --sign out table
	while @ChildID < 29	
		Begin
			--If (select Parent1Id from Childinfo where ChildID = @ChildID) is not NULL
			--	Begin
					Select @ParentId =  ParentId from ParentChildRelationship where ChildID = @ChildID
					
					--Add only if record does not already exist
					If not exists (select * from SignOut where ChildID = @ChildID 
					and ParentID = @ParentId and Date = @SignoutDate and time = @SignoutTime )
						Begin
						insert into Signout (ParentId, ChildID, SignoutDate, SignoutTime)
						Values ( @ParentId, @ChildID, @SignoutDate, @SignoutTime)
						End
				--End
			set @ChildID = @ChildID + 1
			set @SignoutTime = DATEADD (Minute, 10, @SignoutTime)
		End
	Set @SignoutDate = DATEADD (day, 1, @SignoutDate)
End

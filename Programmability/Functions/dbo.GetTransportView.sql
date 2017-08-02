SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetTransportView]
(
	@dateBegin DateTime
)
RETURNS 
@Table TABLE 
(    
    cid numeric(18, 0),
    d1 datetime,distance1 float,
    d2 datetime,distance2 float,
    d3 datetime,distance3 float,
    d4 datetime,distance4 float,
    d5 datetime,distance5 float,
    d6 datetime,distance6 float,
    d7 datetime,distance7 float,    
    d8 datetime,distance8 float,
    transport int
)
AS
BEGIN
	declare 
	    @transport int,
		@d1 datetime,@distance1 float,@d2 datetime,@distance2 float,@d3 datetime,@distance3 float,@d4 datetime,@distance4 float,
		@d5 datetime,@distance5 float,	@d6 datetime,@distance6 float,
		@d7 datetime,@distance7 float,
		@d8 datetime,@distance8 float,
		@i int, @transport_type int,
		@cdate DateTime,@cidcursor numeric(18,0),	
		@tt int
		declare  _carsCursor cursor for select * FROM GetTransportCollection()
		open _carsCursor
		fetch next from _carsCursor into @cidcursor;
		
		declare @datetrack DateTime,@rdate DateTime,@rcarid numeric(18,0),@rdistance float
			
		while @@fetch_status = 0
		 BEGIN
			set @i = 0;
			set @distance1 = 0;
			set @distance2 = 0;
			set @distance3 = 0;
			set @distance4 = 0;
			set @distance5 = 0;
			set @distance6 = 0;
			set @distance7 = 0;
			set @distance8 = 0;
			set @transport = 1;
			WHILE (@i < 8)
			begin
			 set @datetrack = @dateBegin + @i;			  			  
			  --открываем курсор для получения значений по дню для автомобиля			  			  
			  IF @i = 0 
			    begin
					set @d1 = @datetrack;
					declare _resultCursorDay1 cursor for select * from GetTracksByDay(@datetrack,@cidcursor)
					open _resultCursorDay1;		  
					fetch  next from _resultCursorDay1 into @rcarid,@rdate,@rdistance,@tt
					while @@fetch_status = 0
					begin			      
						set @distance1 = @distance1 + @rdistance					
						set @transport = @tt
						fetch  next from _resultCursorDay1 into @rcarid,@rdate,@rdistance,@tt
					end;
					close _resultCursorDay1;
					deallocate  _resultCursorDay1;			  					
					end
			  --второй день
			  IF @i = 1 
			    begin
					
					set @d2 = @datetrack;
					declare _resultCursorDay2 cursor for select * from GetTracksByDay(@datetrack,@cidcursor)
					open _resultCursorDay2;		  
					fetch  next from _resultCursorDay2 into @rcarid,@rdate,@rdistance,@tt
					while @@fetch_status = 0
					begin			      
						set @distance2 = @distance2 + @rdistance		
						set @transport = @tt				
						fetch  next from _resultCursorDay2 into @rcarid,@rdate,@rdistance,@tt
					end;
					close _resultCursorDay2;
					deallocate  _resultCursorDay2;						
					end
			  --третий день 		
			  IF @i = 2 
			    begin
					set @d3 = @datetrack;
					declare _resultCursorDay3 cursor for select * from GetTracksByDay(@d3,@cidcursor)
					open _resultCursorDay3;		  
					fetch  next from _resultCursorDay3 into @rcarid,@rdate,@rdistance,@tt
					while @@fetch_status = 0
					begin			      
						set @distance3 = @distance3 + @rdistance	
						set @transport = @tt					
						fetch  next from _resultCursorDay3 into @rcarid,@rdate,@rdistance,@tt
					end;
					close _resultCursorDay3;
					deallocate  _resultCursorDay3;						
			    end		
			    	    	    
			  IF @i = 3 
			    begin
					set @d4 = @datetrack;
					declare _resultCursorDay4 cursor for select * from GetTracksByDay(@d4,@cidcursor)
					open _resultCursorDay4;		  
					fetch  next from _resultCursorDay4 into @rcarid,@rdate,@rdistance,@tt
					while @@fetch_status = 0
					begin			      
						set @distance4 = @distance4 + @rdistance						
						set @transport = @tt
						fetch  next from _resultCursorDay4 into @rcarid,@rdate,@rdistance,@tt
					end;
					close _resultCursorDay4;
					deallocate  _resultCursorDay4;					
			    end	
			  IF @i = 4 
			    begin
					set @d5 = @datetrack;
					declare _resultCursorDay5 cursor for select * from GetTracksByDay(@datetrack,@cidcursor)
					open _resultCursorDay5;		  
					fetch  next from _resultCursorDay5 into @rcarid,@rdate,@rdistance,@tt
					while @@fetch_status = 0
					begin			      
						set @distance5 = @distance5 + @rdistance	
						set @transport = @tt					
						fetch  next from _resultCursorDay5 into @rcarid,@rdate,@rdistance,@tt
					end;
					close _resultCursorDay5;
					deallocate  _resultCursorDay5;						
			    end	
			  IF @i = 5 
			    begin
					set @d6 = @datetrack;
					declare _resultCursorDay6 cursor for select * from GetTracksByDay(@datetrack,@cidcursor)
					open _resultCursorDay6;		  
					fetch  next from _resultCursorDay6 into @rcarid,@rdate,@rdistance,@tt
					while @@fetch_status = 0
					begin			      
						set @distance6 = @distance6 + @rdistance
						set @transport = @tt						
						fetch  next from _resultCursorDay6 into @rcarid,@rdate,@rdistance,@tt
					end;
					close _resultCursorDay6;
					deallocate  _resultCursorDay6;						
			    end	
			  IF @i = 6 
			    begin
					set @d7 = @datetrack;
					declare _resultCursorDay7 cursor for select * from GetTracksByDay(@datetrack,@cidcursor)
					open _resultCursorDay7;		  
					fetch  next from _resultCursorDay7 into @rcarid,@rdate,@rdistance,@tt
					while @@fetch_status = 0
					begin			      
						set @distance7 = @distance7 + @rdistance	
						set @transport = @tt					
						fetch  next from _resultCursorDay7 into @rcarid,@rdate,@rdistance,@tt
					end;
					close _resultCursorDay7;
					deallocate  _resultCursorDay7;						
			    end			    				    				    	
			  IF @i = 7 
			    begin
					set @d8 = @datetrack;
					declare _resultCursorDay8 cursor for select * from GetTracksByDay(@datetrack,@cidcursor)
					open _resultCursorDay8;	
						  
					fetch  next from _resultCursorDay8 into @rcarid,@rdate,@rdistance,@tt
					while @@fetch_status = 0
					begin			      
						set @distance8 = @distance8 + @rdistance	
						set @transport = @tt					
						fetch  next from _resultCursorDay8 into @rcarid,@rdate,@rdistance,@tt
					end;
					close _resultCursorDay8;
					deallocate  _resultCursorDay8;						
			    end				    
			  set @i = @i+1;
			end
			
INSERT
INTO
	@Table
VALUES
		(@cidcursor, 
			@d1,@distance1, 
			@d2,@distance2, 
			@d3, @distance3, 
			@d4,@distance4, 
			@d5,@distance5, 
			@d6,@distance6,
			@d7,@distance7,
			@d8,@distance8, @transport)
			fetch next from  _carsCursor into @cidcursor;			
		 end
    	CLOSE _carsCursor;
		DEALLOCATE _carsCursor;	    	
	RETURN 
END
GO
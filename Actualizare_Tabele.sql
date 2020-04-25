------------------------------------------------- ROOMS ------------------------------------------------------------------------
select * from Rooms;

 CREATE OR REPLACE  PROCEDURE  Update_Room(p_room_id in NUMBER , p_room_type in VARCHAR,p_room_price in VARCHAR)
        AS
        BEGIN
        
            UPDATE  Rooms SET  room_type=p_room_type, room_price=p_room_price
            WHERE room_id = p_room_id;
            COMMIT;
            
            DBMS_OUTPUT.PUT_LINE('Room updated successfully!');
        
END;
/
---------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------- FOODS ------------------------------------------------------------------------

 CREATE OR REPLACE  PROCEDURE  Update_Food (p_food_id in NUMBER , p_food_type in VARCHAR,p_food_price in VARCHAR)
        AS
        BEGIN
        
            UPDATE Foods SET  food_type=p_food_type, food_price=p_food_price
            WHERE Food_id = p_food_id;
            COMMIT;
            
            DBMS_OUTPUT.PUT_LINE('Food updated successfully!');
        
END;
/
---------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------   REGISTER ------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION Check_Username_Exists (f_username IN VARCHAR)
return number is
userexist NUMBER(1);
begin
 select count(*) into userexist from REGISTER where username=f_username;
  return userexist;
end;
/

CREATE OR REPLACE PROCEDURE Update_Username (p_user_id in NUMBER, p_username in VARCHAR)
AS
BEGIN

   
   if (Check_Username_Exists (p_username)=0) then
	
	UPDATE Register SET  Username=p_username
    WHERE user_id=p_user_id;
	COMMIT;
	
	DBMS_OUTPUT.PUT_LINE('Username updated successfully!...');
	else
    DBMS_OUTPUT.PUT_LINE('Username already exists!...');
	END IF;

END;
/



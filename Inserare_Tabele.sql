
------------------------------------------------- REGISTER --------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE Create_User (p_first_name IN VARCHAR, p_last_name IN VARCHAR, p_username IN VARCHAR, p_password IN VARCHAR)
AS	
BEGIN

    if (Check_Username_Exists (p_username)=0) then
	
	INSERT INTO Register (user_id, First_Name,Last_Name,Username,Password)
    VALUES( register_user_id_seq.nextval, p_first_name, p_last_name, p_username,p_password);
	COMMIT;
	
	DBMS_OUTPUT.PUT_LINE('User created successfully!...');
	else 
    
    DBMS_OUTPUT.PUT_LINE('User already exists!..');
	END IF;
END;
/

SET SERVEROUTPUT ON;
BEGIN
Create_User('Avram', 'Sorin', 'elena.cristiana', 'profesor');

END;
/

select * from Register;
--------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------- ROOMS ------------------------------------------------------------------------

INSERT INTO Rooms (room_id, room_type,room_price) VALUES( rooms_room_id_seq.nextval, 'SINGLE',70);
INSERT INTO Rooms (room_id, room_type,room_price) VALUES( rooms_room_id_seq.nextval, 'SINGLE',70);
INSERT INTO Rooms (room_id, room_type,room_price) VALUES( rooms_room_id_seq.nextval, 'DOUBLE',100);
INSERT INTO Rooms (room_id, room_type,room_price) VALUES( rooms_room_id_seq.nextval, 'DOUBLE',100);
INSERT INTO Rooms (room_id, room_type,room_price) VALUES( rooms_room_id_seq.nextval, 'FAMILY',150);
INSERT INTO Rooms (room_id, room_type,room_price) VALUES( rooms_room_id_seq.nextval, 'FAMILY',150);

select * from Rooms;

CREATE OR REPLACE PROCEDURE Add_Room (p_room_type in VARCHAR, p_room_price in NUMBER)
AS
BEGIN

	INSERT INTO Rooms (room_id, room_type,room_price)
    VALUES(  rooms_room_id_seq.nextval,p_room_type,p_room_price);
	COMMIT;
	
	DBMS_OUTPUT.PUT_LINE('Room added successfully!...');

END;
/

SET SERVEROUTPUT ON;
BEGIN
Add_Room('DOUBLE',100);
END;
/
---------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------- FOODS ------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE Add_Food (p_food_type in VARCHAR, p_food_price in NUMBER)
AS
BEGIN

	INSERT INTO Foods (food_id, food_type,food_price)
    VALUES(  foods_food_id_seq.nextval,p_food_type,p_food_price);
	COMMIT;
	
	DBMS_OUTPUT.PUT_LINE('Food  packet added successfully!...');

END;
/

SET SERVEROUTPUT ON;
BEGIN
Add_Food('Breakfast',15);
Add_Food('Lunch',25);
Add_Food('Dinner',25);
Add_Food('Breakfast and Lunch',35);
Add_Food('Breakfast and Dinner',35);
Add_Food('Lunch and Dinner',45);
Add_Food('All inclusive',60);
END;
/

select * from FOODS;





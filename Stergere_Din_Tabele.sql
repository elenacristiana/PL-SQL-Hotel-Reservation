------------------------------------------------- ROOMS ------------------------------------------------------------------------
select * from Rooms;

CREATE OR REPLACE PROCEDURE  Delete_Room (p_room_id in NUMBER)
AS
BEGIN

	DELETE FROM Rooms
    WHERE room_id = p_room_id;
	COMMIT;

END;
/

SET SERVEROUTPUT ON;
BEGIN
Delete_Room(25);
END;
/
--------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------- FOODS ---------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE  Delete_Foods (p_food_id in NUMBER)
AS
BEGIN

	DELETE FROM Foods
    WHERE food_id = p_food_id;
	COMMIT;

END;
/

SET SERVEROUTPUT ON;
BEGIN
Delete_Foods(7);
END;
/
select * from foods;




------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------- REGISTER ---------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE  Deactivate_Account (p_user_id in NUMBER)
AS
BEGIN

	DELETE FROM Register
    WHERE user_id = p_user_id;
	COMMIT;

END;
/

SET SERVEROUTPUT ON;
BEGIN
Deactivate_Account(7);
END;
/
select * from Register;

------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------  RESERVATION  ---------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE  Delete_Reservation (p_res_id in NUMBER)
AS
BEGIN

	DELETE FROM Reservation
    WHERE res_id = p_res_id;
	COMMIT;

END;
/

SET SERVEROUTPUT ON;
BEGIN
Delete_Reservation(1);
END;
/
select * from Reservation;

------------------------------------------------------------------------------------------------------------------------------------------------

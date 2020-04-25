SET SERVEROUTPUT ON;
-- Generare Trigger pentru data de check-in. 
-- Ne asiguram ca data calendaristica trebuie sa fie mai mare de cea actuala(a sistemului). 
CREATE OR REPLACE TRIGGER Trg_Check_In 
    BEFORE INSERT OR UPDATE ON Reservation 
    FOR EACH ROW 
BEGIN
IF( :new.Check_In <= SYSDATE )
THEN
RAISE_APPLICATION_ERROR( -20001,
'Data invalida: ' || TO_CHAR( :new.Check_In, 'DD.MM.YYYY HH24:MI:SS' ) || ' trebuie sa fie mai mare decat data curenta.' );
END IF;
END; 
/
-------------------------------------------------------------------------------------------------------------------------------

-- Trigger pentru autoincrementarea Id-ului tipului de pachet inclus
CREATE SEQUENCE foods_food_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER foods_food_id_trg BEFORE
    INSERT ON foods
    FOR EACH ROW
    WHEN ( new.food_id IS NULL )
BEGIN
    :new.food_id := foods_food_id_seq.nextval;
END;
/

--------------------------------------------------------------------------------------------------------------------------------

-- Trigger pentru autoincrementarea Id-ului Rezervarii
CREATE SEQUENCE reservation_res_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER reservation_res_id_trg BEFORE
    INSERT ON reservation
    FOR EACH ROW
    WHEN ( new.res_id IS NULL )
BEGIN
    :new.res_id := reservation_res_id_seq.nextval;
END;
/

--------------------------------------------------------------------------------------------------------------------------------


-- Trigger pentru autoincrementarea id-ului statusului rezervarii
CREATE SEQUENCE reservation_status_status_id START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER reservation_status_status_id BEFORE
    INSERT ON reservation_status
    FOR EACH ROW
    WHEN ( new.status_id IS NULL )
BEGIN
    :new.status_id := reservation_status_status_id.nextval;
END;
/


--------------------------------------------------------------------------------------------------------------------------------
-- Trigger pentru autoincrementarea Id-ului camerei 
CREATE SEQUENCE rooms_room_id_seq START WITH 20 NOCACHE ORDER;


CREATE OR REPLACE TRIGGER rooms_room_id_trg BEFORE
    INSERT ON rooms
    FOR EACH ROW
    WHEN ( new.room_id IS NULL )
BEGIN
    :new.room_id := rooms_room_id_seq.nextval;
END;
/

--------------------------------------------------------------------------------------------------------------------------------
-- Trigger pentru autoincrementarea Id-ului user-ului
CREATE SEQUENCE register_user_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER  register_user_id_trg BEFORE
    INSERT ON register
    FOR EACH ROW
    WHEN ( new.user_id IS NULL )
BEGIN
    :new.user_id := register_user_id_seq.nextval;
END;
/

--------------------------------------------------------------------------------------------------------------------------------



---------------------------------------- TRIGGERE PENTRU INSERARE IN TABELE --------------------------------------------------

------------------------------------------------- REGISTER --------------------------------------------------------------------
CREATE OR REPLACE TRIGGER trigger_register_insert
	AFTER INSERT 
		ON Register
			FOR EACH ROW
BEGIN
	
	DBMS_OUTPUT.PUT_LINE('New account created by a new user.');
	
END;
/
--------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------- ROOMS ------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER trigger_rooms_insert
	AFTER INSERT 
		ON Rooms
			FOR EACH ROW
BEGIN
	
	DBMS_OUTPUT.PUT_LINE('New room is added.');
	
END;
/
--------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------- FOODS ------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER trigger_foods_insert
	AFTER INSERT 
		ON Foods
			FOR EACH ROW
BEGIN
	
	DBMS_OUTPUT.PUT_LINE('New food packet is added.');
	
END;
/

--------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------- RESERVATION ------------------------------------------------------------------
CREATE OR REPLACE TRIGGER trigger_reservation_insert
	AFTER INSERT 
		ON Reservation
			FOR EACH ROW
BEGIN
	
	DBMS_OUTPUT.PUT_LINE('New reservation is created.');
	
END;
/
--------------------------------------------------------------------------------------------------------------------------------
---------------------------------------- TRIGGERE PENTRU ACTUALIZARE IN TABELE -------------------------------------------------


------------------------------------------------- ROOMS ------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER trigger_rooms_update
	AFTER update 
		ON Rooms
			FOR EACH ROW
BEGIN
	
	DBMS_OUTPUT.PUT_LINE('Room updated');
	
END;
/
--------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------- FOODS ------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER trigger_foods_update
	AFTER update 
		ON Foods
			FOR EACH ROW
BEGIN
	
	DBMS_OUTPUT.PUT_LINE('Food packet updated');
	
END;
/

--------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------- RESERVATION ------------------------------------------------------------------
CREATE OR REPLACE TRIGGER trigger_reservation_update
	AFTER update 
		ON Reservation
			FOR EACH ROW
BEGIN
	
	DBMS_OUTPUT.PUT_LINE('Reservation updated');
	
END;
/
--------------------------------------------------------------------------------------------------------------------------------


---------------------------------------- TRIGGERE PENTRU STERGERE IN TABELE ----------------------------------------------------


------------------------------------------------- ROOMS ------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER trigger_rooms_delete
	AFTER delete 
		ON Rooms
			FOR EACH ROW
BEGIN
	
	DBMS_OUTPUT.PUT_LINE('A room removed');
	
END;
/
--------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------- REGISTER ---------------------------------------------------------------------

CREATE OR REPLACE TRIGGER trigger_register_delete
	AFTER delete 
		ON Register
			FOR EACH ROW
BEGIN
	
	DBMS_OUTPUT.PUT_LINE('An user deactivate his account');
	
END;
/
--------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------- FOODS ------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER trigger_foods_delete
	AFTER delete 
		ON Foods
			FOR EACH ROW
BEGIN
	
	DBMS_OUTPUT.PUT_LINE('A food packet removed');
	
END;
/

--------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------- RESERVATION ------------------------------------------------------------------
CREATE OR REPLACE TRIGGER trigger_reservation_delete
	AFTER delete 
		ON Reservation
			FOR EACH ROW
BEGIN
	
	DBMS_OUTPUT.PUT_LINE('Reservation canceled');
	
END;
/
--------------------------------------------------------------------------------------------------------------------------------


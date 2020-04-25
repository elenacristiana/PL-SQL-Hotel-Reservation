------------ Test pachet rezervari ---------------------

exec reservation_pack.Insert_Reservation_Data('elena@yahoo.com','222333',TO_DATE('2020-01-25','YYYY-MM-DD'),TO_DATE('2020-01-28','YYYY-MM-DD'),29,8,5);
SELECT res_id,email,phone,check_in,check_out,room_id,first_name, last_name, username,food_id,status_id FROM reservation, register where register.username='elena.cristiana' ORDER BY check_in ASC;
delete from reservation where res_id=19;
--------------- Selectare din tabele -----------------
select * from Register order by user_id;
select * from Rooms order by room_id;
select * from Foods order by food_id;
select * from Reservation order by res_id;
select * from Reservation_Status;

----- Test pachet register -------------------

exec register_Pack.Update_Username(6,'ava.madalina');
exec register_pack.deactivate_account(10);
exec register_pack.create_user('Popescu', 'Ion', 'popescuion','popescu');


---------- Test update username ---------------
SET SERVEROUTPUT ON;
BEGIN
Update_Username(6,'elenacristiana');
END;
/

--------------- Test functie de Login ------------
SET SERVEROUTPUT ON;
DECLARE
	name varchar2(30);
	pass varchar2(30);
	
	ok number;
	
BEGIN
	name := 'madalina.ava';
	pass := 'avarvarei';
    
	ok := login(name, pass);
	
	if( ok = 1 )
		then dbms_output.put_line('Successfull login!');
	else dbms_output.put_line('errors');
	
	end if;
	
END;
/
------- alte teste------
select * from Register where username='elena.cristiana';
SELECT rooms.room_id,room_type,room_price FROM rooms,reservation where (status_id=2)  or (rooms.room_id not in (select reservation.room_id from reservation where (check_out>=to_date('2020-01-10','yyyy-MM-dd') and check_in<=to_date('2020-01-10','yyyy-MM-dd')) or (check_in>to_date('2020-01-10','yyyy-MM-dd') and check_out<to_date('2020-01-10','yyyy-MM-dd')))) order by rooms.room_id ASC;

----teste rezervari------

SET SERVEROUTPUT ON;
BEGIN
Update_Reservation_Data(24,21,TO_DATE('2020-01-23','YYYY-MM-DD'),TO_DATE('2020-01-25','YYYY-MM-DD'));
 end;
 /
 select * from rooms;
 select * from reservation;
 
 delete from reservation where res_id=31;
 select * from register;
 begin
 Insert_Reservation_Data('popescu@yahoo.com','882345',TO_DATE('2020-01-26','YYYY-MM-DD'),TO_DATE('2020-01-28','YYYY-MM-DD'),29,13,4);
end;
/

select check_in, check_out, status_id from reservation where room_id =29;


------- test camera update ------------

SET SERVEROUTPUT ON;
DECLARE
	check_in reservation.check_in%type;
	check_out  reservation.check_out%type;
    room_number rooms.room_id%type;
	
	ok boolean;
	
BEGIN
	check_in:=TO_DATE('2019-12-20','YYYY-MM-DD');
    check_out:=TO_DATE('2019-12-22','YYYY-MM-DD');
    room_number:=21;
	
    ok :=Check_Updatable_Room(room_number,check_in,check_out,8);
	
	if( ok = true )
		then dbms_output.put_line('Available room!');
	else dbms_output.put_line('Unavailable room!');
	
	end if;
	
END;
/



------------ test camera valabila -----------


DECLARE
	check_in reservation.check_in%type;
	check_out  reservation.check_out%type;
    room_number rooms.room_id%type;
	
	ok boolean;
 BEGIN
	check_in:=TO_DATE('2020-02-26','YYYY-MM-DD');
    check_out:=TO_DATE('2020-02-28','YYYY-MM-DD');
    room_number:=29;
	
    ok :=Check_Available_Room(room_number,check_in,check_out);
	
	if( ok = true )
		then dbms_output.put_line('Available room!');
	else dbms_output.put_line('Unavailable room!');
	
	end if;
	
END;
/
SELECT room_id from reservation where status_id=2 and room_id not in( select room_id from reservation where (check_out>=to_date('2020-01-08','yyyy-MM-dd') and check_in<=to_date('2020-01-11','yyyy-MM-dd HH24:MI:SS')) or (check_in>to_date('2020-01-08','yyyy-MM-dd') and check_out<to_date('2020-01-11','yyyy-MM-dd HH24:MI:SS'))) order by room_id ASC;
                                                                                                
select * from reservation;
----------------------------------------------   INSERARI DE TEST -------------------------------------------------


select * from reservation order by status_id, res_id;

BEGIN
Update_Reservation_Data(18,8,23,TO_DATE('2020-02-16','YYYY-MM-DD'),TO_DATE('2020-02-18','YYYY-MM-DD'));
 end;
/
select * from reservation;
begin
create_user('Popescu', 'Ion', 'popescuion','popescu');
create_user('Avram', 'Sorin', 'avsorin','profesor');
create_user('Elena', 'Pintilie', 'elena.cristiana','pintilie');
create_user('Madalina', 'Avarvarei', 'ava.madalina','avarvarei');
-----------------------------------------------------------------------
-- user id(penultimul) il pui dupa cum e numarul la tine.
Insert_Reservation_Data('elena@yahoo.com','222333',TO_DATE('2020-01-25','YYYY-MM-DD'),TO_DATE('2020-01-28','YYYY-MM-DD'),29,8,10);
Insert_Reservation_Data('elena@yahoo.com','222333',TO_DATE('2020-01-10','YYYY-MM-DD'),TO_DATE('2020-01-12','YYYY-MM-DD'),29,8,10);
Insert_Reservation_Data('popescu@yahoo.com','883472',TO_DATE('2020-02-16','YYYY-MM-DD'),TO_DATE('2020-01-17','YYYY-MM-DD'),23,13,10);
Insert_Reservation_Data('madalina@yahoo.com','999666',TO_DATE('2020-01-23','YYYY-MM-DD'),TO_DATE('2020-01-25','YYYY-MM-DD'),21,6,10);
Insert_Reservation_Data('avsorin@yahoo.com','129345',TO_DATE('2020-01-08','YYYY-MM-DD'),TO_DATE('2020-01-10','YYYY-MM-DD'),29,9,10);

end;
/
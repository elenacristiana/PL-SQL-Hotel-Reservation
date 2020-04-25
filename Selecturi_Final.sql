-----------------------------------------------------------------------------  PACHET AFISARE CAMERE -----------------------------------------------------------------------------

create or replace package java_refcursor as 
type myrctype is ref cursor return ROOMS%ROWTYPE;
function rooms_listing return myrctype;
end java_refcursor;
/
create or replace package body java_refcursor as
function rooms_listing return myrctype is 
rc myrctype;
begin 
open rc for select * from rooms;
 return rc; 
end; 
end java_refcursor;
/


declare
myrc  java_refcursor.myrctype;
  l_roomid   rooms.room_id%TYPE;
  l_roomtype  rooms.room_type%TYPE;
  l_roomprice  rooms.room_price%TYPE;
begin
myrc:=java_refcursor.rooms_listing();
 LOOP 
    FETCH myrc
    INTO  l_roomid,l_roomtype,l_roomprice;
    EXIT WHEN myrc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(l_roomid || ' | ' || l_roomtype || ' | ' || l_roomprice);
    end loop;
end;
/
------------------------------------------------------------------ PACHET AFISARE MANCARE -----------------------------------------------------------------------------

create or replace package foods_refcursor as 
type myrctype is ref cursor return FOODS%ROWTYPE;
function foods_listing return myrctype;
end foods_refcursor;
/

create or replace package body foods_refcursor as
function foods_listing return myrctype is 
rc myrctype;
begin 
open rc for select * from foods;
 return rc; 
end; 
end foods_refcursor;
/
declare
myrc  foods_refcursor.myrctype;
  l_foodid   rooms.room_id%TYPE;
  l_foodtype  rooms.room_type%TYPE;
  l_foodprice  rooms.room_price%TYPE;
begin
myrc:=foods_refcursor.foods_listing();
 LOOP 
    FETCH myrc
    INTO  l_foodid,l_foodtype,l_foodprice;
    EXIT WHEN myrc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(l_foodid || ' | ' || l_foodtype || ' | ' || l_foodprice);
    end loop;
end;
/

------------------- PACHET AFISARE TOATE REZERVARILE ---------------
create or replace package res_refcursor as 
type myrctype is ref cursor return RESERVATION%ROWTYPE;
function reservation_listing return myrctype;
end res_refcursor;
/
create or replace package body res_refcursor as
function reservation_listing return myrctype is 
rc myrctype;
begin 
open rc for  select * from Reservation;
 return rc; 
end; 
end res_refcursor;
/


declare
myrc  res_refcursor.myrctype;
  l_resid   reservation.res_id%TYPE;
  l_email  reservation.email%TYPE;
  l_phone  reservation.phone%TYPE;
  l_checkin reservation.check_in%TYPE;
  l_checkout reservation.check_out%TYPE;
  l_roomid  reservation.room_id%TYPE;
  l_username reservation.res_id%TYPE;
  l_foodid reservation.food_id%TYPE;
  l_statusid reservation.status_id%TYPE;
begin
myrc:=res_refcursor.reservation_listing();
 LOOP 
    FETCH myrc
    INTO  l_resid,l_email,l_phone,l_checkin,l_checkout,l_roomid,l_username,l_foodid,l_statusid;
    EXIT WHEN myrc%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(l_resid || ' | ' || l_email || ' | ' || l_phone || '|'  || l_checkin || ' | ' || l_checkout || ' | ' || l_roomid  || '|'  || l_username || ' | ' || l_foodid || ' | ' || l_statusid);
    end loop;
end;
/








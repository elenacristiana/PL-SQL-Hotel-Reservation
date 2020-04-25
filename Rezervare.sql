--------------------------------------------------------------------- Functie creata pentru a nu se rezerva o camera care nu mai este valabila-------------------------------------------------------------------------
create or replace function Check_Available_Room
    (room_id_in IN rooms.room_id%type,
    arrival_in IN reservation.check_in%type,
    depart_in IN reservation.check_out%type)
    return boolean is
    ok boolean:=true;
    cnt number:=0;
    v_norows number:=0;
begin
    -- selectam toate rezervarile facute pe acea camera
                for reservation in (select check_in, check_out, status_id from reservation where room_id = room_id_in order by status_id)
                    loop
                        if (reservation.check_in <= arrival_in and reservation.check_out >= arrival_in) 
                            or (reservation.check_in <= depart_in and reservation.check_out >= depart_in)
                            or (arrival_in <= reservation.check_in and depart_in >= reservation.check_out)   then
                                        if(reservation.status_id=2)
                                        then 
                                        return true;
                                        else
                                        return false;
                                        end if;
                        end if;
                    end loop;
                return true;
end;
/

 create or replace function Check_Updatable_Room
                (room_id_in IN rooms.room_id%type,
                arrival_in IN reservation.check_in%type,
                depart_in IN reservation.check_out%type,
                res_in IN reservation.user_id%type,
                user_in IN reservation.user_id%type
                )
                return boolean is
                cnt number:=0;
                av_ok boolean;
            begin
            for checking in (select user_id, check_in, check_out from reservation where room_id = room_id_in and res_id=res_in and user_id=user_in)
            loop
                cnt:=cnt+1;
            end loop;
            if cnt>0
             then
              dbms_output.put_line('Available room and data!');
                return true;
            else 
                av_ok:=Check_Available_Room(room_id_in,arrival_in,depart_in);
                if(av_ok=false)
                then
                dbms_output.put_line('unavailable room and data!');
                else
                dbms_output.put_line('available room and data!');
                end if;
                return av_ok;
           end if;
         
end;
/
-------------------------------------------------------------------------------------------------------------------------




------------------------------------------------------------------- Adaugare rezervare in asa fel incat sa nu se suprapuna cu o camera ocupata------------------------------------------------------------------------
create or replace procedure Insert_Reservation_Data
 (p_email  IN reservation.email%type,
  p_phone IN reservation.phone%type,
  p_check_in IN reservation.check_in%type,
  p_check_out IN reservation.check_out%type,
   p_room_id IN reservation.room_id%type,
  p_user_id IN reservation.user_id%type,
  p_food_id IN reservation.food_id%type
)
AS
ok boolean;
BEGIN
                        ok:=Check_Available_Room(p_room_id,  p_check_in, p_check_out);
                         if(ok=false)
                         then 
                                dbms_output.put_line('Unavailable room and data!');
                        else
                                INSERT INTO Reservation (res_id, email,phone,check_in,check_out,room_id,user_id,food_id,status_id)
                                VALUES(reservation_res_id_seq.nextval,p_email,p_phone,p_check_in,p_check_out,p_room_id,p_user_id,p_food_id,1);
                                COMMIT;
                         end if;

END;
/


-----------------------------------------------------------------------------   ANULAREA REZERVARII -----------------------------------------------------------------------------------------------------------------------

create or replace procedure Cancel_Reservation
 (p_res_id  IN reservation.res_id%type)
 AS
 BEGIN
      UPDATE Reservation SET  status_id=2
      WHERE res_id = p_res_id;
END;
/

----------------------------------------------------------------------------------------------------------------


create or replace procedure Update_Reservation_Data
 (p_res_id  IN reservation.res_id%type,
  p_user_id  IN reservation.user_id%type,
  p_room_id_in IN reservation.room_id%type,
  p_new_arrival_in IN reservation.check_in%type,
  p_new_depart_in IN reservation.check_out%type
  )
AS
ok boolean;
BEGIN
                        ok:=Check_Updatable_Room(p_room_id_in,  p_new_arrival_in, p_new_depart_in,p_res_id,p_user_id);
                         if(ok=false)
                         then 
                                dbms_output.put_line('Unavailable room and data!');
                        else
                                UPDATE Reservation SET  room_id=p_room_id_in, check_in=p_new_arrival_in, check_out=p_new_depart_in
                                WHERE res_id = p_res_id;
                                 dbms_output.put_line('Succesfull update! Check your reservation!');
                                COMMIT;
                         end if;

END;
/



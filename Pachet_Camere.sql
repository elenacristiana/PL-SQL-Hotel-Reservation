SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE Room_Pack IS

-- Adaugarea camerei
PROCEDURE Add_Room (p_room_type in VARCHAR, p_room_price in NUMBER);
-- Actualizarea  tipului de camera
PROCEDURE  Update_Room_Type (p_room_id in NUMBER , p_room_type in VARCHAR);
-- Actualizarea pretului camerei
PROCEDURE  Update_Room_Price (p_room_id in NUMBER , p_room_price in VARCHAR);
--Stergerea camerei 
 PROCEDURE  Delete_Room (p_room_id in NUMBER);
 
end Room_Pack;
/

CREATE OR REPLACE PACKAGE BODY Room_Pack IS
                    
        PROCEDURE Add_Room (p_room_type in VARCHAR, p_room_price in NUMBER)
        AS
        BEGIN
        
            INSERT INTO Rooms (room_id, room_type,room_price)
            VALUES(  rooms_room_id_seq.nextval,p_room_type,p_room_price);
            COMMIT;
            
            DBMS_OUTPUT.PUT_LINE('Room added successfully!...');
        
        END Add_Room;
        
        
        PROCEDURE  Update_Room_Type (p_room_id in NUMBER , p_room_type in VARCHAR)
        AS
        BEGIN
        
            UPDATE Rooms SET  room_type=p_room_type
            WHERE room_id = p_room_id;
            COMMIT;
            
            DBMS_OUTPUT.PUT_LINE('Room type updated successfully!');
        
        END Update_Room_Type;

        
        
        
        PROCEDURE  Update_Room_Price (p_room_id in NUMBER , p_room_price in VARCHAR)
        AS
        BEGIN
        
            UPDATE Rooms SET  room_price=p_room_price
            WHERE room_id = p_room_id;
            COMMIT;
            
            DBMS_OUTPUT.PUT_LINE('Room price updated successfully!');
        
        END Update_Room_Price;
        
        PROCEDURE  Delete_Room (p_room_id in NUMBER)
        AS
        BEGIN
        
            DELETE FROM Rooms
            WHERE room_id = p_room_id;
            COMMIT;
        
        END Delete_Room;
        
end Room_Pack;
/




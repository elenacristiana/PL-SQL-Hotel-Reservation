SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE Food_Pack IS

-- Adaugarea mesei
PROCEDURE Add_Food (p_food_type in VARCHAR, p_food_price in NUMBER);
-- Actualizarea  tipului de masa
PROCEDURE  Update_Food (p_food_id in NUMBER , p_food_type in VARCHAR, p_food_price in VARCHAR);
--Stergerea mesei
 PROCEDURE  Delete_Foods (p_Food_id in NUMBER);

end Food_Pack;
/

CREATE OR REPLACE PACKAGE BODY Food_Pack IS


        PROCEDURE Add_Food (p_food_type in VARCHAR, p_food_price in NUMBER)
        AS
        BEGIN
        
            INSERT INTO Foods (food_id, food_type,food_price)
            VALUES(  Foods_food_id_seq.nextval,p_food_type,p_food_price);
            COMMIT;
            
            DBMS_OUTPUT.PUT_LINE('Food added successfully!...');
        
        END Add_Food;
        
        
        PROCEDURE  Update_Food (p_food_id in NUMBER , p_food_type in VARCHAR,p_food_price in VARCHAR)
        AS
        BEGIN
        
            UPDATE Foods SET  food_type=p_food_type, food_price=p_food_price
            WHERE Food_id = p_food_id;
            COMMIT;
            
            DBMS_OUTPUT.PUT_LINE('Food updated successfully!');
        
        END Update_Food;
    
        
        PROCEDURE  Delete_Foods (p_food_id in NUMBER)
        AS
        BEGIN
        
            DELETE FROM Foods
            WHERE food_id = p_food_id;
            COMMIT;
        
        END Delete_Foods;
        
end Food_Pack;
/
exec food_pack.Delete_Foods(8);
select * from Foods;
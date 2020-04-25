SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE Register_Pack IS
-- Verificare daca un user deja exista
FUNCTION Check_Username_Exists (f_username IN VARCHAR) return number; 
-- Crearea utilizatorului
PROCEDURE Create_User (p_first_name IN VARCHAR, p_last_name IN VARCHAR, p_username IN VARCHAR, p_password IN VARCHAR);
-- Actualizare username utilizator
PROCEDURE Update_Username (p_user_id in NUMBER, p_username in VARCHAR);
-- Anulare cont utilizator 
PROCEDURE  Deactivate_Account (p_user_id in NUMBER);
-- Logare utilizator
function login( uname in Register.Username % type, pas in Register.Password % type  )
return number;

end Register_Pack;
/

CREATE OR REPLACE PACKAGE BODY Register_Pack IS

            FUNCTION Check_Username_Exists (f_username IN VARCHAR)
                    return number is
                    userexist NUMBER(1);
                    begin
                     select count(*) into userexist from REGISTER where username=f_username;
                      return userexist;
              END Check_Username_Exists;
            -------------------------------------------------------------
            PROCEDURE Create_User (p_first_name IN VARCHAR, p_last_name IN VARCHAR, p_username IN VARCHAR, p_password IN VARCHAR)
            IS
            BEGIN
                       if (Check_Username_Exists (p_username)=0) then
	
                        INSERT INTO Register (user_id, First_Name,Last_Name,Username,Password)
                        VALUES( register_user_id_seq.nextval, p_first_name, p_last_name, p_username,p_password);
                        COMMIT;
                        
                        DBMS_OUTPUT.PUT_LINE('User created successfully!...');
                        else 
                        
                        DBMS_OUTPUT.PUT_LINE('User already exists!..');
                        END IF;
            END Create_User;
            
            -------------------------------------------------------------
            PROCEDURE Update_Username (p_user_id in NUMBER, p_username in VARCHAR)
            IS BEGIN
                           if (Check_Username_Exists (p_username)=0) then
                            
                            UPDATE Register SET  Username=p_username
                            WHERE user_id=p_user_id;
                            COMMIT;
                            
                            DBMS_OUTPUT.PUT_LINE('Username updated successfully!...');
                            else
                            DBMS_OUTPUT.PUT_LINE('Username already exists!...');
                            END IF;
             
            END Update_Username;
            
            -------------------------------------------------------------
            PROCEDURE  Deactivate_Account (p_user_id in NUMBER)
            AS
            BEGIN
            
                DELETE FROM Register
                WHERE user_id = p_user_id;
                COMMIT;
            
            END Deactivate_Account;
            
            ----------------------------------------------------------
            
            function login( uname in Register.Username % type, pas in Register.Password % type  )
            return number
            is
            ok number := 0;
            name Register.username % type;
            pass  Register.password % type;
            
            cursor c1 is
                select Username, Password from Register;
        begin
            open c1;
                loop
                    fetch c1 into name, pass;
                    exit when c1%notfound;
                    
                    if( name = uname )
                        then
                            if ( pass = pas )
                                then ok := 1;
                            end if;
                    end if;
                
                end loop;
        
            close c1;
            
            if ( ok = 0 )
                then return 0;
            else
                return 1;
            
            end if;
        
        end login;

end Register_Pack;
/


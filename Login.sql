-- Functia de logare:

create or replace function login( uname in Register.Username % type, pas in Register.Password % type  )
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
/




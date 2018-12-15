Unit Moduls;
Interface 
	type 
		anketa=record
			surname:string[26];
			inicials:string[5];
			year:integer;
		end;
		arr= array [1..10] of anketa;
		
		procedure Wor(var from,fromto:text);
		procedure FindGuys(mas: arr; var i_FS,i_YP:integer);
		procedure FillArray(var mas:arr; var txt:text);
		
Implementation

	procedure FillArray(var mas:arr; var txt:text);
	var 
		i:integer;
	begin
		reset(txt);
		for i:=1 to 10 do with mas[i] do
			readln(txt,surname,inicials,year);
		close(txt);
	end;

	procedure FindGuys(mas: arr; var i_FS,i_YP:integer);
	var
		i:integer;
	begin
		i_FS:=1; i_YP:=1;
		for i:=2 to 10 do begin
			if mas[i_FS].surname > mas[i].surname then
				i_FS:=i;
			if mas[i_YP].year < mas[i].year then
				i_YP:=i;
		end;
	end;

	procedure Wor(var from,fromto:text);
	var 
		people:arr;
		FS,YP:integer;
	begin
		FillArray(people,from);
		FindGuys(people,FS,YP);
		rewrite(fromto);
		with people[FS] do writeln(fromto,'First Surname in list: ', surname,inicials,year);
		with people[YP] do writeln(fromto,'Younges People in list: ', surname,inicials,year);
		close(fromto);
	end;
end.
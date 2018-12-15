program labs6;
type 
	anketa=record
		surname:string[25];
		inicials:string[5];
		year:integer;
	end;
	arr=array [1..10] of anketa;
var 
	data:text;
	people:arr;
	FS,YP:integer;
	
procedure FillArray(var from:text; var mas:arr;i:integer);
begin
	with mas[i] do 
		readln(from,surname,inicials,year);
	if i=10 then exit;
	FillArray(from,mas,i+1);
end;
	
procedure FindGuys(mas:arr; var i_FS,i_YP:integer; i:integer);	
begin
	if mas[i_FS].surname > mas[i].surname then	
		i_FS:=i;
	if mas[i_YP].year < mas[i].year then
		i_YP:=i;
	if i=10 then exit;
	FindGuys(mas,i_FS,i_YP,i+1);
end;

begin
	assign(data,'data-in.txt');
		reset(data);
		FillArray(data,people,1);
		close(data);
	FS:=1; YP:=1;
	FindGuys(people,FS,YP,2);
	assign(data,'data-out.txt');
		rewrite(data);
		with people[FS] do writeln(data,'First Surname in List: ', surname, inicials, year);
		with people[YP] do writeln(data,'Younges People in List: ', surname, inicials,year);
		close(data);
end.
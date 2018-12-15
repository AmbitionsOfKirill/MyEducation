program work3;
type 
	anketa=record
		surname:string[26];
		inicials:string[5];
		year:integer;
	end;
	arr=array [1..10] of anketa;
	Tip=file of anketa;

var 
	data:text;
	TipFile:Tip;
	people:arr;
	FS,YP:integer;

procedure RecordData(var from:text;var Tiped:Tip);
var
	i:integer;
	mas:arr;
begin
	reset(from); rewrite(Tiped);
	for i:=1 to 10 do begin	
		readln(from,mas[i].surname,mas[i].inicials,mas[i].year);
		write(Tiped,mas[i]);
	end;
	close(from); close(Tiped);
end;

procedure FillArray(var Tiped:Tip; var mas:arr);
var 
	i:integer;
begin
	reset(Tiped);
	for i:=1 to 10 do
		read(Tiped,mas[i]);
	close(Tiped);
end;

procedure FindLines(mas:arr; var i_FS:integer; var i_YP:integer);
var 
	i:integer;
begin
	i_FS:=1;
        i_YP:=1;
	for i:=2 to 10 do begin
		if mas[i_FS].surname > mas[i].surname then
			i_FS:=i;
		if mas[i_YP].year < mas[i].year then
			i_YP:=i;
	end;
end;

begin
	assign(data,'data-in.txt'); assign(TipFile,'TipedFile.ghj');
	RecordData(data,TipFile);
	FillArray(TipFile,people);
	FindLines(people,FS,YP);
	assign(data,'data-out.txt');
	rewrite(data);
	with people[FS] do writeln(data,'First Surname in list: ', surname, inicials, year);
	with people[YP] do writeln(data,'Younges People in list: ', surname, inicials, year);
	close(data);
end.
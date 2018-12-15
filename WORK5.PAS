program labs5;
type
    nxt=^anketa;
	anketa=record
	 surname:string[26];
	 inicials:string[5];
	 year:integer;
	 point:nxt;
	end;
var
	data:text;
	list:nxt;

function FillList(var from:text):nxt;
var
	main,first:nxt;
begin
	reset(from);
	new(main);
	first:=main;
	readln(from,main^.surname,main^.inicials,main^.year);
	main^.point:=nil;
	while not Eof(from) do begin
		new(main^.point);
		main:=main^.point;
		readln(from,main^.surname,main^.inicials,main^.year);
		main^.point:=nil;
	end;
	FillList:=first;
end;

function GetFirstSurname(uk:nxt): nxt;
var
	FS:nxt;
begin
	fs:=uk;
	repeat begin
		uk:=uk^.point;
		if fs^.surname > uk^.surname then
			fs:=uk;
	end;until uk^.point=nil;
	GetFirstSurname:= fs;
end;

function GetYoungesPeople(uk:nxt):nxt;
var
	YP:nxt;
begin
	yp:=uk;
	repeat begin
		uk:=uk^.point;
		if yp^.year < uk^.year then
			yp:=uk;
	end; until uk^.point=nil;
	GetYoungesPeople:=yp
end;

var	
	fes,yep:nxt;

begin
	assign(data,'data-in.txt');
        reset(data);
	list:=FillList(data);
	close(data);
	fes:=GetFirstSurname(list);
	yep:=GetYoungesPeople(list);
	assign(data,'data-out5.txt');
	rewrite(data);
	writeln(data,'First Surname in list: ', fes^.surname,fes^.inicials,fes^.year);
	writeln(data,'Younges People in List: ',yep^.surname,yep^.inicials,yep^.year);
	close(data);
end.
program work2;
type
  ar=array [1..10] of string;
var
  data,afg:text;
  i,i_FS,i_YP:integer;
  people:ar;

function GetFirstSurname(a:ar):integer;
var
   j,k,o:integer;
begin
  o:=1;
  for j:=2 to 10 do
    for k:=1 to 25 do begin
      if a[o,k] > a[j,k] then begin
        o:=j;
        break;
      end
      else if a[o,k] < a[j,k] then
       break;
    end;
  GetFirstSurname:=o;
end;

function GetYoungesPeople(a:ar): integer;
var
   str:string;
   frs,l,j,yp_j:integer;
   year:integer;
begin
   frs:=0;
   for j:=1 to 10 do begin
       str:=a[j,32]+a[j,33]+a[j,34]+a[j,35];
       val(str,year,l);
       if frs=0 then begin
          val(str,frs,l);
          yp_j:=j;
       end
       else if frs < year then begin
        frs:=year;
        yp_j:=j;
       end;
   end;
   GetYoungesPeople:=yp_j;
end;

begin
  assign(data,'data-in.txt');
  reset(data);
  for i:=1 to 10 do
    readln(data,people[i]);
  close(data);
  i_FS:=GetFirstSurname(people);
  i_YP:=GetYoungesPeople(people);
  assign(data,'output.txt');
  rewrite(data);
  writeln(data,'First Surname in list: ', people[i_FS]);
  writeln(data,'First Younges People in list: ',people[i_YP]);
  close(data);
end.
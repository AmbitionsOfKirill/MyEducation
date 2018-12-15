program labs1;
var
   people: array [1..10,1..35] of char;
   i,j:integer;
   data:text;
   i_fs,i_yp:integer;

begin
     assign(data,'data-in.txt');
     reset(data);
     for i:=1 to 10 do begin
       for j:=1 to 35 do
         read(data,people[i,j]);
       readln(data);
     end;
     close(data);

     {rabota s massivom}
     i_fs:=1;
     i_yp:=1;
     for i:=2 to 10 do begin
       for j:=1 to 25 do begin
           if people[i_fs,j]>people[i,j] then begin
             i_fs:=i;
             break;
           end
           else if people[i_fs,j]<people[i,j] then
             break;
       end;
       for j:=31 to 35 do begin
         if people[i_yp,j]<people[i,j] then begin
           i_yp:=i;
           break;
         end
         else if people[i_yp,j]> people[i,j] then
           break;
       end;
     end;
     assign(data,'data-out.txt');
     rewrite(data);
     writeln(data,'First surname in list: ', people[i_fs]);
     writeln(data,'Surname yonges people in list: ', people[i_yp]);
     close(data);
end.
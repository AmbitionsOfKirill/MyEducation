program labs4;
uses Moduls;
var 
	data,dataout:text;
begin
	assign(data,'data-in.txt');
	assign(dataout,'data-out.txt');
	wor(data,dataout);
end.
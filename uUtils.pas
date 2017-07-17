unit uUtils;

{$mode objfpc}{$H+}

interface

uses
  uBoard;

function boardtoascii(B:Tboard;rotated:boolean=false;simple:boolean=false): string;


implementation


{function StrToInt(const S: string): Longint;
var Error: word;
begin
  Val(S, result, Error);
  if Error <> 0 then raise EConvertError.createfmt(SInvalidInteger,[S]);
end ;}


function boardtoascii(B: Tboard;rotated:boolean=false;simple:boolean=false): string;
begin
result:='test';

end;


end.


function CHESSASCII(cb: Chessboard;rotated:boolean=false;simple:boolean=false): string;
var f,x,y,n:integer;tag :string;
begin
 result:='';
if simple=false then
 begin
   if rotated then n:=63 else n:=0;
  for y:=0 to 7 do begin result:=result+' +---+---+---+---+---+---+---+---+'+chr(10);
   for x:=0 to 7 do begin
    f:=abs(n-(x+y*8));
    Tag:='.';
    if cb[f] and 8 = 0 then Tag:=copy('.pnbrqk',cb[f] and 7 +1,1) else
       Tag:=copy('.PNBRQK',cb[f] and 7 +1,1);

    result:=result+' | '+Tag;end;
    result:=result+' |'+chr(10);
  end;
  result:=result+' +---+---+---+---+---+---+---+---+';
 end
else
begin
  for f:=0 to 63 do
      begin
       if (f and 7)=0 then  result:=result+chr(10);
       Tag:='.';
       if cb[f] and 8 = 0 then Tag:=copy('.pnbrqk',cb[f] and 7 +1,1) else Tag:=copy('.PNBRQK',cb[f] and 7 +1,1);
       result:=result+Tag;
     end;
end;
end;


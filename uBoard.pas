unit uBoard;

{$mode objfpc}{$H+}

interface

uses
  SysUtils,uSquare,uPiece,uvalue,uvaluelist,uRights,ucolor;

type
   Tboard=packed record
     case integer of
     0:(by_squareidx   : array[0..63] of TVALUE);
     1:(by_square: array[Tsquare] of TVALUE);
     2:(by_yx    : array[0..7,0..7] of TVALUE);
    end;

procedure Board_Clear(var aboard:Tboard);
procedure Board_Set(var aboard:Tboard;const Args: array of const);

procedure Board_Fill(var aboard:Tboard; x1, y1, x2, y2: integer; avalue: Tvalue);
function Board_Tostr(aboard :Tboard): string;

procedure Decode_PiecePlacement(pp:Tpieceplacement;var aboard :Tboard);
procedure Encode_PiecePlacement(var pp:Tpieceplacement;aboard :Tboard);


implementation

procedure Board_Set(var aboard:Tboard;const Args: array of const);
begin
end;


procedure Board_Fill(var aboard:Tboard; x1, y1, x2, y2: integer; avalue: Tvalue);
var x,y:integer;begin
  for x:=x1 to x2 do for y:=y1 to y2 do aboard.by_yx[y,x]:=avalue;
end;

procedure Board_Clear(var aboard: Tboard); begin  board_fill(aboard,0,0,7,7,EMPTY) end;


// idea is it to give 2 sets and fill the board with them


function Board_Tostr(aboard :Tboard): string;
var x,y:integer;
begin
 result:='';
  for y:=0 to 7 do begin
    result:=result+' +---+---+---+---+---+---+---+---+'+chr(10);
    for x:=0 to 7 do result:=result+' | '+ValueTochar[aboard.by_yx[y,x]];
    result:=result+' |'+chr(10);
  end;
  result:=result+' +---+---+---+---+---+---+---+---+';
end;

procedure Decode_PiecePlacement(pp:Tpieceplacement;var aboard :Tboard);

var ch :char;f,i:integer;
    function IsInstr(a,b:string):integer;begin if pos(a,b)>0 then result:=1 else result:=0; end;
begin
 board_fill(aboard,0,0,7,7,Empty);

  f:=0;i:=1;
   repeat
     ch := pp[i];
     if ch in ['1'..'8'] then  begin f:=f+strtoint(ch);inc(i);continue;end;
     if ch<>'/' then begin aBoard.by_squareidx[f]:=ValuecharToValue(ch);inc(f);end;
     inc(i);
    until i>length(pp);

end;
procedure Encode_PiecePlacement(var pp:Tpieceplacement;aboard :Tboard);
var
  Q,i: integer;
  p:char;
begin
  pp := '';
  Q := 0;
  i := 0;
  repeat
     if aBoard.by_squareidx[i]=0 then P:='.' else P:=ValueToChar[aBoard.by_squareidx[i] and 15];
     if P = '.' then Inc(Q)
      else
      begin
        if Q <> 0 then
          pp := pp + IntToStr(q);
        Q:=0;
        pp:=pp+p;
      end;
     Inc(i);
     if (i and 7) = 0 then
     begin
       if Q <> 0 then
         pp := pp + IntToStr(q);
       if i <> 64 then
         pp := pp + '/';
       Q := 0;
     end;
   until i > 63;
end;


end.

else
begin
  for f:=0 to 63 do


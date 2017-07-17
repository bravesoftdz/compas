unit uFen;

{$mode objfpc}{$H+}

interface

uses
  sysutils,urights,ucolor;


Procedure Fen_decode(Fen:string;
   var pieceplacement:string;
   var ActiveColor:TColor;
   var Castling:TCastling;
   var Enpassant:TEnpassant;
   var halfmove:Thalfmove;
   var Fullmove:Tfullmove);

Procedure Fen_Encode(var Fen:string;
    pieceplacement:string;
    ActiveColor:TColor;
    Castling:TCastling;
    Enpassant:TEnpassant;
    halfmove:Thalfmove;
    Fullmove:Tfullmove);


implementation

Procedure Fen_decode(Fen:string;
   var pieceplacement:string;
   var ActiveColor:TColor;
   var Castling:TCastling;
   var Enpassant:TEnpassant;
   var halfmove:Thalfmove;
   var Fullmove:Tfullmove);
var i,j :integer;line:string;

begin
 i:=1;j:=0;line:='';
while i<=length(Fen) do
 begin
 if Fen[i]<>' ' then line:=line+Fen[i];
 if (Fen[i]=' ') or (i=length(Fen)) then
  begin

  case j of
   0:Pieceplacement:=line;
   1:ActiveColor   :=Color[strtoint(line)];
   2:Castling      :=StrToCastling(line);
   3:Enpassant     :=StrToEnpassant(line);
   4:Halfmove      :=StrToint(line);
   5:Fullmove      :=StrToint(line);
  end;
  line:='';j:=j+1;
 end;
  inc(i);
 end;
end; {while}


Procedure Fen_Encode(var Fen:string;
    pieceplacement:string;
    ActiveColor:TColor;
    Castling:TCastling;
    Enpassant:TEnpassant;
    halfmove:Thalfmove;
    Fullmove:Tfullmove);
begin
 Fen:=format('%s %s %s %s %d %d',[Pieceplacement,ColorChar[Activecolor],CastlingToStr(Castling),EnpassantToStr(Enpassant),halfmove,Fullmove]);
end;


end.



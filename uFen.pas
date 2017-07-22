
{    Piece placement (from white's perspective). Each rank is described,
     starting with rank 8 and ending with rank 1; within each rank, the contents of each square are described from file "a" through file "h". Following the Standard Algebraic Notation (SAN), each piece is identified by a single letter taken from the standard English names (pawn = "P", knight = "N", bishop = "B", rook = "R", queen = "Q" and king = "K").[1] White pieces are designated using upper-case letters ("PNBRQK") while black pieces use lowercase ("pnbrqk"). Empty squares are noted using digits 1 through 8 (the number of empty squares), and "/" separates ranks.
    Active colour. "w" means White moves next, "b" means Black.
    Castling availability. If neither side can castle, this is "-". Otherwise, this has one or more letters: "K" (White can castle kingside), "Q" (White can castle queenside), "k" (Black can castle kingside), and/or "q" (Black can castle queenside).
    En passant target square in algebraic notation. If there's no en passant target square, this is "-". If a pawn has just made a two-square move, this is the position "behind" the pawn. This is recorded regardless of whether there is a pawn in position to make an en passant capture.[2]
    Halfmove clock: This is the number of halfmoves since the last capture or pawn advance. This is used to determine if a draw can be claimed under the fifty-move rule.
    Fullmove number: The number of the full move. It starts at 1, and is incremented after Black's move.}

unit uFen;

{$mode objfpc}{$H+}

interface

uses
  sysutils,urights,ucolor;

type Tfen=string;

const

  StartPos:Tfen='rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';


Procedure Fen_decode(Fen:Tfen;
   var pieceplacement:Tpieceplacement;
   var ActiveColor:TColor;
   var Castling:TCastling;
   var Enpassant:TEnpassant;
   var halfmove:Thalfmove;
   var Fullmove:Tfullmove);

Procedure Fen_Encode(var Fen:Tfen;
    pieceplacement:Tpieceplacement;
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
   1:ActiveColor   :=ColorcharToColor(line[1]);
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



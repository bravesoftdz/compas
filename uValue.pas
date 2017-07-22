unit uValue;

{$mode objfpc}{$H+}

interface

type

TVALUE=0..15; // a value on the board

TSetofValue=set of Tvalue;

const                                        //0123456789
ValueToChar  : array [TVALUE]  of AnsiChar  = '.pnbrqk..PNBRQK.'; //???
ValueToName : array [TVALUE]  of PAnsiChar = (
'NoPiece','Black Pawn', 'Black Knight','Black Bishop', 'Black Rook', 'Black Queen','Black King','NoPiece','NoPiece',
     'White Pawn', 'White Knight','White Bishop', 'White Rook', 'White Queen','White King','NoPiece');

implementation

end.


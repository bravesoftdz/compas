unit uPiece;

{$mode objfpc}{$H+}

interface

uses uColor,uValue;

type
  TPIECE=integer; // the piece without the color

     // TPIECE + TCOLOR = Tvaluetype

const

  // bit 4 is color and first 3 bits is number of piece


  PAWN  =TPIECE(1); // PIECETYPE
  KNIGHT=TPIECE(2);
  BISHOP=TPIECE(3);
  ROOK  =TPIECE(4);
  QUEEN =TPIECE(5);
  KING  =TPIECE(6);

  EMPTY =TPIECE(0);

  // PieceColorChar-> PCCh
  Piece  : array[TVALUE] of integer=(0,PAWN,KNIGHT,BISHOP,ROOK,QUEEN,KING,0,0,PAWN,KNIGHT,BISHOP,ROOK,QUEEN,KING,0);
  PieceToChar  : array [TVALUE]  of AnsiChar  = '.pnbrqk..PNBRQK.'; //???

  PieceName : array [TVALUE]  of PAnsiChar = (
  'NoPiece','Pawn', 'Knight','Bishop', 'Rook', 'Queen','King','NoPiece','NoPiece'
       ,'Pawn', 'Knight','Bishop', 'Rook', 'Queen','King','NoPiece');


function  ValuecharToValue(pc:char):Tvalue;


type
  TPieceCount=array[0..15] of TPIECE;

  function FlipColor(Piece:integer):integer;


implementation

function ValuecharToValue(pc: char): Tvalue;
begin
  result:=pos(pc,'.pnbrqk..PNBRQK.')-1;
end;

function FlipColor(Piece:integer):integer;
begin
  if (Piece and 8) = 8 then result:=Piece and (15-8) else result:=Piece or 8;
end;


end.


S
V:=PAWN+WHITE

SQUARE[A1]

ColorName[V];
ColorChar[V];
PieceName[PAWN+WHITE]
PieceChar[V];
Piece[V];
Color[V];


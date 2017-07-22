
//Note Still trying wrap my head around how bitboards 'work' , i mean what is the advantage
//and how to use bitboards in the move generation process main advantage seems to me
//that many squares at once can be masked


unit uBitboard;

{$mode objfpc}{$H+}

interface

uses uSquare;


type
  TBB = uint64;
  TBitboard = uint64;
  PBitboard = ^TBitboard;

  const

  BB_Empty    = TBB($0000000000000000);
  BB_Full     = TBB($ffffffffffffffff);

  BB_FileA    = TBB($0101010101010101);
  BB_FileB    = TBB($0202020202020202);
  BB_FileC    = TBB($0404040404040404);
  BB_FileD    = TBB($0808080808080808);
  BB_FileE    = TBB($1010101010101010);
  BB_FileF    = TBB($2020202020202020);
  BB_FileG    = TBB($4040404040404040);
  BB_FileH    = TBB($8080808080808080);

  BB_Rank8    = TBB($00000000000000ff);
  BB_Rank7    = TBB($000000000000ff00);
  BB_Rank6    = TBB($0000000000ff0000);
  BB_Rank5    = TBB($00000000ff000000);
  BB_Rank4    = TBB($000000ff00000000);
  BB_Rank3    = TBB($0000ff0000000000);
  BB_Rank2    = TBB($00ff000000000000);
  BB_Rank1    = TBB($ff00000000000000);

  BB_Light    = TBB($55aa55aa55aa55aa);
  BB_Dark     = TBB($aa55aa55aa55aa55);

  BB_Ranks18  = TBB($ff000000000000ff); // need this to determine promotion
  BB_FilesAH  = TBB($8181818181818181); // pawn attacks ?
  BB_Corners  = TBB($8100000000000081); // usefull for king check ??
  BB_Edge     = TBB($ff818181818181ff); // usefull for determine checkmate ??
  BB_Ranks27  = TBB($00ff00000000ff00); // Pushpawn 2 moves?


function Bitboard_ToStr(BB:Tbitboard):string; //for testing
function Bitboard_tosquare(bb :Tbitboard):TSquare;
function Bitboard_ToSquareIdx(BB:Tbitboard):TSquareIdx;

//function Bitboard_ToSquares(BB:Tbitboard):string;


procedure Bitboard_Init;

function  is_set(bb: TBitboard; sq: TSquare): boolean;
procedure set_bit(var b: TBitboard; sq: TSquare);
procedure xor_bit(var b: TBitboard; sq: TSquare);

function pawn_west_b(pawns: TBitboard): TBitboard;
function pawn_east_b(pawns: TBitboard): TBitboard;
function pawn_attk_b(pawns: TBitboard): TBitboard;
function pawn_west_w(pawns: TBitboard): TBitboard;
function pawn_east_w(pawns: TBitboard): TBitboard;
function pawn_attk_w(pawns: TBitboard): TBitboard;
function Pawn_fwd_one_b(pawns: TBitboard): TBitboard;
function Pawn_fwd_two_b(pawns: TBitboard): TBitboard;
function Pawn_fwd_one_w(pawns: TBitboard): TBitboard;
function Pawn_fwd_two_w(pawns: TBitboard): TBitboard;

var
   SquareBB   : array [TSquare] of TBitboard; // convert a square value into a bb value init needed

implementation

function is_set(bb: TBitboard; sq: TSquare): boolean; inline;
begin
  result:=(bb and SquareBB[sq] <> 0);
end;
procedure set_bit(var b: TBitboard; sq: TSquare); inline;
begin
  b:=(b or SquareBB[Sq]);
end;
procedure xor_bit(var b: TBitboard; sq: TSquare); inline;
begin
  b:=(b xor SquareBB[Sq]);
end;

// pawn moves

// understanding the and not logic here
// for the rest these functions generate a pawnmove on the bitboard
// I'm starting to understand the advantage of BB

function pawn_west_b(pawns: TBitboard): TBitboard; inline;
begin  result := TBB((pawns and not BB_FileA) shl 7);
end;
function pawn_east_b(pawns: TBitboard): TBitboard; inline;
begin
  result := TBB((pawns and not BB_FileH) shl 9);
end;
function pawn_attk_b(pawns: TBitboard): TBitboard; inline;
begin
  result := TBB((pawns and not BB_FileA) shl 7) or TBB((pawns and not BB_FileH) shl 9);
end;
function pawn_west_w(pawns: TBitboard): TBitboard; inline;
begin
  result := TBB((pawns and not BB_FileA) shr 9);
end;
function pawn_east_w(pawns: TBitboard): TBitboard; inline;
begin
  result := TBB((pawns and not BB_FileH) shr 7);
end;
function pawn_attk_w(pawns: TBitboard): TBitboard; inline;
begin
  result := TBB((pawns and not BB_FileA) shr 9) or TBB((pawns and not BB_FileH) shr 7);
end;
function Pawn_fwd_one_b(pawns: TBitboard): TBitboard; inline;
begin
  result := TBB(pawns shl 8);
end;
function Pawn_fwd_two_b(pawns: TBitboard): TBitboard; inline;
begin
  result := TBB(pawns shl 16);
end;
function Pawn_fwd_one_w(pawns: TBitboard): TBitboard; inline;
begin
  result := TBB(pawns shr 8);
end;
function Pawn_fwd_two_w(pawns: TBitboard): TBitboard; inline;
begin
  result := TBB(pawns shr 16);
end;

function Bitboard_tosquare(bb :Tbitboard):TSquare;
var sq :Tsquare;
begin
  for Sq:=A8 to H1 do if bb = SquareBB[sq] then
  result:=Sq
end;

function Bitboard_ToStr(BB: TBB): string;
var i:integer;
begin
  result:='';
  for i:=0 to 63 do
    begin
       if (i and 7)=0 then result:=result+#10;
       if (TBB(BB) and (TBB(1) shl TBB(i))) <> 0 then result:=result+'1' else result:=result+'.';
    end;
end;

//function Bitboard_ToStr(BB: TBB): string;

function Bitboard_ToSquareIdx(BB:Tbitboard):TSquareIdx;
begin

end;


procedure Bitboard_init;
var i:Tsquare;
begin
  for i:=A8 to H1 do     // i'm amazed that this actually works missed that in class :)
      SquareBB[i]:=TBB(1) shl TBB(i);
end;

end.


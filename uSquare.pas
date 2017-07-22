unit uSquare;

{$mode objfpc}{$H+}

interface

uses uvalue;

const

  FileChar:string ='abcdefgh';
  RankChar:string ='87654321';


 //uses
//  Classes, SysUtils;

// A1=0 H8=63 ? then movegeneration ok
type
 // Tsquare=0..63; // thats all ?

//  TRank=array[1..7,0..7] of Tsquare;


  TSquare = (
    A8, B8, C8, D8, E8, F8, G8, H8,
    A7, B7, C7, D7, E7, F7, G7, H7,
    A6, B6, C6, D6, E6, F6, G6, H6,
    A5, B5, C5, D5, E5, F5, G5, H5,
    A4, B4, C4, D4, E4, F4, G4, H4,
    A3, B3, C3, D3, E3, F3, G3, H3,
    A2, B2, C2, D2, E2, F2, G2, H2,
    A1, B1, C1, D1, E1, F1, G1, H1
  );

 TSetofSquare=set of TSquare;
 TSquarelist=array of Tsquare;


  TSquareIdx=0..63;

  TSquare8=array[1..8] of TSquare;

  TSquarevalue=integer;

const
   SquareTostr :array[0..63] of string=(
    'a8','b8', 'c8', 'd8', 'e8', 'f8', 'g8', 'h8',
    'a7','B7', 'c7', 'd7', 'e7', 'f7', 'g7', 'h7',
    'a6','b6', 'c6', 'd6', 'e6', 'f6', 'g6', 'h6',
    'a5','b5', 'c5', 'd5', 'e5', 'f5', 'g5', 'h5',
    'a4','b4', 'c4', 'd4', 'e4', 'f4', 'g4', 'h4',
    'a3','b3', 'c3', 'd3', 'e3', 'f3', 'g3', 'h3',
    'a2','b2', 'c2', 'd2', 'e2', 'f2', 'g2', 'h2',
    'a1','b1', 'c1', 'd1', 'e1', 'f1', 'g1', 'h1'
  );


   _RANK :array[1..8] of
    Tsquare8=(
    (A1,B1,C1,D1,E1,F1,G1,H1),
    (A2,B2,C2,D2,E2,F2,G2,H2),
    (A3,B3,C3,D3,E3,F3,G3,H3),
    (A4,B4,C4,D4,E4,F4,G4,H4),
    (A5,B5,C5,D5,E5,F5,G5,H5),
    (A6,B6,C6,D6,E6,F6,G6,H6),
    (A7,B7,C7,D7,E7,F7,G7,H7),
    (A8,B8,C8,D8,E8,F8,G8,H8)
    );
  _FILE :array[1..8] of
    Tsquare8=(
    (A1,A2,A3,A4,A5,A6,A7,A8),
    (B1,B2,B3,B4,B5,B6,B7,B8),
    (C1,C2,C3,C4,C5,C6,C7,C8),
    (D1,D2,D3,D4,D5,D6,D7,D8),
    (E1,E2,E3,E4,E5,E6,E7,E8),
    (F1,F2,F3,F4,F5,F6,F7,F8),
    (G1,G2,G3,G4,G5,G6,G7,G8),
    (H1,H2,H3,H4,H5,H6,H7,H8)
    );


//  Ranks are the eight horizontal lines or rows of a Chessboard, labeled from '1' to '8'.
// Each rank contains eight horizontally arranged Squares of alternating white and black,
// or light and dark Color. The First Rank is White's back rank, while the Eights Rank is Black's back rank.

type

TRank = ( RANK_1, RANK_2, RANK_3, RANK_4, RANK_5, RANK_6, RANK_7, RANK_8 );

  //Files are the eight vertical lines or columns of a Chessboard, labeled from 'A' to 'H', or 'a' to 'h'.
  //Each file contains eight vertically arranged Squares of alternating white and black, or light and dark Color.
  //In a descriptive notation, files are also nominated by the Pieces from their initial position (similar to Pawns),
  //like Rook-Files (A- and H-File), Knight-Files (B- and G-File), Bishop-Files (C- and F-File), and Queen-File (D-File) and King-File (E-File), also called Center Files.

 TFile = ( FILE_A, FILE_B, FILE_C, FILE_D, FILE_E, FILE_F, FILE_G, FILE_H );


//square = 8*rank + file;
//square = (rank << 3) + file;
//
//with the obvious relation to calculate rank- and file-indices from the square index:
//
//rank = square >> 3; // div 8
//file = square  & 7; // modulo 8

TDelta = integer;

const
  DELTA_SSW = 17; // a8=0 h1=63
  DELTA_SS = 16;
  DELTA_SSE = 15;
  DELTA_SWW =10;
  DELTA_SW =9;
  DELTA_S = 8;
  DELTA_SE = 7;
  DELTA_SEE = 6;
  DELTA_W = 1;
  DELTA_ZERO = 0;
  DELTA_E = -1;
  DELTA_NWW = -6;
  DELTA_NW = -7;
  DELTA_N = -8;
  DELTA_NE = -9;
  DELTA_NEE = -10;
  DELTA_NNW = -15;
  DELTA_NN = -16;
  DELTA_NNE = -17;


operator :=(sq:Tsquare):string;
//operator +(sq:Tsquare;i :integer):integer;


function StrToSquareidx(s:string):Tsquareidx;
  function SquareidxTostr(s:Tsquareidx):string;

  function square(r: TRank; f: TFile): TSquare; inline;
  function file_of(sq: TSquare): TFile; inline;
  function rank_of(sq: TSquare): TRank; inline;
//var RANK1 :TSquare8;


implementation


function SquareIdxToSquare(sqi:TSquareidx):Tsquare;
var i :integer;
begin
 result:=A8;
 for i:=0 to sqi-1 do result:=succ(result);
 result:=result;
end;



function square(r: TRank; f: TFile): TSquare; inline;
begin
  result := TSquare(cardinal(r) shl 3 + cardinal(f));
end;

function file_of(sq: TSquare): TFile; inline;
begin
  result := TFile(cardinal(sq) and 7);
end;

function rank_of(sq: TSquare): TRank; inline;
begin
  result := TRank(cardinal(sq) shr 3);
end;

function SquareidxTostr(s:Tsquareidx):string;
begin
 result:= Filechar[s and 7+1]+Rankchar[s shr 3 +1];
end;

function StrToSquareidx(s:string):Tsquareidx;
begin
  result:= (ord(s[1])-ord('a')) +  (7-(ord(s[2])-ord('1'))) shl 3;
end;

operator:=(sq: Tsquare): string;
begin
  result:=Filechar[ord(sq) and 7+1]+Rankchar[ord(sq) shr 3 +1] ;// shl 3; //
end;


end.



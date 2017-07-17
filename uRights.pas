unit uRights;

{$mode objfpc}{$H+}

interface

uses uSquare;

const
   cCASTLING='KQkq';

type

//    TPieceplacement=array[TSquareIDX] of char;
    TCastling =integer;
    Tfullmove =integer;
    Thalfmove =integer;
    TEnpassant=integer;
    TPiecePlacement=string;


    function CastlingToStr (cast:TCastling):string;
    function StrToCastling (s:string):TCastling;
    function EnpassantToStr(ep: TEnpassant): string;
    function StrToEnpassant (s:string):TEnpassant;

implementation

function CastlingToStr(cast: TCastling): string;
begin
  result:='';
  if (cast and 1) <>0 then result:=result+'K';
  if (cast and 2) <>0 then result:=result+'Q';
  if (cast and 4) <>0 then result:=result+'k';
  if (cast and 8) <>0 then result:=result+'q';
  if result='' then result:='-';
end;
function StrToCastling(s: string): TCastling;
var i,p:integer;

begin
 result:=0;  for i:=1 to length(s) do
  begin
    p:=pos(s[i],cCASTLING);if p<>0 then result:=result+(1 shl (p-1));
  end;
end;
function EnpassantToStr(ep: TEnpassant): string;
begin
 if ep=-1 then result:='-' else result:=cSquarestr[ep];

end;
function StrToEnpassant(s: string): TEnpassant;
begin
 if s<>'-' then result:=strToSquareIDX(s) else result:=-1;
end;

end.

strToSquareIDX('e2');

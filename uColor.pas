unit uColor;

{$mode objfpc}{$H+}

interface

uses uValue;

//not pieces but values are changed a piece is a value without a color
//so to avoid a plethora of conversion everything is centered about values
//a value is on a board position is altered not a piece dont think pieces think values
//also there are no sides there are colors



type
     TCOLOR=integer; // the color without the piece

const

  WHITE =TCOLOR(1 shl 3); // black and white is called color
  BLACK =TCOLOR(0);

     Color  : array[TVALUE] of integer=(BLACK,BLACK,BLACK,BLACK,BLACK,BLACK,BLACK,0,WHITE,WHITE,WHITE,WHITE,WHITE,WHITE,WHITE,0);
     ColorChar : array [TVALUE]  of AnsiChar  = 'bbbbbbb wwwwwww ';
     ColorName : array [TVALUE]  of PAnsiChar = (
     'NoColor','Black', 'Black','Black', 'Black', 'Black','Black','NoColor','NoColor'
          ,'White', 'White','White', 'White', 'White','White','NoColor');

implementation


end.


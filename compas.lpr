program compas;

{$mode objfpc}{$H+}

uses classes,uConstants, uUtils, uFen, uSquare, uPiece, uBitboard, uBoard, uRights,
  uUci, uMain, uColor, uValue, uPieceplacement;

var cmd:string;
     i:integer;
  BOARD :TBOARD;
  SQ :Tsquare;
//PC:  TPieceCount;
//Aside :TSide;
//Aside:  TSide;

begin

   // initialization

//   BOARD[A1]:=WHITE+KING;
   BOARD.by_square[A8]:=White+KING;
//   BOARD.by_value[0]  :=White+king;

   writeln(cName,' Version ',cVersion,' by ',cAuthor);

   // early initialisation

//   init_

   // mainloop


repeat
  cmd:=cmdNone;
  readln(cmd);
   if cmd='isready' then writeln(stdout,'readyok');
   if cmd='d' then writeln(stdout,boardtoascii(Board));
   if cmd='uci' then uci;
  until cmd=cmdQuit;

end.

{ $R *.res}

//Application.Title:='Compas UCI chessengine';
//  Application:=Tcompas.Create(nil);
//  Application.Title:='Compas UCI chessengine';
//  Application.Run;
//  Application.Free;

//uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
// Classes, SysUtils, CustApp
  { you can add units after this ;}

{type

  { Tcompas }

  Tcompas = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;
 }
{ Tcompas }

{procedure Tcompas.DoRun;
var
  ErrorMsg: String;
begin
  // quick check parameters
  ErrorMsg:=CheckOptions('h', 'help');
  if ErrorMsg<>'' then begin
    ShowException(Exception.Create(ErrorMsg));
    Terminate;
    Exit;
  end;

  // parse parameters
  if HasOption('h', 'help') then begin
    WriteHelp;
    Terminate;
    Exit;
  end;

  { add your program here }

  // stop program loop
  Terminate;
end;
 }
{constructor Tcompas.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor Tcompas.Destroy;
begin
  inherited Destroy;
end;

procedure Tcompas.WriteHelp;
begin
  { add your help code here }
  writeln('Usage: ', ExeName, ' -h');
end;
 }
//var
//  Application: Tcompas;



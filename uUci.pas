unit uUci;

{$mode objfpc}{$H+}

interface

uses uConstants;

  function uci:string;



implementation

function uci:string;
begin
  writeln(stdout,'id name '+cName);
  writeln(stdout,'id author '+cAuthor);
  writeln(stdout,'uciok');
  Flush(stdout);
end;

end.


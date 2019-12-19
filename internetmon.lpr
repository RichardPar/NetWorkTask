program internetmon;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Windows ,mainunit
  { you can add units after this };

var
  Ex : Integer;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Ex:=GetWindowLong(FindWindow(nil, 'internetmon'), GWL_EXSTYLE);
  SetWindowLong(FindWindow(nil, 'internetmon'),GWL_EXSTYLE, Ex or WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.


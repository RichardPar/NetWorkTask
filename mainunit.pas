unit mainunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, Menus, laz_synapse, pingsend;

type

  { TForm1 }

  TForm1 = class(TForm)
    ImageList1: TImageList;
    Quit: TMenuItem;
    PopupMenu1: TPopupMenu;
    statustext: TMemo;
    Timer1: TTimer;
    TrayIcon1: TTrayIcon;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QuitClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
var
  myPingSend: TPingSend;
begin
  myPingSend := TPINGSend.Create;
  try
    myPingSend.Timeout:=1000;
    if myPingSend.Ping('8.8.8.8') = TRUE then
      begin
        statustext.lines.Add('Ping to 8.8.8.8 OK');
        ImageList1.GetIcon(5,TrayIcon1.Icon);
      end else
      begin
        statustext.lines.Add('Ping to 8.8.8.8 FAILED');
        ImageList1.GetIcon(4,TrayIcon1.Icon);
      end;
  finally
  end;

  if statustext.lines.Count > 100 then
    begin
      statustext.Lines.Clear;
    end;


  myPingSend.Destroy;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    ImageList1.GetIcon(4,TrayIcon1.Icon);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
      form1.Hide;
  Application.Minimize;
end;

procedure TForm1.QuitClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TForm1.TrayIcon1Click(Sender: TObject);
begin
  Application.Restore;


end;

procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
  Form1.Show;
end;

end.


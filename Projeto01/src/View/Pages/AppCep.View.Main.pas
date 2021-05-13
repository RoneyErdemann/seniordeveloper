unit AppCep.View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  JvExStdCtrls,
  JvEdit;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    EditCEP: TJvEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DisplayCEP ( aValue : String );
    procedure DisplayShow ( aValue : String );
  end;

var
  Form1: TForm1;

implementation

uses
  Model.Services.CEP.Builder;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Button1.Enabled := False;
  Application.ProcessMessages;
  try
    TModelServicesCEPBuilder
      .New
         .CEP
            .Code(EditCEP.Text)
            .Display(DisplayCEP)
         .Execute
  finally
    Button1.Enabled := True;
  end;
  Application.ProcessMessages;
end;

procedure TForm1.DisplayCEP(aValue: String);
begin
  Memo1.Lines.Add(aValue);
end;

procedure TForm1.DisplayShow(aValue: String);
begin
  ShowMessage(aValue);
end;

end.

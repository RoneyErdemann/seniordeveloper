program AppMyCep;

uses
  Vcl.Forms,
  AppCep.View.Main in 'View\Pages\AppCep.View.Main.pas' {Form1},
  Model.Connections.Interfaces in 'Model\Connections\Model.Connections.Interfaces.pas',
  Model.Connections.RestRequest in 'Model\Connections\Model.Connections.RestRequest.pas',
  Model.Services.Interfaces in 'Model\Services\Model.Services.Interfaces.pas',
  Model.Services.CEP.APICEP in 'Model\Services\CEP\Model.Services.CEP.APICEP.pas',
  Model.Services.CEP.ViaCEP in 'Model\Services\CEP\Model.Services.CEP.ViaCEP.pas',
  Model.Services.CEP.Interfaces in 'Model\Services\CEP\Model.Services.CEP.Interfaces.pas',
  Model.Services.CEP.Builder in 'Model\Services\CEP\Model.Services.CEP.Builder.pas',
  Model.Services.CEP.BrasilAPI in 'Model\Services\CEP\Model.Services.CEP.BrasilAPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

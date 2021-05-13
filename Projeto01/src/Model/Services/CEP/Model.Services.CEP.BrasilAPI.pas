unit Model.Services.CEP.BrasilAPI;

interface

uses
  System.SysUtils,
  Model.Services.Interfaces;

Type
  TModelServicesCEPBrasilAPI = Class(TInterfacedObject, iModelServicesCEP)
    private
      FParent : iModelServicesCEP;
      FReturn: String;
      FCode : String;
      FDisplay : TProc<String>;
      procedure _Return(aValue : String);
    public
      constructor Create(aParent: iModelServicesCEP);
      destructor Destroy; override;
      class function New(aParent: iModelServicesCEP): iModelServicesCEP;
      function Code ( aValue : String ) : iModelServicesCEP;
      function Display ( aValue : TProc<String> ) : iModelServicesCEP; overload;
      function Display : TProc<String>; overload;
      function Execute : iModelServicesCEP;
      function Return : String;
  end;

implementation

uses
  Model.Connections.RestRequest;

{ TModelServicesCEPBrasilAPI }

function TModelServicesCEPBrasilAPI.Code(aValue: String): iModelServicesCEP;
begin
  Result := Self;
  FCode := aValue;
end;

constructor TModelServicesCEPBrasilAPI.Create(aParent: iModelServicesCEP);
begin
  FParent := aParent;
end;

destructor TModelServicesCEPBrasilAPI.Destroy;
begin

  inherited;
end;

function TModelServicesCEPBrasilAPI.Display: TProc<String>;
begin
  Result := FDisplay;
end;

function TModelServicesCEPBrasilAPI.Display(
  aValue: TProc<String>): iModelServicesCEP;
begin
  Result := Self;
  FDisplay := aValue;
end;

function TModelServicesCEPBrasilAPI.Execute: iModelServicesCEP;
begin
  Result := Self;
  try
    _Return('BrasilAPI - ' +
    TModelConnectionsRestRequest
      .New
        .Get('https://brasilapi.com.br/api/cep/v1/'+ FCode)
        .Return);
  except
    if Assigned(FParent) then
      _Return(FParent.Code(FCode).Execute.Return);
  end;
end;

class function TModelServicesCEPBrasilAPI.New(aParent: iModelServicesCEP): iModelServicesCEP;
begin
  Result := Self.Create(aParent);
end;

function TModelServicesCEPBrasilAPI.Return: String;
begin
  Result := FReturn;
end;

procedure TModelServicesCEPBrasilAPI._Return(aValue: String);
begin
  FReturn := aValue;
  if Assigned(FDisplay) then
    FDisplay(FReturn);
end;

end.

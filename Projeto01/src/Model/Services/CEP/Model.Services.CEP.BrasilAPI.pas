unit Model.Services.CEP.BrasilAPI;

interface

Uses
  Model.Services.Interfaces;

Type
  TModelServiceCEPBrasilAPI = Class(TInterfacedObject, iModelServicesCEP)
    private
      [weak]
      FParent : iModelServicesCEP;
      FReturn: String;
      FCode : String;
    public
      constructor Create(aParent: iModelServicesCEP);
      destructor Destroy; override;
      class function New(aParent: iModelServicesCEP): iModelServicesCEP;
      function Code ( aValue : String ) : iModelServicesCEP;
      function Execute : iModelServicesCEP;
      function Return : String;
  end;

implementation

uses
  Model.Connections.RestRequest, System.SysUtils;

{ TModelServiceCEPBrasilAPI }

function TModelServiceCEPBrasilAPI.Code(aValue: String): iModelServicesCEP;
begin
  Result := Self;
  FCode := aValue;
end;

constructor TModelServiceCEPBrasilAPI.Create(aParent: iModelServicesCEP);
begin
  FParent := aParent;
end;

destructor TModelServiceCEPBrasilAPI.Destroy;
begin

  inherited;
end;

function TModelServiceCEPBrasilAPI.Execute: iModelServicesCEP;
begin
  Result := Self;
  try
    //raise Exception.Create('Error Message');
    FReturn := 'BrasilAPI - ' +
     TModelConnectionsRestResquest
      .New
        .Get('https://brasilapi.com.br/api/cep/v1/' + FCode)
        .Return;
  except
    if Assigned(FParent) then
      FReturn := FParent.Code(FCode).Execute.Return;
  end;
end;

class function TModelServiceCEPBrasilAPI.New(aParent: iModelServicesCEP): iModelServicesCEP;
begin
  Result := Self.Create(aParent);
end;

function TModelServiceCEPBrasilAPI.Return: String;
begin
  Result := FReturn;
end;

end.

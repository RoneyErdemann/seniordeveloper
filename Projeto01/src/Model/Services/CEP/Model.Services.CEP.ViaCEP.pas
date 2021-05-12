unit Model.Services.CEP.ViaCEP;

interface

Uses
  Model.Services.Interfaces;

Type
  TModelServiceCEPViaCEP = Class(TInterfacedObject, iModelServicesCEP)
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

{ TModelServiceCEPViaCEP }

function TModelServiceCEPViaCEP.Code(aValue: String): iModelServicesCEP;
begin
  Result := Self;
  FCode := aValue;
end;

constructor TModelServiceCEPViaCEP.Create(aParent: iModelServicesCEP);
begin
  FParent := aParent;
end;

destructor TModelServiceCEPViaCEP.Destroy;
begin

  inherited;
end;

function TModelServiceCEPViaCEP.Execute: iModelServicesCEP;
begin
  Result := Self;
  try
    //raise Exception.Create('Error Message');
    FReturn := 'ViaCEP - ' +
     TModelConnectionsRestResquest
      .New
        .Get('https://viacep.com.br/ws/' + FCode + '/json/')
        .Return;
  except
    if Assigned(FParent) then
      FReturn := FParent.Code(FCode).Execute.Return;
  end;
end;

class function TModelServiceCEPViaCEP.New(aParent: iModelServicesCEP): iModelServicesCEP;
begin
  Result := Self.Create(aParent);
end;

function TModelServiceCEPViaCEP.Return: String;
begin
  Result := FReturn;
end;

end.

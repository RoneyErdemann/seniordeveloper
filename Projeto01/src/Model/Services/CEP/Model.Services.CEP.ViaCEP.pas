unit Model.Services.CEP.ViaCEP;

interface

Uses
  System.SysUtils,
  Model.Services.Interfaces;

Type
  TModelServicesCEPViaCEP = Class(TInterfacedObject, iModelServicesCEP)
    private
      FParent : iModelServicesCEP;
      FReturn: String;
      FCode : String;
      FDisplay : TProc<String>;
      procedure _Return(aValue : String);
    public
      constructor Create(aParent : iModelServicesCEP);
      destructor Destroy; override;
      class function New(aParent : iModelServicesCEP): iModelServicesCEP;
      function Code ( aValue : String ) : iModelServicesCEP;
      function Display ( aValue : TProc<String>) : iModelServicesCEP; overload;
      function Display : TProc<String>; overload;
      function Execute : iModelServicesCEP;
      function Return : String;
  end;

implementation

uses
  Model.Connections.RestRequest;

{ TModelServicesCEPAPICEP }

function TModelServicesCEPViaCEP.Code(aValue: String): iModelServicesCEP;
begin
  Result := Self;
  FCode := aValue;
end;

constructor TModelServicesCEPViaCEP.Create(aParent : iModelServicesCEP);
begin
  FParent := aParent;
end;

destructor TModelServicesCEPViaCEP.Destroy;
begin

  inherited;
end;

function TModelServicesCEPViaCEP.Display: TProc<String>;
begin
  Result := FDisplay;
end;

function TModelServicesCEPViaCEP.Display(
  aValue: TProc<String>): iModelServicesCEP;
begin
  Result := Self;
  FDisplay := aValue;
end;

function TModelServicesCEPViaCEP.Execute: iModelServicesCEP;
begin
  Result := Self;
  try
    _Return('ViaCEP - ' +
    TModelConnectionsRestRequest
      .New
        .Get('https://viacep.com.br/ws/'+FCode+'/json/')
        .Return);
  except
    if Assigned(FParent) then
      _Return(FParent.Code(FCode).Execute.Return);
  end;
end;

class function TModelServicesCEPViaCEP.New(aParent : iModelServicesCEP) : iModelServicesCEP;
begin
  Result := Self.Create(aParent);
end;

function TModelServicesCEPViaCEP.Return: String;
begin
  Result := FReturn;
end;

procedure TModelServicesCEPViaCEP._Return(aValue: String);
begin
  FReturn := aValue;
  if Assigned(FDisplay) then
    FDisplay(FReturn);
end;

end.

unit Model.Services.CEP.APICEP;

interface

Uses
  Model.Services.Interfaces;

Type
  TModelServiceCEPAPICEP = Class(TInterfacedObject, iModelServicesCEP)
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
  Model.Connections.RestRequest;

{ TModelServiceCEPAPICEP }

function TModelServiceCEPAPICEP.Code(aValue: String): iModelServicesCEP;
begin
   Result := Self;
   FCode := aValue;
end;

constructor TModelServiceCEPAPICEP.Create(aParent: iModelServicesCEP);
begin
  FParent := aParent;
end;

destructor TModelServiceCEPAPICEP.Destroy;
begin

  inherited;
end;

function TModelServiceCEPAPICEP.Execute: iModelServicesCEP;
begin
  Result := Self;
  try
    FReturn := 'APICEP - '+
     TModelConnectionsRestResquest
      .New
        .Get('https://ws.apicep.com/cep/' + FCode + '.json')
        .Return;
  except
    if Assigned(FParent) then
      FReturn := FParent.Code(FCode).Execute.Return;
  end;
end;

class function TModelServiceCEPAPICEP.New(aParent: iModelServicesCEP): iModelServicesCEP;
begin
  Result := Self.Create(aParent);
end;

function TModelServiceCEPAPICEP.Return: String;
begin
  Result := FReturn;
end;

end.

unit Model.Services.CEP.Builder;

interface

Uses
  Model.Services.CEP.Interfaces, Model.Services.Interfaces;

Type
  TModelServicesCEPBuilder = Class(TInterfacedObject, iModelServicesCEPBuilder)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iModelServicesCEPBuilder;
      function CEP : iModelServicesCEP;
  end;

implementation

uses
  Model.Services.CEP.ViaCEP, Model.Services.CEP.APICEP,
  Model.Services.CEP.BrasilAPI;

{ TModelServicesCEPBuilder }

function TModelServicesCEPBuilder.CEP: iModelServicesCEP;
begin
  Result :=
    TModelServiceCEPViaCEP
      .New(
         TModelServiceCEPAPICEP
          .New(
              TModelServiceCEPBrasilAPI
              .New(nil))
        );
end;

constructor TModelServicesCEPBuilder.Create;
begin

end;

destructor TModelServicesCEPBuilder.Destroy;
begin

  inherited;
end;

class function TModelServicesCEPBuilder.New: iModelServicesCEPBuilder;
begin
  Result := Self.Create;
end;

end.

unit Model.Connections.RestRequest;

interface

Uses
  Model.Connections.Interfaces,
  RESTRequest4D;

Type
  TModelConnectionsRestResquest = Class(TInterfacedObject, iModelConnectionsInterface)
  private
    FReturn : String;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConnectionsInterface;
    function Get ( aValue : String) : iModelConnectionsInterface;
    function Return : String;
end;

implementation

{ TModelConnectionsRestResquest }

constructor TModelConnectionsRestResquest.Create;
begin

end;

destructor TModelConnectionsRestResquest.Destroy;
begin

  inherited;
end;

function TModelConnectionsRestResquest.Get(
  aValue: String): iModelConnectionsInterface;
var
  LResponse: IResponse;
begin
  Result := Self;
  LResponse :=
    TRequest.New
      .BaseURL(aValue)
      .Accept('application/json')
    .Get;
  if LResponse.StatusCode = 200 then
    FReturn := (LResponse.Content);
end;

class function TModelConnectionsRestResquest.New: iModelConnectionsInterface;
begin
  Result := Self.Create;
end;

function TModelConnectionsRestResquest.Return: String;
begin
  Result := FReturn;
end;

end.

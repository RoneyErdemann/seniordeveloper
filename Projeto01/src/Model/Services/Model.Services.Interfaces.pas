unit Model.Services.Interfaces;

interface

Type
  iModelServicesCEP = interface
    ['{252912D3-9D69-4BDB-86B7-9812A286F21C}']
    function Code ( aValue : String ) : iModelServicesCEP;
    function Execute : iModelServicesCEP;
    function Return : String;
  end;

implementation

end.

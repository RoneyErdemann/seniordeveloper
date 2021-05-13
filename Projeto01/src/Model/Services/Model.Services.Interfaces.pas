unit Model.Services.Interfaces;

interface

uses
  System.SysUtils;

type
  iModelServicesCEP = interface
    ['{252912D3-9D69-4BDB-86B7-9812A286F21C}']
    function Code ( aValue : String ) : iModelServicesCEP;
    function Display ( aValue : TProc<String> ) : iModelServicesCEP; overload;
    function Display : TProc<String>; overload;
    function Execute : iModelServicesCEP;
    function Return : String;
  end;

implementation

end.

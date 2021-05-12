unit Model.Connections.Interfaces;

interface

Type
  iModelConnectionsInterface = interface
    ['{3DD2BE08-1627-4B35-B895-C76A9ADC3EFC}']
    function Get ( aValue : String) : iModelConnectionsInterface;
    function Return : String;
  end;

implementation

end.

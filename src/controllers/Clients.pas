{
  file:        Clients.pas
  description: project source file
  source:      https://github.com/zendrael/create_htmx_pascal_app
}
unit Clients;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TClients = class
  private
    { private declarations }
  public
    { public declarations }
    function GetHTMLContent: string;
  end;

implementation

function TClients.GetHTMLContent: string;
var
  HTMLContent: TStringList;
begin
  HTMLContent := TStringList.Create;
  try
    HTMLContent.LoadFromFile(('views/'+LowerCase(UnitName)+'.html'));
    Result := HTMLContent.Text;
  finally
    HTMLContent.Free;
  end;
end;

end.

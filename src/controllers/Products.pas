{
  file:        Products.pas
  description: project source file
  source:      https://github.com/zendrael/create_htmx_pascal_app
}
unit Products;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TProducts = class
  private
    { private declarations }
  public
    { public declarations }
    function GetHTMLContent: string;
  end;

implementation

function TProducts.GetHTMLContent: string;
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

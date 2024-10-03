{
  file:        Home.pas
  description: project source file
  source:      https://github.com/zendrael/create_htmx_pascal_app
}
unit Home;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  THome = class
  private
    { private declarations }
  public
    { public declarations }
    function GetHTMLContent: string;
  end;

implementation

function THome.GetHTMLContent: string;
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

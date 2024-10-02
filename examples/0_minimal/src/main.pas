{
  file:        main.pas
  description: main project source file
  source:      https://github.com/zendrael/create_htmx_pascal_app
}
program main;

{$mode objfpc}{$H+}
 
uses
  {$ifdef UNIX}
    cthreads, cmem,
  {$endif} 
  //fphttpapp, 
  fpcgi, httpdefs, httproute;
 
procedure route1(aReq: TRequest; aResp: TResponse);
begin
  aResp.ContentType := 'text/html;charset=utf-8';
  aResp.content:='<h1 class="response">Welcome to the HTMX + Pascal world!</h1>';
end;
 
procedure route2(aReq: TRequest; aResp: TResponse);
begin
  aResp.ContentType := 'text/html;charset=utf-8';
  aResp.content:='<h1>Route 2 from CGI called! Just an example.</h1>';
end;

var
  aDir : string; //only for localserver

begin
  HTTPRouter.registerRoute('/', @route1, true); //default route
  HTTPRouter.registerRoute('/route2', @route2);
  // Application.port := 8080;
  // Application.threaded := true;
  // if Application.HasOption('d','directory') then
  //   aDir:=Application.GetOptionValue('d','directory')
  // else
  //   aDir:=ExtractFilePath(ParamStr(0))+'..\dev\';
  // aDir := ExpandFileName(aDir);
  // RegisterFileLocation('dev',aDir);
  Application.initialize;
  Application.run;
end.

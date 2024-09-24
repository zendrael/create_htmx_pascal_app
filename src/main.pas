program main;

{$mode objfpc}{$H+}
 
uses
  {$ifdef UNIX}
    cthreads, cmem,
  {$endif} 
  //fphttpapp, 
  fpcgi,
  httpdefs, httproute;
 
procedure route1(aReq: TRequest; aResp: TResponse);
begin
  aResp.ContentType := 'text/html;charset=utf-8';
  aResp.content:='<h1>CGI route 1 called!</h1>';
end;
 
procedure route2(aReq: TRequest; aResp: TResponse);
begin
  aResp.ContentType := 'text/html;charset=utf-8';
  aResp.content:='<h1>Route 2 from CGI called!</h1>';
end;

var
  aDir : string; //only for localserver

begin
  HTTPRouter.registerRoute('/', @route1, true);
  HTTPRouter.registerRoute('/route2', @route2);
  // Application.port := 8080;
  // Application.threaded := true;
  Application.initialize;
  // if Application.HasOption('d','directory') then
  //   aDir:=Application.GetOptionValue('d','directory')
  // else
  //   aDir:=ExtractFilePath(ParamStr(0))+'..\dev\';
  // aDir := ExpandFileName(aDir);
  // RegisterFileLocation('dev',aDir);
  Application.run;
end.

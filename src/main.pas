program main;
 
{$mode objfpc}{$H+}
 
uses
  {BEGIN LOCAL SERVER}
  sysutils, fpwebfile, fpmimetypes, fphttpapp, httproute, httpdefs;
  {END LOCAL SERVER}
  {BEGIN CGI}
  //fpCGI;
  {END CGI}

Var
  aDir : string; //only for localserver

begin
  {BEGIN LOCAL SERVER}
  MimeTypes.LoadKnownTypes;
  Application.Title:='HTMX server';
  Application.Port:=3000;
  Application.Initialize;
  if Application.HasOption('d','directory') then
    aDir:=Application.GetOptionValue('d','directory')
  else
    aDir:=ExtractFilePath(ParamStr(0))+'..\dev\';
  aDir := ExpandFileName(aDir);
  RegisterFileLocation('dev',aDir);
  //HTTPRouter.RegisterRoute('/api', @apiEndpoint, false);
  //Writeln('open a webbrowser: '+Application.HostName+':'+inttostr(Application.port)+'/dev/index.html');

  Application.Run;
  {END LOCAL SERVER}

  {BEGIN CGI}
  {
    //You MUST always return HTML in order to htmX to work
  WriteLn('Content-Type:text/html',#10#13);

  //start your app here,
  //and remember to ALWAYS return HTML elements
  WriteLn('<h1>CGI WORKING!</h1>');
  }
  {END CGI}
end.   
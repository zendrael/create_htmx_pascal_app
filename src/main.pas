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
  fpcgi, httpdefs, httproute, 
  Home, Clients, Products;
 
procedure home(aReq: TRequest; aResp: TResponse);
var
  home: THome;
begin
  home := Thome.Create;
  aResp.ContentType := 'text/html;charset=utf-8';
  aResp.content:= home.GetHTMLContent;
end;
 
procedure clients(aReq: TRequest; aResp: TResponse);
var
  clients: TClients;
begin
  clients := TClients.Create;
  aResp.ContentType := 'text/html;charset=utf-8';
  aResp.content:= clients.GetHTMLContent;
end;

procedure products(aReq: TRequest; aResp: TResponse);
var
  products: TProducts;
begin
  products := TProducts.Create;
  aResp.ContentType := 'text/html;charset=utf-8';
  aResp.content:= products.GetHTMLContent;
end;

var
  aDir : string; //only for localserver

begin
  //Define the routes
  HTTPRouter.registerRoute('/', @home, true); //default route
  HTTPRouter.registerRoute('/clients', @clients);
  HTTPRouter.registerRoute('/products', @products);

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

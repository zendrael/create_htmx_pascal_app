program main;
 
{$mode objfpc}{$H+}
 
uses
  fpCGI;
 
begin
  //You MUST always return HTML in order to htmX to work
  WriteLn('Content-Type:text/html',#10#13);

  //start your app here,
  //and remember to ALWAYS return HTML elements
  WriteLn('<h1>CGI WORKING!</h1>');
end.   
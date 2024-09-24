# Pascal and HTMX Template/Boilerplate

This project aims for HTMX frontend with (fast)CGI backend written in Object Pascal using the FreePascal compiler and libs.
It can also be compiled as a standalone server.

[HTMX official website and docs](https://htmx.org/)

[FreePascal CGI docs](https://wiki.freepascal.org/CGI_Web_Programming)

**YOU MUST HAVE** at least FreePascal compiler installed on your environment (and available in your path) and Python 3 (to use as local web server) in order to make this CGI + HTMX basic template/boilerplate to work.

## Step 1: Clone this repo

## Step 2: Open the clonned folder into VSCode

## Step 3: Open terminal inside VSCode

## Step 4: Run the example

- open the terminal inside VSCode
- **on Windows** compile/run with `.\scripts\buildDev.ps1`
- **on Linux or macOS** compile/run with `./scripts/buildDev.sh`
- access project on `http://localhost:3000`
- **check your browser to see if the project works**
- CTRL+C on VScode terminal to stop the server

## Recommended VSCode extensions

- htmx-tags
- OmniPascal - Open Preview

## What to upload to my own server?

- access project on `dev` folder and upload to your server
- please note that some servers have special paths for the cgi-bin folder
- if using as standalone server, set it up as you need
- you can make the CGI (or app) binary smaller by using FPC compiler options to suit your needs

## Dependencies

- In order to start the local webserver called by the dev script, you must have Python3 installed on your machine

# Can I use it with Pas2JS?

If you're talking about Pas2JS in the _backend_ as a NodeJS/Bun app, yes.
Any backend that receives requests and outputs HTML can be used.

# Can I mix this with Pas2JS in the frontend?

Besides being possible, using HTMX usually means using less JavaScript, so mixing Pas2JS (Pascal transpiled to JavaScript) would go against it and can lead to unnecessary problems and added size.

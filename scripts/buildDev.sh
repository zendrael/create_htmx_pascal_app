#!/usr/bin/env sh

###############################################################################
# buildDev.sh                                                                 #
# Dev build script                                                            #
###############################################################################

if [ ! -d cgi-bin ]; then
	mkdir cgi-bin
	#exit 1
fi

if [ ! -d dev ]; then
	mkdir dev
	#exit 1
fi

echo "Cleaning dev dir..."
rm -Rf dev/*

echo "Copying files..."
cp index.html dev/
cp -r public/* dev/
cp -r src/forms dev/

echo "Compiling to dev..."
fpc src/main.pas -O3 -Ooregvar -Xg -Xs -XX \
-Fu"src/*" -Fu"src/*/*" -Fu"src/*/*/*" \
-o"cgi-bin/app.cgi" 

if [ $? -ne 0 ]; then
  echo "Compilation error! Check your source code!"
  exit 0
fi

echo "Moving cgi-bin folder to dev..."
mv cgi-bin dev/

bold=$(tput bold)
normal=$(tput sgr0)

echo ""
echo "Starting local server at ${bold}http://localhost:3000${normal}"
cd dev

if command -v python3 &> /dev/null
then
    cd ../dev
    python3 -m http.server 3000 --cgi
else
    echo "${bold}Local server error!!!${normal}"
    echo "This script requires Python to run a local server."
    echo "Python was not found."
    echo "You can upload the files to your server or modify this script."
fi

#eof







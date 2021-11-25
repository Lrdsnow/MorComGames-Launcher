mkdir ~/mcgl
mkdir ~/mcgl/Games
mkdir ~/mcgl/Games/morock
curl "https://github.com/Lrdsnow/morock/releases/latest/download/morockmac.zip" -L -o ~/mcgl/morock.zip
unzip ~/mcgl/morock.zip -d ~/mcgl/Games/morock
touch ~/mcgl/Games/morock/Morock.app/Contents/MacOS/testing.disabled
touch ~/mcgl/Games/morock/Morock.app/Contents/MacOS/mcgl
open ~/mcgl/Games/morock/Morock.app

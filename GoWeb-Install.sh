#!/bin/sh

i=$(logname)

echo "?xml version=\"1.0\" encoding=\"UTF-8\"?>" > efood.goweb.startup.plist;
echo "<!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">" >> efood.goweb.startup.plist;
echo "<plist version=\"1.0\">" >> efood.goweb.startup.plist;
echo "<dict>" >> efood.goweb.startup.plist;
echo "    <key>Label</key>" >> efood.goweb.startup.plist;
echo "    <string>efood.goweb.startup</string>" >> efood.goweb.startup.plist;

echo "    <key>OnDemand</key>" >> efood.goweb.startup.plist;
echo "    <false/>" >> efood.goweb.startup.plist;

echo "    <key>LaunchOnlyOnce</key>" >> efood.goweb.startup.plist;
echo "    <true/>" >> efood.goweb.startup.plist;

echo "    <key>UserName</key>" >> efood.goweb.startup.plist;
echo "    <string>"$i"</string>" >> efood.goweb.startup.plist;

echo "    <key>ProgramArguments</key>" >> efood.goweb.startup.plist;
echo "    <array>" >> efood.goweb.startup.plist;
echo "        <string>/usr/bin/open</string>" >> efood.goweb.startup.plist;
echo "        <string>-n</string>" >> efood.goweb.startup.plist;
echo "        <string>-a</string>" >> efood.goweb.startup.plist;
echo "        <string>&quot;Google Chrome&quot;</string>" >> efood.goweb.startup.plist;
echo "        <string>--args</string>" >> efood.goweb.startup.plist;
echo "        <string>--app=https://web.eu.restaurant-partners.com/orders</string>" >> efood.goweb.startup.plist;
echo "        <string>--kiosk-printing</string>" >> efood.goweb.startup.plist;
echo "        <string>--start-maximized</string>" >> efood.goweb.startup.plist;
echo "        <string>--safebrowsing-enable-enhanced-protection</string>" >> efood.goweb.startup.plist;
echo "    </array>" >> efood.goweb.startup.plist; 
echo "</dict>" >> efood.goweb.startup.plist;
echo "</plist>" >> efood.goweb.startup.plist; 

mv ./efood.goweb.startup.plist /Library/LaunchAgents/;
chown root:wheel /Library/LaunchAgents/efood.goweb.startup.plist;
launchctl load -F /Library/LaunchAgents/efood.goweb.startup.plist;
rm -rf /Users/$i/Desktop/GoWeb-Install.sh;

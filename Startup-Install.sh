#!/bin/sh

i=$(logname)

echo "?xml version=\"1.0\" encoding=\"UTF-8\"?>" > macos.program.startup.plist;
echo "<!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">" >> macos.program.startup.plist;
echo "<plist version=\"1.0\">" >> macos.program.startup.plist;
echo "<dict>" >> macos.program.startup.plist;
echo "    <key>Label</key>" >> macos.program.startup.plist;
echo "    <string>efood.goweb.startup</string>" >> macos.program.startup.plist;

echo "    <key>OnDemand</key>" >> macos.program.startup.plist;
echo "    <false/>" >> macos.program.startup.plist;

echo "    <key>LaunchOnlyOnce</key>" >> macos.program.startup.plist;
echo "    <true/>" >> macos.program.startup.plist;

echo "    <key>UserName</key>" >> macos.program.startup.plist;
echo "    <string>"$i"</string>" >> macos.program.startup.plist;

echo "    <key>ProgramArguments</key>" >> macos.program.startup.plist;
echo "    <array>" >> macos.program.startup.plist;
echo "        <string>/usr/bin/open</string>" >> macos.program.startup.plist;
echo "        <string>-n</string>" >> macos.program.startup.plist;
echo "        <string>-a</string>" >> macos.program.startup.plist;
echo "        <string>&quot;Google Chrome&quot;</string>" >> macos.program.startup.plist;
echo "        <string>--args</string>" >> macos.program.startup.plist;
echo "        <string>--app=https://www.example.com/orders</string>" >> macos.program.startup.plist;
echo "        <string>--start-maximized</string>" >> macos.program.startup.plist;
echo "        <string>--safebrowsing-enable-enhanced-protection</string>" >> macos.program.startup.plist;
echo "    </array>" >> macos.program.startup.plist; 
echo "</dict>" >> macos.program.startup.plist;
echo "</plist>" >> macos.program.startup.plist; 

mv ./macos.program.startup.plist /Library/LaunchAgents/;
chown root:wheel /Library/LaunchAgents/macos.program.startup.plist;
launchctl load -F /Library/LaunchAgents/macos.program.startup.plist;

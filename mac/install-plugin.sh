ROOTPATH="$(pwd)"

rm -rf /tmp/vcam-plugin.plugin
mkdir /tmp/vcam-plugin.plugin
cd /tmp/vcam-plugin.plugin

mkdir Contents
cd Contents
mkdir MacOS
mkdir Resources

cd ..
cd ..

cp "$ROOTPATH/libvcam-plugin.dylib" /tmp/vcam-plugin.plugin/Contents/MacOS/vcam-plugin
cp "$ROOTPATH/vcam-assistant" /tmp/vcam-plugin.plugin/Contents/Resources/vcam-assistant

cp "$ROOTPATH/Info.plist" /tmp/vcam-plugin.plugin/Contents/Info.plist

rm -rf /Library/CoreMediaIO/Plug-Ins/DAL/vcam-plugin.plugin
cp -a /tmp/vcam-plugin.plugin/. /Library/CoreMediaIO/Plug-Ins/DAL/vcam-plugin.plugin

rm -rf /tmp/vcam-plugin.plugin

rm -rf vcam-plugin.plugin
mkdir vcam-plugin.plugin
cd vcam-plugin.plugin

mkdir Contents
cd Contents
mkdir MacOS
mkdir Resources

cd ..
cd ..

cp ./data/obs-plugins/slobs-virtual-cam/libvcam-plugin.dylib ./vcam-plugin.plugin/Contents/MacOS/vcam-plugin
cp ./data/obs-plugins/slobs-virtual-cam/vcam-assistant ./vcam-plugin.plugin/Contents/Resources/vcam-assistant

cp ./data/obs-plugins/slobs-virtual-cam/Info.plist ./vcam-plugin.plugin/Contents/Info.plist

rm -rf /Library/CoreMediaIO/Plug-Ins/DAL/vcam-plugin.plugin
cp -a ./vcam-plugin.plugin/. /Library/CoreMediaIO/Plug-Ins/DAL/vcam-plugin.plugin

rm -rf vcam-plugin.plugin

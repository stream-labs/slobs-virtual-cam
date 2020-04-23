rm -rf $1/vcam-plugin.plugin
mkdir $1/vcam-plugin.plugin
cd $1/vcam-plugin.plugin

mkdir Contents
cd Contents
mkdir MacOS
mkdir Resources

cd ..
cd ..

cp $1/libvcam-plugin.dylib ./vcam-plugin.plugin/Contents/MacOS/vcam-plugin
cp $1/vcam-assistant ./vcam-plugin.plugin/Contents/Resources/vcam-assistant

cp $1/Info.plist ./vcam-plugin.plugin/Contents/Info.plist

rm -rf /Library/CoreMediaIO/Plug-Ins/DAL/vcam-plugin.plugin
cp -a $1/vcam-plugin.plugin/. /Library/CoreMediaIO/Plug-Ins/DAL/vcam-plugin.plugin

rm -rf $1/vcam-plugin.plugin

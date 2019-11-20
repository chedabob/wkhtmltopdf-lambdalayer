#!/bin/bash

echo "Running bootstrap script"
mkdir layer

echo "Extracting wkhtmltopdf RPM archive"
rpmdev-extract -q *rpm
mv wkhtmltox*/usr/local/* layer/

echo "Copying libs to layer temp"
cp /usr/lib64/{libpng15.so.15,libjpeg.so.62,libXrender.so.1,libfontconfig.so.1,libfreetype.so.6,libXext.so.6,libX11.so.6,libexpat.so.1,libxcb.so.1,libXau.so.6} layer/lib/

echo "Tidy up the layer temp folders"
rm -rf wkh*
cd layer/
rm -rf include share
mv lib/libwkhtmltox.so.0.12.5 lib/libwkhtmltox.so

echo "Zip up the layer"
zip -qr9 ~/wkhtmltopdf.zip *

echo "Done"

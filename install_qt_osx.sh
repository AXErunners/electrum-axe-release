#!/bin/bash
set -ev
wget https://download.qt.io/official_releases/qt/4.8/4.8.7/qt-everywhere-opensource-src-4.8.7.tar.gz
tar xzf qt-everywhere-opensource-src-4.8.7.tar.gz
cd qt-everywhere-opensource-src-4.8.7
# Patch is needed as https://codereview.qt-project.org/#/c/157137/
cat > patchset1.patch << EOF
index 4aa0668..63b646d 100644 (file)
--- a/src/gui/painting/qpaintengine_mac.cpp
+++ b/src/gui/painting/qpaintengine_mac.cpp
@@ -340,13 +340,7 @@ CGColorSpaceRef QCoreGraphicsPaintEngine::macDisplayColorSpace(const QWidget *wi
     }
 
     // Get the color space from the display profile.
-    CGColorSpaceRef colorSpace = 0;
-    CMProfileRef displayProfile = 0;
-    CMError err = CMGetProfileByAVID((CMDisplayIDType)displayID, &displayProfile);
-    if (err == noErr) {
-        colorSpace = CGColorSpaceCreateWithPlatformColorSpace(displayProfile);
-        CMCloseProfile(displayProfile);
-    }
+    CGColorSpaceRef colorSpace = CGDisplayCopyColorSpace(displayID);
 
     // Fallback: use generic DeviceRGB
     if (colorSpace == 0)
EOF
patch -p1 <patchset1.patch
./configure -prefix $HOME/virtualenv -release -opensource -confirm-license -nomake examples -nomake demos -qt-zlib -qt-libjpeg -qt-libpng -qt-libmng -qt-libtiff
# make -j4 &> /dev/null &
# pid=$!
# while kill -0 $pid 2>/dev/null
# do
#     echo -ne '.'
#     sleep 1
# done
# make install

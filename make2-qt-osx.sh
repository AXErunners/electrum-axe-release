#!/bin/bash
cd qt-everywhere-opensource-src-4.8.7
make -j4 sub-uic3-make_default-ordered sub-opengl-make_default-ordered sub-xmlpatterns-make_default-ordered sub-multimedia-make_default-ordered sub-svg-make_default-ordered sub-script-make_default-ordered sub-declarative-make_default-ordered &> /dev/null &
pid=$!
while kill -0 $pid 2>/dev/null
do
    echo -ne '.'
    sleep 1
done

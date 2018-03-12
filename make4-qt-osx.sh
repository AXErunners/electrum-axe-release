#!/bin/bash
cd qt-everywhere-opensource-src-4.8.7
make -j4 sub-scripttools-make_default-ordered sub-plugins-make_default-ordered sub-imports-make_default-ordered sub-tools-make_default-ordered sub-translations-make_default-ordered &> /dev/null &
pid=$!
while kill -0 $pid 2>/dev/null
do
    echo -ne '.'
    sleep 1
done

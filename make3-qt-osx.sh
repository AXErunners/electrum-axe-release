#!/bin/bash
cd qt-everywhere-opensource-src-4.8.7
make -j4 sub-webkit-make_default-ordered &> /dev/null &
pid=$!
while kill -0 $pid 2>/dev/null
do
    echo -ne '.'
    sleep 1
done


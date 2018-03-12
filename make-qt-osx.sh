#!/bin/bash
cd qt-everywhere-opensource-src-4.8.7
make -j4 sub-tools-bootstrap-make_default-ordered sub-moc-make_default-ordered sub-rcc-make_default-ordered sub-uic-make_default-ordered sub-corelib-make_default-ordered sub-xml-make_default-ordered sub-network-make_default-ordered sub-sql-make_default-ordered sub-testlib-make_default-ordered sub-gui-make_default-ordered sub-qt3support-make_default-ordered &> /dev/null &
pid=$!
while kill -0 $pid 2>/dev/null
do
    echo -ne '.'
    sleep 1
done

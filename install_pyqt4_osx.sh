#!/bin/bash
set -ev
wget "http://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.12/PyQt4_gpl_x11-4.12.tar.gz"
tar xzf PyQt4_gpl_x11-4.12.tar.gz
cd PyQt4_gpl_x11-4.12
which qmake
python configure.py --verbose --confirm-license --no-designer-plugin --no-qsci-api --no-timestamp
make -j4 &> /dev/null &
pid=$!
while kill -0 $pid 2>/dev/null
do
    echo -ne '.'
    sleep 1
done
make install
echo -ne "PyQt done"

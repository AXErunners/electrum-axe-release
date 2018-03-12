#!/bin/bash
wget "https://sourceforge.net/projects/pyqt/files/sip/sip-4.19.1/sip-4.19.1.tar.gz"
tar xzf sip-4.19.1.tar.gz
cd sip-4.19.1
python configure.py --incdir="$(python -c 'import sys; print(sys.prefix)')"/include/python"$PYTHON_VERSION"
make -j2
make install

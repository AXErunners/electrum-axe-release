#!/bin/sh
wineboot && sleep 5
wineboot --update

cp /root/.wine/drive_c/Python27/Lib/site-packages/requests/cacert.pem .
wine python "C:/PyInstaller/pyinstaller.py" -y "contrib/build-wine/deterministic.spec"
cp /opt/electrum-axe/contrib/build-wine/electrum-axe.nsi /root/.wine/drive_c/
cd /root/.wine/drive_c/electrum
wine c:\\"Program Files (x86)"\\NSIS\\makensis.exe -V1 c:\\electrum-axe.nsi

# Electrum-AXE release scripts

## Linux

```
$ docker build -f Dockerfile-linux -t axerunners/electrum-axe-release:Linux .
$ git clone git@github.com:axerunners/electrum-axe.git
$ docker run --rm -v $(pwd):/opt \
    -w /opt/electrum-axe -t axerunners/electrum-axe-release:Linux \
    /opt/build_linux.sh
```

Installation:

```
$ sudo apt-get install -y python-qt4 libusb-1.0.0-dev libudev-dev
$ pip install Electrum-AXE-2.6.4.tar.gz
```

Uninstallation:

```
$ pip uninstall -y Electrum-AXE
```

## Windows (WINE)

```
$ ./python-trezor-wine.sh
$ ./python-x11_hash-wine.sh
$ docker build -f Dockerfile-wine -t axerunners/electrum-axe-release:Wine .
$ git clone https://github.com/axerunners/electrum-axe.git
$ docker run --rm -v $(pwd):/opt \
    -v $(pwd)/electrum-axe/:/root/.wine/drive_c/electrum \
    -w /opt/electrum-axe -t axerunners/electrum-axe-release:Wine \
    /opt/build_wine.sh
```

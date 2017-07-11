sudo yum install curl autoconf automake libtool pkgconfig
git clone https://github.com/openvenues/libpostal
cd libpostal
./bootstrap.sh
./configure
export PKG_CONFIG_PATH=/root/OCR/libpostal
export PATH=$PKG_CONFIG_PATH:$PATH
make
sudo make install
sudo ldconfig
cd ..
git clone https://github.com/openvenues/jpostal.git

cd jpostal
./gradlew assemble

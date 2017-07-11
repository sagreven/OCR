sudo yum install curl autoconf automake libtool pkgconfig
git clone https://github.com/openvenues/libpostal
cd libpostal
./bootstrap.sh
./configure
make
sudo make install
sudo ldconfig

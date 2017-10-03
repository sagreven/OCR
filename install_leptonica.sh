yum -y update 
yum -y remove libpng-devel
yum -y install libstdc++ autoconf automake libtool autoconf-archive pkg-config gcc gcc-c++ make libjpeg-devel  libtiff-devel zlib-devel

wget http://sourceforge.net/projects/libpng/files/libpng16/1.6.21/libpng-1.6.21.tar.gz/download -O libpng.tar.gz && tar -xvf libpng.tar.gz && cd libpng-1.6.21 && sudo bash configure --prefix=/usr/local/libpng && sudo make install



yum remove tesseract -y
wget http://www.leptonica.com/source/leptonica-1.74.4.tar.gz
tar xzvf leptonica-1.74.4.tar.gz
cd leptonica-1.74.4
./configure
make
make install
cd ..
git clone https://github.com/tesseract-ocr/tesseract.git
cd tesseract
./autogen.sh
./configure
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig LIBLEPT_HEADERSDIR=/usr/local/include ./configure --with-extra-includes=/usr/local/include --with-extra-libraries=/usr/local/lib
LDFLAGS="-L/usr/local/lib" CFLAGS="-I/usr/local/include" make
make install
ldconfig
tesseract -v
cd ..

ln -s /usr/local/lib/liblept.so /usr/lib
rm -f /usr/local/lib/libtesseract.so*
ln -s /usr/local/lib/libtesseract.so.4 /usr/lib/libtesseract.so.4
ln -s /usr/local/lib/libtesseract.so.4.0.0 /usr/lib/libtesseract.so.4.0.0

wget https://github.com/tesseract-ocr/tessdata/raw/master/deu.traineddata
wget https://github.com/tesseract-ocr/tessdata/raw/master/eng.traineddata
wget https://github.com/tesseract-ocr/tessdata/raw/master/nld.traineddata
mv *.traineddata /usr/local/share/tessdata
yes | cp nld.user_patterns /usr/local/share/tessdata/
yes | cp leftconnect /usr/local/share/tessdata/configs -f

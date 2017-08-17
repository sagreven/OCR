wget https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921/ghostscript-9.21.tar.gz
tar -xvf ghostscript-9.21.tar.gz
cd ghostscript-9.21
./configure
make
make install
make so
rm /usr/lib/libgs.so
ln -s sobin/libgs.so /usr/lib


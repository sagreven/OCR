wget https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921/ghostscript-9.21.tar.gz
tar -xvf ghostscript-9.21.tar.gz
cd ghostscript-9.21
./configure
make
make install
make so
rm -rf /usr/lib64/libgs.so
cp sobin/libgs.so.9.21 /usr/lib64
ln -s /usr/lib64/libgs.so.9.21 /usr/lib64/libgs.so.9


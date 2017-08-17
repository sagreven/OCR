wget http://geodata.nationaalgeoregister.nl/inspireadressen/extract/inspireadressen.zip
unzip inspireadressen.zip -d inspireadressen
umount /hdfs_nfs_mount
mkdir /hdfs_nfs_mount
mount -t nfs -o vers=3,proto=tcp,nolock poc2:/ /hdfs_nfs_mount
mkdir /hdfs_nfs_mount/data/training/postcode
mkdir /hdfs_nfs_mount/data/training/postcode/nl

// contains house number,address index number, postcode and a number that corresponds to a street
unzip *NUM*.zip -d /hdfs_nfs_mount/data/training/postcode/nl
// contains the streetname
unzip *OPR*.zip -d /hdfs_nfs_mount/data/training/postcode/nl
// contains the place
unzip *WPL*.zip -d /hdfs_nfs_mount/data/training/postcode/nl

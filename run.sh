echo "-------KDZ EXTRACTOR LAZY SCRIPY BY @Innfinite4evr---------"
echo "######   Requires python "
user=$(whoami)
echo "Enter your Kdz file name followed by [ENTER]"
chmod +x *.py
echo "Example:H63110i_00"
read kdzname
python unkdz.py -f $kdzname.kdz -x
cp -R undz.py kdzextracted
cd kdzextracted
python undz.py -f $kdzname.dz -x
cd dzextracted
echo "######   Merging system_***.bin"
cp -R ../../mergersystem.py mergersystem.py
cp -R ../../mergerboot.py mergerboot.py
python merger*system.py
sudo mkdir -p /mnt/lgimg
sudo mount -o loop,rw -t ext4 system.img /mnt/lgimg
sudo chown -hR $user:$user /mnt/lgimg/
sudo chmod -R a+rwX /mnt/lgimg/
sudo mkdir ../../system
sudo cp -R /mnt/lgimg/* ../../system
sudo umount /mnt/lgimg/
echo "######   System.img extracted in system folder"
echo "######   Deleting unused system_**bin"
rm -rf system_*bin
echo "######   Merging boot_***.bin"
python merger*boot.py
echo "######   Deleting unused boot_**bin"
rm -rf boot_*bin
mv boot.img ../../
cd ../../
sudo rm -rf kdzextracted
echo "######   boot_****bin merged into boot.img"
echo "######   Success!"
echo "-------KDZ EXTRACTOR LAZY SCRIPY BY @Innfinite4evr---------"

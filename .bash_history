sudo apt-get upgrade
sudo apt-get update
sudo apt-get upgrade
sudo reboot -n
sudo dpkg -l
apt-get remove cloud
sudp apt-get remove cloud
sudo apt-get remove cloud
sudo apt-get remove cloud-init
sudo dpkg -l | grep -i cloud
sudo apt-get remove cloud-guest-utils 
sudo apt-get remove cloud-initramfs-copymods 
sudo apt-get remove cloud-initramfs-dyn-netconf 
sudo dpkg -l 
systemctl services
systemct
systemctl 
sudo snap remove docker
sudo apt update
sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
ls -lh /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
docker
apt-cache policy docker-ce
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
dokcer
docker
sudo apt install sysbench
sysbench cpu run
sysbench memory run
ping maurice
sudo vi /etc/hosts
ssh maurice@maurice
ssh-keygen -t ed25519
ssh-copy-id -i ~/.ssh/id_ed25519.pub michel@michel
ssh-copy-id -i ~/.ssh/id_ed25519.pub maurice@maurice
vi ~/.ssh/config
ssh maurice
ll
cat fstab 
sudo vi /etc/fstab 
mkdir /mnt/
mkdir /mnt/images
ll /mnt/
sudo chown michel:michel /mnt/
mkdir /mnt/disk1
mkdir /mnt/disk2
id
ll
cd Jdownloader/
docker compose up
ll
cat docker-compose.yml 
sudo usermod -aG docker $USER
docker ps
sudo systemctl status docker
docker ps
groups
top
sudo apt-grep remove snap
dpkg -l
group
s
groups
docker ps
cd Jdownloader/
docker compose up
docker ps
sudo dmesg 
cd Jdownloader/
docker compose up -d
cd ..
ll
cd rsync-server/
ll
docker compose up -d
cd ..
ll
cd t
cd T
cd Telegram/
ll
vi sendLinkToJdownloader.sh 
top
cd ..
cd Upnp/
vi port_forward.sh 
. ./port_forward.sh 
crontab -e
sudo vi /etc/fstab 
ls
top
cd /mnt/disk1/
ll
cd media/
ll
cd AutoPackage/
ll
cd ..
rm -rf AutoPackage/
cd downloads/
ll
cd ..
dpkg -l | grep -i Kub
dpkg -l | grep -i Mic
ll updateDockers.sh 
. ./updateDockers.sh 
vi updateDockers.sh 
. ./updateDockers.sh 
ll
cd ..
ll
top
vi update.sh
source update.sh 
vi update.sh
source update.sh 
vi update.sh
sudo apt-get install fail2ban
systemctl start fail2ban
systemctl enable fail2ban
sudo cat /var/log/fail2ban.log
docker ps
cd Torrent/
docker compose logs -f
cd ..
cd Upnp/
. ./port_forward.sh 
dme
sudo dmesg -h
sudo dmesg -w
ping google.fr
docker ps
sudo -l
sudo vi /etc/sudoers
visudo 
sudo visudo 
sudo -l
sudo apt-get instqll
sudo apt-get install
sudo apt-get upgrade
sudo apt-get install
vi Upnp/port_forward.sh 
Upnp/port_forward.sh 
top
sudo reboot -n
git status
git push -u origin main
ll .ssh/
cat .ssh/id_ed25519.pub 
git push -u origin main
git remote add origin git@github.com:nik0/SauvegardeMichel.git
git push -u origin main
git config --global user.name "nik0"
git config --global user.email "nicolas.ebele@gmail.com"
git push -u origin main
git remote set-url origin git@github.com:nik0/SauvegardeMichel.git
git push -u origin main
vi .gitignore 
git status
git add .gitignore Torrent/config/qBittorrent/qBittorrent-data.conf
git commit --amend
git push -f
ll Git/
cd Git/
mv sauvegardeMaurice.sh sauvegardeMichel.sh 
vi sauvegardeMichel.sh 
crontab -e
/home/michel/Git/sauvegardeMichel.sh .sh >> /home/michel/Git/backup_git.log 2>&1
ll
cat backup_git.log 
crontab -e
vi sauvegardeMichel.sh 
/home/michel/Git/sauvegardeMichel.sh .sh >> /home/michel/Git/backup_git.log 2>&1
cat backup_git.log 
cd ..
git status
git pukk
cat Git/sauvegardeMichel.sh 
git pull --rebase origin main
/home/michel/Git/sauvegardeMichel.sh .sh >> /home/michel/Git/backup_git.log 2>&1
cat Git/sauvegardeMichel.sh 
cat Git/backup_git.log 
git config --global user.name Nik0
git config --global user.email "nicolas.ebele@gmail.com"
git init
vi .gitignore 
git add .
du -sh .git
git ls-files -s | awk '{print $4}' | xargs -I{} du -h {} 2>/dev/null | sort -h | tail -n 20
git status
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/nik0/SauvegardeMichel.git
git push -u origin main
vi .gitignore
git rm -f --cached .ssh/
git rm -rf --cached .ssh/
git comit --amend
git commit --amend
git push -f

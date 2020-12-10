#!/bin/bash

# Define colors...
RED=`tput bold && tput setaf 1`
GREEN=`tput bold && tput setaf 2`
YELLOW=`tput bold && tput setaf 3`
BLUE=`tput bold && tput setaf 4`
NC=`tput sgr0`

function RED(){
	echo -e "\n${RED}${1}${NC}"
}
function GREEN(){
	echo -e "\n${GREEN}${1}${NC}"
}
function YELLOW(){
	echo -e "\n${YELLOW}${1}${NC}"
}
function BLUE(){
	echo -e "\n${BLUE}${1}${NC}"
}

# Testing if root...
if [ $UID -ne 0 ]
then
	RED "You must run this script as root!" && echo
	exit
fi



BLUE "Updating repositories..."
sudo apt update
apt-get install -y build-essential
apt-get install -y gcc 
apt-get install -y git
apt-get install -y vim 
apt-get install -y wget 
apt-get install -y curl
apt-get install -y awscli
apt-get install -y inetutils-ping 
apt-get install -y make 
apt-get install -y whois 
apt-get install -y python3
apt-get install -y python-pip 
apt-get install -y perl 
apt-get install -y nikto
apt-get install -y dnsutils 
apt-get install -y net-tools
apt-get install -y zsh
apt-get install -y nano

BLUE "Forcing a color prompt in ~/.bashrc..."
grep "export PS1" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> ~/.bashrc
fi

BLUE "Installing SimpleScreenRecorder..."
echo "" | sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder
sudo apt-get update
sudo apt-get install -y simplescreenrecorder

BLUE "Installing task..."
sudo apt-get install -y taskwarrior

BLUE "Installing pip..."
sudo apt-get install -y python-pip

BLUE "Removing boilerplate home directories..."
rmdir ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Public ~/Templates ~/Videos

BLUE "Installing guake..."
sudo apt-get install -y guake

BLUE "Installing openvpn..."
sudo apt-get install -y openvpn


BLUE "Installing docker..."
sudo apt-get install -y docker.io
sudo groupadd docker
sudo usermod -aG docker `logname`

BLUE "Installing curl..."
sudo apt-get install -y curl

BLUE "Installing pinta..."
sudo apt-get install -y pinta

BLUE "Installing exiftool..."
sudo apt-get install -y exiftool

BLUE "Installing Python PIL..."
sudo apt-get install -y python-pil

BLUE "Install Real VNC Viewer..."
wget "https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-6.17.1113-Linux-x64.deb" -O vnc_viewer.deb
dpkg -i vnc_viewer.deb
rm vnc_viewer.deb

BLUE "Install Real VNC Connect (Server)..."
wget 'https://www.realvnc.com/download/file/vnc.files/VNC-Server-6.2.1-Linux-x64.deb' -O vnc_server.deb
dpkg -i vnc_server.deb
rm vnc_server.deb

BLUE "Adding VNC Connect (Server) service to the default startup /etc/rc.local..."
grep "vncserver-x11-serviced.service" /etc/rc.local
if [ $? -eq 1 ]
then
	echo "systemctl start vncserver-x11-serviced.service" >> ~/etc/rc.local
fi


BLUE "Installing python-requests..."
pip install requests


BLUE "Installing xclip..."
sudo apt install -y xclip
grep "alias xclip" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "alias xclip='xclip -selection clipboard'" >> ~/.bashrc
fi

BLUE "Installing Python flask..."
sudo pip install flask

BLUE "Installing Python flask-login..."
sudo pip install flask-login

BLUE "Installing Python colorama..."
sudo pip install colorama

BLUE "Installing Python passlib..."
sudo pip install passlib

BLUE "Installing Binwalk..."
sudo apt install -y binwalk

BLUE "Installing Tesseract..."
sudo apt install -y tesseract-ocr

BLUE "Installing foremost..."
sudo apt install -y foremost

BLUE "Installing rot13..."
sudo apt install -y bsdgames	

BLUE "Installing hexedit..."
sudo apt install -y hexedit	

BLUE "Installing Python pwntools..."
sudo pip install pwntools

BLUE "Installing Go..."
sudo apt install -y golang-go
BLUE "Adding GOPATH and GOBIN to .bashrc, so future installs are easy.."
grep "export GOPATH" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "export GOPATH=\$HOME/.go/" >> ~/.bashrc
fi
grep "export GOBIN" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "export GOBIN=\$HOME/.go/bin" >> ~/.bashrc
	echo "export PATH=\$PATH:\$GOBIN" >> ~/.bashrc
fi


BLUE "Installing nikto..."
sudo apt install -y nikto

BLUE "Installing zbarimg..."
sudo apt install -y zbar-tools	

BLUE "Installing qrencode..."
sudo apt install -y qrencode

BLUE "Installing pdfcrack..."
sudo apt install -y pdfcrack

BLUE "Installing Vagrant..."
sudo apt install -y vagrant

BLUE "Installing Hopper..."
wget "https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-4.3.14-Linux.deb"
dpkg -i Hopper-v4-4.3.14-Linux.deb
rm Hopper-v4-4.3.14-Linux.deb

BLUE "Installing fcrackzip..."
sudo apt install -y fcrackzip

BLUE "Installing unrar..."
sudo apt install -y unrar

BLUE "Installing steghide..."
sudo apt install -y steghide

BLUE "Installing ffmpeg..."
sudo apt install -y ffmpeg

BLUE "Installing Python library netifaces..."
sudo pip install netifaces

BLUE "Installing Python library iptools..."
sudo pip install iptools

BLUE "Installing Python library OpenSSL..."
sudo pip install pyopenssl

BLUE "Installing Python library pydispatch..."
sudo pip install pydispatch

BLUE "Installing GIMP..."
sudo apt install -y gimp

BLUE "Installing cmake..."
sudo apt install -y cmake

BLUE "Installing mplayer..."
sudo apt install -y mplayer


BLUE "Installing sshpass..."
sudo apt install -y sshpass

BLUE "Installing tcpflow..."
sudo apt install -y tcpflow

BLUE "Installing Python scapy..."
sudo pip install scapy

BLUE "Installing the thing that 7z2john.pl needs..."
sudo apt install libcompress-raw-lzma-perl 

BLUE "Installing dos2unix..."
sudo apt install libcompress-raw-lzma-perl


GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[*] Bug Bounty Toolkit Installer${NC}"
echo -e "${GREEN}[*] Setting Up Directories${NC}"

# masscan
echo -e "${GREEN}[*] Installing masscan${NC}"
cd /opt/toolkit
apt-get install -y libpcap-dev
git clone https://github.com/robertdavidgraham/masscan.git
cd masscan
make
ln -sf /opt/toolkit/masscan/bin/masscan /usr/local/bin/masscan    


# dnsenum
echo -e "${GREEN}[*] Installing dnsenum${NC}"
apt-get install -y cpanminus 
cd /opt/toolkit 
git clone https://github.com/fwaeytens/dnsenum.git 
cd dnsenum/ 
chmod +x dnsenum.pl 
ln -s /opt/toolkit/dnsenum/dnsenum.pl /usr/bin/dnsenum 
cpanm String::Random 
cpanm Net::IP 
cpanm Net::DNS 
cpanm Net::Netmask
cpanm XML::Writer

# thc-hydra
echo -e "${GREEN}[*] Installing thc-hydra${NC}"
apt-get install -y hydra

# Sublist3r
echo -e "${GREEN}[*] Installing Sublist3r${NC}"
cd /opt/toolkit 
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r/
pip install -r requirements.txt
ln -s /opt/toolkit/Sublist3r/sublist3r.py /usr/local/bin/sublist3r

# sqlmap
echo -e "${GREEN}[*] Installing sqlmap${NC}"
apt-get install -y sqlmap

# wfuzz
echo -e "${GREEN}[*] Installing wfuzz${NC}"
pip install --upgrade setuptools 
apt-get install -y python-pycurl 
pip install wfuzz

#wpscan
echo -e "${GREEN}[*] Installing wpscan${NC}"
apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev libgmp-dev zlib1g-dev 
cd /opt/toolkit 
git clone https://github.com/wpscanteam/wpscan.git 
cd wpscan/ 
gem install bundler && bundle install --without test 
gem install wpscan

# joomscan
echo -e "${GREEN}[*] Installing joomscan${NC}"
cd /opt/toolkit
git clone https://github.com/rezasp/joomscan.git 
cd joomscan/ 
apt-get install -y libwww-perl 
chmod +x joomscan.pl
ln -sf /opt/toolkit/joomscan/joomscan.pl /usr/local/bin/joomscan

# commix 
echo -e "${GREEN}[*] Installing commix${NC}"
cd /opt/toolkit 
git clone https://github.com/commixproject/commix.git 
cd commix 
chmod +x commix.py 
ln -sf /opt/toolkit/commix/commix.py /usr/local/bin/commix

# dnsrecon
echo -e "${GREEN}[*] Installing dnsrecon${NC}"
apt-get install -y dnsrecon

# theHarvester
echo -e "${GREEN}[*] Installing theHarvester${NC}"
cd /opt/toolkit 
git clone https://github.com/AlexisAhmed/theHarvester.git 
cd theHarvester 
apt-get install -y python3.7 
python3.7 -m pip install -r requirements.txt 
chmod +x theHarvester.py
ln -sf /opt/toolkit/theHarvester/theHarvester.py /usr/local/bin/theharvester

# Cleanup
echo -e "${GREEN}[*] Tidying up${NC}"
apt-get clean
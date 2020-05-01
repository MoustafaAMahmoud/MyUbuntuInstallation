

#!/bin/bash -       
#title           :install.sh
#description     :This script to install my packages for Ubuntu
#author		 	 :Moustafa Mahmoud mustafa.alaa.mohamed@gmail.com
#date            :2020-03-27
#version         :0.1
#usage  		 :bash install.sh
#notes           :this script needs sudo access
#bash_version    :GNU bash, version 5.0.16(1)-release (x86_64-pc-linux-gnu)
#Below is my tested environment
				#NAME="Ubuntu"
				#VERSION="20.04 LTS (Focal Fossa)"
				#ID=ubuntu
				#ID_LIKE=debian
				#PRETTY_NAME="Ubuntu 20.04 LTS"
				#VERSION_ID="20.04"
				#HOME_URL="https://www.ubuntu.com/"
				#VERSION_CODENAME=focal
				#UBUNTU_CODENAME=focal


#==============================================================================
#ubuntu
apt update -y
apt upgrade -y 
   

# Java, Git, snap, gnome-tweaks,chrome web browser, maven
apt install curl openjdk-8-jdk openjdk-8-jre git snapd gnome-tweaks software-properties-common wget perl-tk apt-transport-https mvn -y 

apt --fix-broken install -y


#install zoom
wget -O zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
dpkg -i zoom.deb

## Scala
wget https://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.deb
dpkg -i scala-2.11.8.deb

#install docker

######################  Add Repos ###########################################
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add - #sublime
apt-add-repository "deb https://download.sublimetext.com/ apt/stable/" -y #sublime
add-apt-repository ppa:deadsnakes/ppa -y #python
add-apt-repository ppa:ubuntuhandbook1/audacity -y #audacity
add-apt-repository ppa:sunderme/texstudio -y #texstudio
add-apt-repository ppa:rvm/smplayer  -y #smpalyer
#############################################################################


######################  Add keys ############################################
## SBT
echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add
#signal
curl -s https://updates.signal.org/desktop/apt/keys.asc | apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | tee -a /etc/apt/sources.list.d/signal-xenial.list
apt update 
#############################################################################

#SBT,sublime,python, signal, brave, texstudio,smplayer 
apt install sbt sublime-text python3.7 signal-desktop texstudio audacity smplayer smtube smplayer-themes -y
apt --fix-broken install -y

#install Python need review
#apt install python3.7 -y


#wget http://scala-lang.org/files/archive/scala-2.12.1.deb -y
#dpkg -i scala-2.12.1.deb -y
#apt update -y
#apt install scala -y

#install Idea
snap install intellij-idea-community --classic
snap install pycharm-community --classic


#install tex vanilla TeXLive on Debian or Ubuntu
#reference https://tex.stackexchange.com/a/95373
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz;
#choose another name if you need
mkdir install-tl-untar && tar -xzf install-tl-unx.tar.gz -C install-tl-untar --strip-components 1;
./install-tl-untar/install-tl;
export PATH=/usr/local/texlive/2020/bin/x86_64-linux:$PATH
export INFOPATH=$INFOPATH:/usr/local/texlive/2020/texmf-dist/doc/info
export MANPATH=$MANPATH:/usr/local/texlive/2020/texmf-dist/doc/man
apt install equivs --no-install-recommends
mkdir -p /tmp/tl-equivs && cd /tmp/tl-equivs
equivs-control texlive-local
cp $(kpsewhich -var-value TEXMFSYSVAR)/fonts/conf/texlive-fontconfig.conf /etc/fonts/conf.d/09-texlive.conf
gkgedit /etc/fonts/conf.d/09-texlive.conf
fc-cache -fsv
tlmgr update --self
tlmgr update --all
tlmgr --gui
apt install perl-tk --no-install-recommends


#install R
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
#add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' -y
#apt update
#apt install r-base

# Download and Install RStudio
#apt install gdebi-core -y
#wget https://download2.rstudio.org/rstudio-server-stretch-1.1.456-amd64.deb -y
#gdebi rstudio-server-stretch-1.1.456-amd64.deb -y
#rm  rstudio-server-1.1.456-amd64.deb 

#R-studio
#apt -y install r-base
#apt install gdebi-core
#apt install gdebi libxml2-dev libssl-dev libcurl4-openssl-dev libopenblas-dev r-base r-base-dev

#intsall emacs
#add-apt-repository ppa:ubuntu-elisp/ppa
#apt update -y
#apt install emacs-snapshot emacs-snapshot-el -y

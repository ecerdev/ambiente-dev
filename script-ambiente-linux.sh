#Atualizando o Linux
sudo apt update

#Realizando upgrade dos pacotes
sudo apt upgrade -y

#---------------------------------
#=========Instalando Java=========
#---------------------------------
#Acessar Diretório de Downloads
cd ~

cd /home/$USER/Downloads

#Baixando o JDK 8u 291 x65
sudo wget https://www.erickcerqueira.com.br/downloads/jdk-8u291-linux-x64.tar.gz

#Adicionando Permissões no arquivo baixado
sudo chown -R $USER jdk-8u291-linux-x64.tar.gz

#Criando pasta jvm
sudo mkdir /usr/lib/jvm

#Acessando a pasta criada
cd /usr/lib/jvm

#Extraindo Java
sudo tar -xzvf ~/Downloads/jdk-8u291-linux-x64.tar.gz

#Adicionando Permissões no arquivo extraido
sudo chown -R $USER jdk1.8.0_291

#Acessando a pasta extraida do java
cd jdk1.8.0_291

#Alterando váriavel de ambiente para receber o java
sudo bash -c "echo -e 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/jdk1.8.0_291/bin:/usr/lib/jvm/jdk1.8.0_291/jre/bin" \nJ2SDKDIR="/usr/lib/jvm/jdk1.8.0_291"
J2REDIR="/usr/lib/jvm/jdk1.8.0_291/jre"
JAVA_HOME="/usr/lib/jvm/jdk1.8.0_291"' >  /etc/environment"

#Aplicando e Atualizando as conifigurações do Java
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_291/bin/java" 0

sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_291/bin/javac" 0

sudo update-alternatives --set java /usr/lib/jvm/jdk1.8.0_291/bin/java

sudo update-alternatives --set javac /usr/lib/jvm/jdk1.8.0_291/bin/javac

sudo update-alternatives --list java

sudo update-alternatives --list javac

#Atualizando o Linux
sudo apt update

#Realizando upgrade dos pacotes
sudo apt upgrade -y

#---------------------------------
#=========Instalando o NVM=========
#---------------------------------
#Acessar Diretório Raiz
cd ~

#Baixando o NVM
sudo wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

#Exportando o path
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#Aplicando o export e atualizando a source
source ~/.bashrc

#Atualizando o Linux
sudo apt update

#Realizando upgrade dos pacotes
sudo apt upgrade -y

#Aplicando fix de pacotes
sudo apt --fix-broken install -y

#-------------------------------------------
#=========Instalando o NODE com NPM=========
#-------------------------------------------
#Acessando Diretório Raiz
cd ~

#Instalando o NodeJS 16.20.0 para Liferay 7.4
nvm install v16.20.0

#----------------------------------------
#=========Instalando o YO e GULP=========
#----------------------------------------
#Acessando Diretório Raiz
cd ~

#Instalando o Gulp & Yo para Liferay 7.4
npm install -g gulp

#----------------------------------------------------
#=========Instalando Liferay Theme Generator=========
#----------------------------------------------------
#Acessando Diretório Raiz
cd ~

#Instalando o Liferay Generator para Liferay 7.4
npm install -g generator-liferay-theme@10.x.x


#--------------------------------------
#=========Instalando Blade CLI=========
#--------------------------------------
#Acessando Diretório Raiz
cd ~

#Instalando o Blade CLI
curl -L https://raw.githubusercontent.com/liferay/liferay-blade-cli/master/cli/installers/local | sh

#Exportando a váriavel do blade
#Obs: Altere o usuário para o seu "ecerqueira"
sudo echo -e 'export PATH="$PATH:/home/estudos/jpm/bin"' >  ~/.bashrc

#Aplicando e atualizando
. ~/.bashrc

#Atualizando o Linux
sudo apt update

#Realizando upgrade dos pacotes
sudo apt upgrade -y

#Aplicando fix de pacotes
sudo apt --fix-broken install -y

#--------------------------------------------
#=========Instalando o Google Chrome=========
#--------------------------------------------
#Acessando Diretório Raiz
cd ~

#Acessar Diretório de Downloads
cd /home/$USER/Downloads

#Baixando a ultima versão do chrome estável
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

#Instalando o Chrome
sudo dpkg -i google-chrome-stable_current_amd64.deb

#Atualizando o Linux
sudo apt update

#Realizando upgrade dos pacotes
sudo apt upgrade -y

#Aplicando fix de pacotes
sudo apt --fix-broken install -y

#--------------------------------------
#=========Instalando o Discord=========
#--------------------------------------
#Acessando Diretório Raiz
cd ~

#Acessar Diretório de Downloads
cd /home/$USER/Downloads

#Baixando a ultima versão do discord estável
sudo wget https://dl.discordapp.net/apps/linux/0.0.31/discord-0.0.31.deb

#Instalando o Discord
sudo dpkg -i discord-0.0.31.deb

#-------------------------------------------------
#=========Instalando o Visual Studio Code=========
#-------------------------------------------------
#Acessando Diretório Raiz
cd ~

#Acessar Diretório de Downloads
cd /home/$USER/Downloads

#Baixando a ultima versão do Visual Studio Code estável
sudo wget https://az764295.vo.msecnd.net/stable/e7e037083ff4455cf320e344325dacb480062c3c/code_1.83.0-1696350811_amd64.deb

#Instalando o Visual Studio Code
sudo dpkg -i code_1.83.0-1696350811_amd64.deb

#Atualizando o Linux
sudo apt update

#Realizando upgrade dos pacotes
sudo apt upgrade -y

#Aplicando fix de pacotes
sudo apt --fix-broken install -y

#--------------------------------------
#=========Instalando o DBeaver=========
#--------------------------------------
#Acessando Diretório Raiz
cd ~

#Acessar Diretório de Downloads
cd /home/$USER/Downloads

#Baixando a ultima versão do DBeaver estável
sudo wget https://download.dbeaver.com/community/23.2.2/dbeaver-ce_23.2.2_amd64.deb

#Instalando o DBeaver
sudo dpkg -i dbeaver-ce_23.2.2_amd64.deb

#Atualizando o Linux
sudo apt update

#Realizando upgrade dos pacotes
sudo apt upgrade -y

#Aplicando fix de pacotes
sudo apt --fix-broken install -y

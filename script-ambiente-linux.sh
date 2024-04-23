#!/bin/bash

# Informações do criador do script
criador="Erick Cerqueira"
data_criacao="23/04/2024"
versao="v1"

# Nome de usuário atual
usuario=$(whoami)

# Lista de softwares a serem instalados
softwares=(
    "Java"
    "Docker"
    "NVM e Node.js"
    "Postman"
    "PortX"
    "OpenVPN"
    "XAMPP"
    "Google Chrome"
    "Discord"
    "Visual Studio Code"
    "DBeaver"
    "Blade CLI"
    "Liferay Theme Generator"
    "Yo"
    "Gulp"
    "Git"
)

# Função para exibir mensagem de progresso
exibir_mensagem_progresso() {
    echo "----------------------------------------------"
    echo "Instalação de $1 em andamento..."
    echo "Por favor, aguarde..."
    echo "----------------------------------------------"
}

# Função para listar os softwares a serem instalados
listar_softwares() {
    echo "Softwares a serem instalados:"
    for software in "${softwares[@]}"; do
        echo "- $software"
    done
    echo ""
}

# Verificar se o Git está instalado
verificar_git() {
    if ! command -v git &>/dev/null; then
        exibir_mensagem_progresso "Git"
        sudo apt install git -y
    fi
}

# Boas-vindas
echo "Bem-vindo à Configuração Automatizada do Ambiente Linux!"
echo "Este script foi criado por $criador em $data_criacao, Versão: $versao."
listar_softwares

# Solicitar confirmação do usuário
read -p "Deseja continuar com a instalação? (s/n): " continuar
if [[ $continuar != "s" ]]; then
    echo "Instalação cancelada."
    exit 0
fi

# Atualizar o sistema
exibir_mensagem_progresso "Atualização do sistema"
sudo apt update && sudo apt upgrade -y

# Verificar e instalar wget e curl, se necessário
exibir_mensagem_progresso "wget e curl"
if ! command -v wget &>/dev/null; then
    sudo apt install wget -y
fi

if ! command -v curl &>/dev/null; then
    sudo apt install curl -y
fi

# Verificar e instalar Git, se necessário
verificar_git

# Diretório de Downloads
download_dir="/home/$usuario/Downloads"

# Instalação do Java
exibir_mensagem_progresso "Java"
jdk_url="https://www.erickcerqueira.com.br/downloads/jdk-8u291-linux-x64.tar.gz"
sudo mkdir -p /usr/lib/jvm
sudo wget -O "$download_dir/jdk.tar.gz" "$jdk_url"
sudo tar -xzvf "$download_dir/jdk.tar.gz" -C /usr/lib/jvm/
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_291/bin/java" 0
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_291/bin/javac" 0
echo "export JAVA_HOME=\"/usr/lib/jvm/jdk1.8.0_291\"" >> "/home/$usuario/.bashrc"
source "/home/$usuario/.bashrc"

# Instalação do Docker
exibir_mensagem_progresso "Docker"
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker $usuario

# Instalação do NVM e Node.js
exibir_mensagem_progresso "NVM e Node.js"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="/home/$usuario/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install v16.20.0

# Instalação do Postman
exibir_mensagem_progresso "Postman"
postman_url="https://dl.pstmn.io/download/latest/linux64"
sudo wget -O "$download_dir/postman.tar.gz" "$postman_url"
sudo tar -xzvf "$download_dir/postman.tar.gz" -C /opt/
sudo ln -s /opt/Postman/Postman /usr/bin/postman

# Instalação do PortX
exibir_mensagem_progresso "PortX"
portx_url="https://github.com/kubesphere/portx/releases/download/v0.5.0/portx-v0.5.0-linux-amd64.tar.gz"
sudo wget -O "$download_dir/portx.tar.gz" "$portx_url"
sudo tar -xzvf "$download_dir/portx.tar.gz" -C /usr/local/bin/

# Instalação do OpenVPN
exibir_mensagem_progresso "OpenVPN"
sudo apt install openvpn -y

# Instalação do XAMPP
exibir_mensagem_progresso "XAMPP"
xampp_url="https://www.apachefriends.org/xampp-files/8.1.0/xampp-linux-x64-8.1.0-0-installer.run"
sudo wget -O "$download_dir/xampp-installer.run" "$xampp_url"
sudo chmod +x "$download_dir/xampp-installer.run"
sudo "$download_dir/xampp-installer.run"

# Criar atalho na área de trabalho para o gerenciador do XAMPP
cat <<EOF > "/home/$usuario/Área de Trabalho/XAMPP Manager.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=XAMPP Manager
Comment=Start, Stop, Restart XAMPP Services
Exec=gksudo /opt/lampp/manager-linux-x64.run
Icon=/opt/lampp/htdocs/favicon.ico
Terminal=false
Categories=Development;WebDevelopment;
EOF

# Permissões de execução para o atalho
chmod +x "/home/$usuario/Área de Trabalho/XAMPP Manager.desktop"

# Instalação do Blade CLI
exibir_mensagem_progresso "Blade CLI"
curl -L https://raw.githubusercontent.com/liferay/liferay-blade-cli/master/cli/installers/local | sh

# Exportar variável do Blade CLI
echo "export PATH=\"\$PATH:/home/$usuario/jpm/bin\"" >> "/home/$usuario/.bashrc"
source "/home/$usuario/.bashrc"

# Instalação do Liferay Theme Generator
exibir_mensagem_progresso "Liferay Theme Generator"
npm install -g generator-liferay-theme@10.x.x

# Instalação do Yo e Gulp
exibir_mensagem_progresso "Yo e Gulp"
npm install -g yo gulp

# Instalação de outras ferramentas e aplicativos (se houver)

# Instalação do Google Chrome
exibir_mensagem_progresso "Google Chrome"
chrome_url="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo wget -O "$download_dir/google-chrome.deb" "$chrome_url"
sudo dpkg -i "$download_dir/google-chrome.deb"
sudo apt install -f -y

# Instalação do Discord
exibir_mensagem_progresso "Discord"
discord_url="https://dl.discordapp.net/apps/linux/0.0.31/discord-0.0.31.deb"
sudo wget -O "$download_dir/discord.deb" "$discord_url"
sudo dpkg -i "$download_dir/discord.deb"
sudo apt install -f -y

# Instalação do Visual Studio Code
exibir_mensagem_progresso "Visual Studio Code"
vscode_url="https://az764295.vo.msecnd.net/stable/e7e037083ff4455cf320e344325dacb480062c3c/code_1.83.0-1696350811_amd64.deb"
sudo wget -O "$download_dir/vscode.deb" "$vscode_url"
sudo dpkg -i "$download_dir/vscode.deb"
sudo apt install -f -y

# Instalação do DBeaver
exibir_mensagem_progresso "DBeaver"
dbeaver_url="https://download.dbeaver.com/community/23.2.2/dbeaver-ce_23.2.2_amd64.deb"
sudo wget -O "$download_dir/dbeaver.deb" "$dbeaver_url"
sudo dpkg -i "$download_dir/dbeaver.deb"
sudo apt install -f -y

# Limpeza
echo "----------------------------------------------"
echo "Limpando arquivos de instalação..."
echo "----------------------------------------------"
rm -rf "$download_dir/*.deb" "$download_dir/jdk.tar.gz" "$download_dir/postman.tar.gz" "$download_dir/portx.tar.gz" "$download_dir/xampp-installer.run"

echo ""
echo "Configuração automatizada concluída com sucesso!"
echo "Seu ambiente Linux está pronto para uso."

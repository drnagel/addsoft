installReaper(){
# URL del archivo .tar.xz
URL="https://www.reaper.fm/files/7.x/reaper711_linux_x86_64.tar.xz"
# Directorio de descarga
DIRECTORIO_DESCARGA="$HOME/Descargas"

# Nombre del archivo .tar.xz
NOMBRE_ARCHIVO="reaper711_linux_x86_64.tar.xz"

# Nombre directorio descarga
NOMBRE_DIRECTORIO="reaper_linux_x86_64"

# Nombre del archivo setup.sh
NOMBRE_SCRIPT="install-reaper.sh"

# 1. Descargar el archivo .tar.xz
echo "Descargando $NOMBRE_ARCHIVO..."
wget -q -O "$DIRECTORIO_DESCARGA/$NOMBRE_ARCHIVO" "$URL"

# 2. Descomprimir el archivo .tar.xz
echo "Descomprimiendo $NOMBRE_ARCHIVO..."
tar -xf "$DIRECTORIO_DESCARGA/$NOMBRE_ARCHIVO" -C "$DIRECTORIO_DESCARGA" 

# 3. Modificar permisos del archivo descomprimido
echo "Modificando permisos..."
chmod +x "$DIRECTORIO_DESCARGA/$NOMBRE_ARCHIVO"

# 4. Ejecutar el archivo setup.sh
echo "Ejecutando $NOMBRE_SCRIPT..."
bash "$DIRECTORIO_DESCARGA/$NOMBRE_DIRECTORIO/$NOMBRE_SCRIPT"

}

InstallWineStagging(){
# Update package lists
sudo apt update
sudo apt upgrade -y

# Add i386 architecture
sudo dpkg --add-architecture i386

# Install required keys
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key

# Add repository source
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources

# Update package lists again
sudo apt update

# Install Wine-Staging
sudo apt install --install-recommends winehq-staging

echo "Wine-Staging installed successfully."

}

InstallYabridge(){
# URL del archivo .tar.xz
URL="https://github.com/robbert-vdh/yabridge/releases/download/5.1.0/yabridge-5.1.0.tar.gz"
# Directorio de descarga
DIRECTORIO_DESCARGA="$HOME/Descargas"

# Nombre del archivo .tar.xz
NOMBRE_ARCHIVO="yabridge-5.1.0.tar.gz"

# Nombre directorio descarga
NOMBRE_DIRECTORIO="$HOME/.local/share"

# 1. Descargar el archivo .tar.xz
echo "Descargando $NOMBRE_ARCHIVO..."
wget -q -O "$DIRECTORIO_DESCARGA/$NOMBRE_ARCHIVO" "$URL"

# 2. Descomprimir el archivo .tar.xz
echo "Descomprimiendo $NOMBRE_ARCHIVO..."
tar -xavf $DIRECTORIO_DESCARGA/$NOMBRE_ARCHIVO -C $NOMBRE_DIRECTORIO 

# 3. Comprobar la existencia del archivo yabridgectl
if [ -f $NOMBRE_DIRECTORIO/yabridge/yabridgectl ]; then
  echo "Yabridge extraído correctamente."
else
  echo "Error: el archivo yabridgectl no se encontró en la ubicación esperada."
  exit 1  # Salir del script con un código de error
fi

}

installReaper
InstallWineStagging
InstallYabridge
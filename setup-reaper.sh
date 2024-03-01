installReaper(){
# URL del archivo .tax.xz
URL="https://www.reaper.fm/files/7.x/reaper711_linux_x86_64.tar.xz"
# Directorio de descarga
DIRECTORIO_DESCARGA="$HOME/Descargas"

# Nombre del archivo .tax.xz
NOMBRE_ARCHIVO="reaper711_linux_x86_64.tar.xz"

# Nombre directorio descarga
NOMBRE_DIRECTORIO="reaper_linux_x86_64"

# Nombre del archivo setup.sh
NOMBRE_SCRIPT="install-reaper.sh"

# 1. Descargar el archivo .tax.xz
echo "Descargando $NOMBRE_ARCHIVO..."
wget -q -O "$DIRECTORIO_DESCARGA/$NOMBRE_ARCHIVO" "$URL"

# 2. Descomprimir el archivo .tax.xz
echo "Descomprimiendo $NOMBRE_ARCHIVO..."
tar -xf "$DIRECTORIO_DESCARGA/$NOMBRE_ARCHIVO" -C "$DIRECTORIO_DESCARGA" 

# 3. Modificar permisos del archivo descomprimido
echo "Modificando permisos..."
chmod +x "$DIRECTORIO_DESCARGA/$NOMBRE_ARCHIVO"

# 4. Ejecutar el archivo setup.sh
echo "Ejecutando $NOMBRE_SCRIPT..."
bash "$DIRECTORIO_DESCARGA/$NOMBRE_DIRECTORIO/$NOMBRE_SCRIPT"

}

installReaper
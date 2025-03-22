# Usar una imagen base de Python
FROM python:3.11-slim

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar los archivos necesarios al contenedor
COPY requirements.txt requirements.txt
COPY api2.py api2.py

# Instalar las dependencias desde requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Exponer el puerto en el que Flask correrá (por defecto 5000)
EXPOSE 5000

# Comando para ejecutar la aplicación cuando se inicie el contenedor
CMD ["python", "api2.py"]


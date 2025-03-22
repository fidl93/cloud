# Docker

Aqui tenemos el dockerfile para construir una imagen con los componentes necesarios para la práctica. En este caso de base vamos a tener:
* AWS Cli
* Terraform Cli

Abrimos la terminal de nuestro equipo y nos situamos en la carpeta docker.

1º Ejecutamos el build de la imágen
 ```
 export DOCKER_DEFAULT_PLATFORM=linux/amd64 (MAC Users)
 docker build -t aws_tools:latest .
 ```
2º Subimos un nivel en la terminal para situarnos en el directorio root del repo
```
cd ..
```
3º Ejecutamos el siguiente comando para acceder al contenedor
```
docker run --rm -v $(pwd):/code -it  aws_tools:latest
```

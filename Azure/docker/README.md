# Docker
Imagen docker con todas las herramientas que vamos a necesitar para la práctica

Abrimos la terminal de nuestro equipo y nos situamos en la carpeta docker.
 1º Ejecutamos el build de la imágen
 ```
 export DOCKER_DEFAULT_PLATFORM=linux/amd64 (MAC Users)
 docker build -t tools:latest .
 ```
2º Subimos un nivel en la terminal para situarnos en el directorio root del repo
```
cd ..
```
3º Ejecutamos el siguiente comando para acceder al contenedor
```
(MAC/LINUX) --> docker run --rm -v $(pwd):/code -it  tools:latest
(Windows) --> docker run --rm -v ${PWD}:/code -it  tools:latest
```

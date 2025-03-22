# Api Docker container

Contenedor docker con una api en Flask, al que le puedes hacer una petición POST con un JSON y lo veriamos reflejado en el log del container.

Ejemplo de petición
```
curl -X POST http://X.X.X.X:5000/api/tabla \
-H "Content-Type: application/json" \
-d '[["Nombre", "Edad", "Ciudad"], ["Juan", 25, "Madrid"], ["Ana", 30, "Barcelona"]]'
```

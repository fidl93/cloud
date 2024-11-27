En esta práctica vamos a desplegar la siguiente infraestructura
![infra](../docs/practica_5.png)

Sobre la práctica anterior, vamos añadir una api, dentro de un contenedor, a la que podemos enviar los resultados y visualizarlos en el log.

Tenemos que ejecutar los siguientes export porque los utiliza el provider de azure.
```
az account list -o table
export ARM_TENANT_ID="tenant"
export ARM_SUBSCRIPTION_ID="Subscription ID which can be found in the Azure portal"
```
A la altura del fichero main.tf
Descarta de dependencias y plugins
```
terraform init
```
Resumen de los cambios que va a ejecutar
```
terraform plan -out plan.out
```
Aplicamos el plan que hemos visto previamente
```
terraform apply plan.out
```

Para destruir lo que hemos construido
```
terraform destroy
```
Revisamos nuevos RG creados.

Cambios que tenemos que hacer en el notebook de Algorithm.

1. Tenemos que transformar el Dataframe a JSON.

```
# Convertir a JSON
json_data = df.toJSON().collect()

# Imprimir el JSON resultante
print(json_data)

```

2. Tenemos que instalar, con pip, la libreria de requests.
```
%pip install requests
```

3. Añadimos el código para hacer el envio a la api, hay que cambiar la URL para que apunte a nuestra api.
```
import requests
import json

# Convertir el DataFrame de PySpark a una lista de listas (encabezados + datos)
columns = df.columns
data = [row.asDict() for row in df.collect()]
tabla = [columns] + data

# URL de la API
url = "http://localhost:5000/api/tabla"

# Enviar la solicitud POST con el DataFrame convertido a JSON
response = requests.post(url, json=tabla)

# Verificar la respuesta de la API
print(response.status_code)
print(response.text)

```

4. Si todo fue bien, podemos ver en el log del contenedor los datos enviamos.

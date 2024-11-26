En esta práctica vamos a desplegar la siguiente infraestructura
![infra](../docs/practica_4.png)

Vamos a desplegar un Stogare account y una Base de datos SQL.
En ambos vamos a cargar 2 datasets
Los leeremos con un Notebook de pyspark dentro de Databricks y mostraremos la salida de una operación.

!!IMPORTANTE - Mirar las zonas disponibles de la mysql
* az mysql flexible-server list-skus --location westeurope
* PORTAL

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

## Pasos previos a la práctica desde el portal

1. Dentro del storage, creamos un container y subimos el fichero files/dataset2.csv
2. Dentro del databricks, subimos los files/notebooks

Ejecutamos los playbooks,
Algorithm --> Rellena la base de datos
Database_model --> Lee de dos entidades y hace un join

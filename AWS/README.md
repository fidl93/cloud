# AWS - IaC

## Docker
Ejecuta la imagen que encontraras en la carpeta docker

## Práctica 1
Levantar el mismo componente de AWS utilizando:
* AWS Cli
* AWS cloudformation
* Terraform

Incluye:
* Creación de S3 Storage

## Práctica 2
Sobre el ejercicio anterior, vamos a añadir:
* Vpc
* Subnet
* Route Table
* Internet GW
* Security group

Comandos AWS de interes

## Práctica 3
Implementar lo mismos que la práctica 2, pero aplicando modulos y variables.


## Práctica 4
Partiendo del sistema de redes de la práctica anterior. Vamos a montar a mayores
* EC2 (Virtual Machine)
* RDS (Database)

## Práctica 5
Partiendo del ejemplo anterior
* Montamos un s3

Sobre la EC2 vamos a desplegar un servicio de Jupyter Lab usando python. Vamos a ejecutar un algoritmo en pyspark que obtiene datos del s3 y de la RDS DB para hacer un join por un campo comun en spark.

## Práctica Lambda Function
Desplegar na lambda function que se conecta a un s3. Esta función espera recibir eventos en un endpoint. Estos eventos son una POST request con un fichero CSV en base 64.
El fichero que reciben lo almacenan en el bucket asignado.

# Terraform code

![infra](../docs/practica_2_1.png)

![infra](../docs/practica_2_2.png)

* Virtual Network:
  * Espacio de direcciones: 10.0.0.0/16
* Subnets:
  * Espacios de direcciones: 10.0.1.0/24
  * Espacios de direcciones: 10.0.2.0/24
  * Espacios de direcciones: 10.0.2.0/24

A la altura del fichero main.tf
Descarga de dependencias y plugins
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

Echar un ojo al tfstate.


Para destruir lo que hemos construido
```
terraform destroy
```
Revisamos las listas en address_spaces y los tags.

## Comandos Terraform

### Apply específico
```
terraform apply -target xxxx
terraform apply -target xxxx -target xxxx
```
### State
```
terraform state list
terraform state show aws_vpc.vpc
```
### Import
```
terraform import xxxxx AWS_ID
```
### Graph
```
terraform graph

http://webgraphviz.com/
https://spacelift.io/blog/terraform-graph
```

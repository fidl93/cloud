variable "db_storage" {
  description = "The amount of storage to allocate for the database"
  type        = number
  default     = 10
}
variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine to use"
  type        = string
  default = "8.0"
}

variable "instance_class" {
  description = "The instance class to use"
  type        = string
}

variable "password" {
  description = "The password for the database user"
  type        = string
  sensitive = true
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group to use"
  type        = string
}

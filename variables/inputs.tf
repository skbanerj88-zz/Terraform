variable "environment" {
  description = "The cluster deployment environment"
  }

variable "size" {
  description = "The size of the instances"
  }

variable "subnet_map" {
  description = "A map from environment to a comma-delimited list of the subnets"
  type = "map"
default = {
    dev     = "subnet-c59403abe,subnet-69483bdb33c"
    qa      = "subnet-e48unjd9a1,subnet-c085uhd93a4"
  }
}
output "subnets" {
  value = ["${split(",", var.subnet_map[var.environment])}"]
} 

variable "address_map" {
  description = "A map from environment to a comma-delimited list of the addresses"
  type = "map"
default = {
    dev     = "10.0.1.0/24,10.0.2.0/24,10.0.3.0/24"
    qa      = "10.1.1.0/24,10.1.1.0/24,10.1.1.0/24"
  }
}
output "addresses" {
  value = ["${var.address_map[var.environment]}"]
} 
 
variable "instance_type_map" {
  description = "A map from environment to the type of EC2 instance"
  type = "map"
  default = {
    small  = "t2.large",
    medium = "t2.xlarge"
  }
}
output "instance_type" {
  value = "${var.instance_type_map[var.size]}"
} 
 

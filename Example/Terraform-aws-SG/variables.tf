variable "project_name" {
  type = string 
  default = "roboshop"
}

variable "environment" {
  type = string 
  default = "dev"
}

variable "sg_name" {
  type = string 
  default = "roboshop_SG"
}

variable "vpc_id" {
  type = string 
  default = "vpc-0abc123456789def0"
}

variable "sg_description" {
  type = string 
  default = "allowing HTTP and HTTPS ports"
}
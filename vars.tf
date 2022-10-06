
# Creating a Variable for ami of type map


variable "ec2_ami" {
  type = map

  default = {
    us-east-1 = "ami-026b57f3c383c2eec"
    us-east-1 = "ami-005b11f8b84489615"
  }
}

# Creating a Variable for region

variable "region" {
  default = "us-east-1"
}


# Creating a Variable for instance_type
variable "instance_type" {    
  type = string
}

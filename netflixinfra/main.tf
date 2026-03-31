provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-04680790a315cd58d"
  instance_type          = "t2.micro"
  key_name               = "aniket-key"
  vpc_security_group_ids = ["sg-03a9e759383307f17"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}

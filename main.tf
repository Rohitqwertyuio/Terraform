provider "aws" {
region = "us-east-1"
access_key = "AKIAXA6KEATBM6IJTQMX"
secret_key = "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"
}

resource "aws_instance" "one" {
ami = "ami-0187337106779cdf8"
instance_type = "t2.medium"
   key_name = "terra-key"
   vpc_security_group_ids = [aws_security_group.bar.id]
   availability_zone = "ap-south-1"
   user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd 
sudo chkconfig httpd on
sudo echo "Hai All This is My Zomato-1 Web-Application Created by Terraform Infrastructute By Java Home Cloud Server-1" > /var/www/html/index.html
EOF
tags = {
Name = "Zomato-1"
}
}

resource "aws_instance" "two" {
ami = "ami-0187337106779cdf8"
instance_type = "t2.micro"
   key_name = "terra-key"
   vpc_security_group_ids = [aws_security_group.bar.id]
   availability_zone = "ap-northeast-3"
   user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo chkconfig httpd on
sudo echo "Hai All This is My Zomato-2 Web-Application Created by Terraform Infrastructute By Java Home Cloud Server-1" > /var/www/html/index.html
EOF
tags = {
Name = "Zomato-1"
}
}


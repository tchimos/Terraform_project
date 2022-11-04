#Created by Christian Tchimi
#last modified date 11/03/2022


#Defining the provider 


provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

#creating a vpc 

resource "aws_vpc" "main" {

 cidr_block = "10.0.0.0/16"

 

 tags = {

   Name = "test_vpc"

 }

}

#creating an IAM role

resource "aws_iam_role" "ec2_s3_access_role" {
  name               = "s3-role"
  assume_role_policy = "${file("policy_ec2_s3.json")}"
}

 #creating IAM USER

resource "aws_iam_user" "demouser" {   
     name = "terraform_user"
     }

#output the VPC ID

output "vpc_id" {
  value = aws_vpc.main.id

}

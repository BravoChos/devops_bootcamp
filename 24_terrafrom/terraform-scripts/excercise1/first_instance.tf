provider "aws" {
  region = "ap-northeast-2"
  #   access_key = ""
  #   secret_key = ""	
}

resource "aws_instance" "intro" {
  ami                    = "ami-0342738dbfee29539"
  instance_type          = "t2.micro"
  availability_zone      = "ap-northeast-2a"
  key_name               = "Pineapple"
  vpc_security_group_ids = ["sg-087cc3b2b7c5d720b"]
  tags = {
    Name    = "Pineapple-Instance"
    Project = "Pineapple"
  }
}

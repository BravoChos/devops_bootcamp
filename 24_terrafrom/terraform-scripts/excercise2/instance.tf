resource "aws_instance" "pineapple-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "Pineapple"
  vpc_security_group_ids = ["sg-087cc3b2b7c5d720b"]
  tags = {
    Name    = "Pineapple-Instance"
    Project = "Pineapple"
  }
}

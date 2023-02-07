resource "aws_key_pair" "pineapple-key" {
  key_name   = "dove"
  public_key = file("dove.pub")
}

resource "aws_instance" "pineapple-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.pineapple-key.key_name
  vpc_security_group_ids = ["sg-087cc3b2b7c5d720b"]
  tags = {
    Name    = "Pineapple-Instance"
    Project = "Pineapple"
  }

  connection {
    type        = "ssh"
    user        = var.USER
    private_key = file("./pineapple-key.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "echo Waiting for instance to be ready...",
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }
}

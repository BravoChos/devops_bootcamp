resource "aws_key_pair" "dove-key" {
  key_name   = "pineapplekey"
  public_key = file("pineapplekey.pub")
}

resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.pinapple-key.key_name
  vpc_security_group_ids = ["sg-0780815f55104be8a"]
  tags = {
    Name    = "Pineapple-Instance"
    Project = "Pineapple"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("pineapplekey")
    host        = self.public_ip
  }
}

output "PublicIP" {
  value = aws_instance.pineapple-inst.public_ip
}

output "PrivateIP" {
  value = aws_instance.pineapple-inst.private_ip
}
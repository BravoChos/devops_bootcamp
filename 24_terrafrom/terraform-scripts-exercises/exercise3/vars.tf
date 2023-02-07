variable "REGION" {
  default = "ap-northeast-2"
}

variable "ZONE1" {
  default = "ap-northeast-2a"
}

variable "AMIS" {
  type = map(any)
  default = {
    ap-northeast-2 = "ami-0342738dbfee29539"
    ap-northeast-1 = "ami-0aa209e62f4372dde"
  }
}

variable "USER" {
  default = "ec2-user"
}
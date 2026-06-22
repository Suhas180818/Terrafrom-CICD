
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "pem-key" {
  key_name   = var.pemKeyName
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "private-key_file" {
  content  = tls_private_key.rsa.private_key_openssh
  filename = var.pemKey_filepath
}


resource "aws_instance" "myInstance" {
  ami           = var.amiType
  instance_type = var.instanceType
  key_name      = aws_key_pair.pem-key.key_name
  tags = {
    Name = "CICD-instance"
  }
  

}


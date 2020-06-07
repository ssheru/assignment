provider "aws" {
  region = "${var.region}"
}
resource "aws_instance" "testapp-server" {
  ami           = "ami-086b16d6badeb5716"
  instance_type = "t2.micro"
  key_name      = "AWS_nagios"
  user_data     = "${file("installations.sh")}"
  tags = {
    Name = "BPDTS"
  }
}
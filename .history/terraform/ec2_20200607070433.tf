provider "aws" {
  region = "${var.region}"
}
resource "aws_instance" "testapp-server" {
  ami           = "ami-086b16d6badeb5716"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"
  user_data     = "${file("installations.sh")}"
  tags = {
    Name = "BPDTS"
  }
}
provider "aws" {
  region = "${var.region}"
}
resource "aws_instance" "testapp-server" {
  ami           = "ami-003634241a8fcdec0"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"
  user_data     = "${file("installations.sh")}"
  tags = {
    Name = "BPDTS"
  }
}
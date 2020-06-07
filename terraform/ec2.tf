provider "aws" {
  region = "${var.region}"
}
resource "aws_instance" "testapp-server" {
  ami           = "ami-0e34e7b9ca0ace12d"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"
  user_data     = "${file("installations.sh")}"
  tags = {
    Name = "BPDTS"
  }
}
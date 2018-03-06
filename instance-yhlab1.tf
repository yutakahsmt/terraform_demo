resource "aws_instance" "ubuntu_client1" {
  ami           = "ami-173db873"
  instance_type = "t2.micro"

  root_block_device {
    volume_size = 10
    volume_type = "gp2"
    delete_on_termination = true
}

ebs_block_device {
    device_name = "/dev/xvdh"
    volume_size = 20
    volume_type = "gp2"
    delete_on_termination = true
  }

  availability_zone = "ca-central-1a"
  private_ip = "172.50.0.10"
  subnet_id = "${aws_subnet.private.id}"
  vpc_security_group_ids = ["${aws_security_group.client-access.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"

  tags {
    Name = "${var.name}-ubuntu_client1"
  }
}

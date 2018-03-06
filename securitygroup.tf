resource "aws_security_group" "client-access" {
  name = "client-access"
  description = "client-access"
  vpc_id = "${aws_vpc.yhlab1.id}"

  # outgoing traffic
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # incoming traffic
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # allow icmp echo request
  ingress {
    from_port = 1
    to_port = 1
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "client-access"
  }
}

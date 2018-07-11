resource "aws_security_group" "blog-security-group" {
  vpc_id = "${aws_vpc.master-vpc.id}"
  name = "blog-security-group"
  description = "security group that allows ssh, HTTP and HTTPS for ingress and all for egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["106.201.63.32/32"]
  }
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
      Name = "blog-security-group"
  }
}

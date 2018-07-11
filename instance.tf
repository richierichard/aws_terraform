resource "aws_instance" "blog-production" {
  ami           = "${lookup(var.ami, var.AWS_REGION)}"
  instance_type = "t2.micro"
  disable_api_termination = "true"

  # the VPC subnet
  subnet_id = "${aws_subnet.public-subnet-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.blog-security-group.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.blog-key-pair.key_name}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = true
  }

  tags {
    Name = "Blog-Production"
  }

  volume_tags {
    Name = "Blog-Production"
  }
}

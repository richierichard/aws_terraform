resource "aws_eip" "blog-eip"
{
  instance = "${aws_instance.blog-production.id}"
  vpc = true
}

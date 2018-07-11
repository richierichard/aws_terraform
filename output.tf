output "blog-production-private-ip"
{
  value = "${aws_instance.blog-production.private_ip}"
}

output "blog-production-public-ip"
{
  value = "${aws_eip.blog-eip.public_ip}"
}

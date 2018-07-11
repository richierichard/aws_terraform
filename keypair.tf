resource "aws_key_pair" "blog-key-pair" {
  key_name = "blog-key-pair"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

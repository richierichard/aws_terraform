variable "AWS_REGION" 
{
  default = "ap-south-1"
}

variable "PATH_TO_PRIVATE_KEY" 
{
  default = "blog-key-pair"
}

variable "PATH_TO_PUBLIC_KEY" 
{
  default = "blog-key-pair.pub"
}

variable "ami" 
{
  type = "map"
  default = 
  {
    ap-south-1 = "ami-48301d27"
  }
}

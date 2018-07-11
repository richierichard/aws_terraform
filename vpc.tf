# Internet VPC
resource "aws_vpc" "master-vpc" {
    cidr_block = "172.16.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "master-vpc"
    }
}

# Public Subnets
resource "aws_subnet" "public-subnet-1" {
    vpc_id = "${aws_vpc.master-vpc.id}"
    cidr_block = "172.16.0.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "ap-south-1a"
    tags {
        Name = "public-subnet-1"
    }
}

# Internet GW
resource "aws_internet_gateway" "master-gateway" {
    vpc_id = "${aws_vpc.master-vpc.id}"
    tags {
        Name = "master-gateway"
    }
}

# Public Route Tables
resource "aws_route_table" "public-route-table-1" {
    vpc_id = "${aws_vpc.master-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.master-gateway.id}"
    }
    tags {
        Name = "public-route-table-1"
    }
}

# Public Route Associations
resource "aws_route_table_association" "public-rt-association-1" {
    subnet_id = "${aws_subnet.public-subnet-1.id}"
    route_table_id = "${aws_route_table.public-route-table-1.id}"
}

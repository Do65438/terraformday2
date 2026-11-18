resource "aws_vpc" "public_my_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
    enable_dns_support = true
    tags = {    
        Name = var.vpcname
        Owner = local.Owner
        costcenter = local.costcenter
        TeamDl = local.TeamDl
        environment = var.environment
    }
}

resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.public_my_vpc.id

    tags = {
        Name = "my_igw"
        Owner = local.Owner
        costcenter = local.costcenter
        TeamDl = local.TeamDl
        environment = var.environment
    }
}


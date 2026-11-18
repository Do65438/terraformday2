resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidr_blocks)
  vpc_id = aws_vpc.public_my_vpc.id
  cidr_block = element(var.public_subnet_cidr_blocks, count.index+1)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "public-subnet-${count.index + 1}"
    Owner = local.Owner
        costcenter = local.costcenter
        TeamDl = local.TeamDl
        environment = var.environment
  }
}
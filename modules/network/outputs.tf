output "vpcname" {
    value = var.vpcname
}

output "vpc_id" {
    value = aws_vpc.public_my_vpc.id
  
}
output "environment" {
    value = var.environment
  
}

output "public-subnet" {
    value = aws_subnet.public_subnet[*].id
}

output "private-subnet" {
    value = aws_subnet.private_subnet[*].id
  
}
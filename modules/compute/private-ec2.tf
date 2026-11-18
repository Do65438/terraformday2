resource "aws_instance" "private_instance_1" {
  count = var.environment == "prod" ? 3 : 2
  #count                       = length(var.public_subnet_cidr_blocks)
  ami                         = lookup(var.amis, var.aws_region)
  instance_type               = var.instance_type
  subnet_id                   = element(var.private_subnets, count.index + 1)
  key_name                    = var.key_name
  #associate_public_ip_address = true
  vpc_security_group_ids      =[var.sg_id]
  tags = {
    Name        = "webserver-${count.index + 1}"
    environment = var.environment
  }
  user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install nginx -y
    systemctl enable nginx
    systemctl start nginx
    echo "<h1>Hello from Terraform</h1>" > /var/www/html/index.html
  EOF

}
resource "aws_instance" "public_instance_1" {
  count = var.environment == "prod" ? 3 : 2
  #count                       = length(var.public_subnet_cidr_blocks)
  ami                         = lookup(var.amis, var.aws_region)
  instance_type               = var.instance_type
  subnet_id                   = element(var.public_subnets, count.index + 1)
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.sg_id]
  tags = {
    Name        = "webserver-${count.index + 1}"
    environment = var.environment
  }

  user_data = <<-EOF
#!/bin/bash
set -eux

if command -v apt-get; then
    apt-get update -y
    apt-get install -y nginx
elif command -v dnf; then
    dnf install -y nginx
elif command -v yum; then
    yum install -y nginx
fi

systemctl enable nginx
systemctl start nginx

echo "<h1>Hello from UAT Terraform</h1>" > /var/www/html/index.html
EOF

  user_data_replace_on_change = true

}

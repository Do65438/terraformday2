resource "aws_security_group" "allow_all" {
    name = "var.vpcname-allowall"
    vpc_id = var.vpc_id

    dynamic "ingress" {
    for_each = var.ingres_value
    content {
        from_port = ingress.value
        to_port = ingress.value 
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name        = "${var.vpcname}-allow-all"
     #   Owner       = local.Owner
      #  costcenter  = var.costcenter
       # TeamDl      = local.TeamDl
        environment = var.environment
    }
}

module "prod_ec2" {
  source      = "../modules/compute"
  environment = module.prod_vpc.environment
  amis = {
    "us-east-1" = "ami-0d97d7f07b25dd693"
    "us-east-2" = "ami-0e1011556f696c3d3"
  }
  instance_type   = "t2.micro"
  key_name        = "amma"
  aws_region      = var.aws_region
  sg_id           = module.prod_sg.sg_id
  public_subnets  = module.prod_vpc.public-subnet
  private_subnets = module.prod_vpc.private-subnet


}
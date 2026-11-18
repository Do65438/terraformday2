module "dev_ec2" {
  source      = "../modules/compute"
  environment = module.dev_vpc.environment
  amis = {
    "us-east-1" = "ami-0d97d7f07b25dd693"
    "us-east-2" = "ami-0e1011556f696c3d3"
  }
  aws_region      = var.aws_region
  instance_type   = "t2.micro"
  key_name        = "amma"
  sg_id           = module.dev_sg.sg_id
  public_subnets  = module.dev_vpc.public-subnet
  private_subnets = module.dev_vpc.private-subnet


}
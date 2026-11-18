module "prod_vpc" {
  source                     = "../modules/network"
  vpcname                    = "prod_vpc"
  vpc_cidr_block             = "192.168.0.0/16"
  public_subnet_cidr_blocks  = ["192.168.1.0/24", "192.168.2.0/24"]
  private_subnet_cidr_blocks = ["192.168.10.0/24", "192.168.20.0/24"]
  azs                        = ["us-east-1a", "us-east-1b"]
  environment                = "prod"


}
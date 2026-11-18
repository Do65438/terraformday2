module "dev_vpc" {
  source                     = "../modules/network"
  vpcname                    = "dev_vpc"
  vpc_cidr_block             = "10.0.0.0/16"
  public_subnet_cidr_blocks  = ["10.0.1.0/24", "10.0.2.0/24"]
  azs                        = ["us-east-1a", "us-east-1b"]
  private_subnet_cidr_blocks = ["10.0.10.0/24", "10.0.11.0/24"]
  environment                = "dev"

}
module "uat_vpc" {
  source                     = "../modules/network"
  vpc_cidr_block             = "10.3.0.0/16"
  public_subnet_cidr_blocks  = ["10.3.1.0/24", "10.3.2.0/24"]
  azs                        = ["us-east-1a", "us-east-1b"]
  private_subnet_cidr_blocks = ["10.3.10.0/24", "10.3.20.0/24"]
  environment                = "uat"
  vpcname                    = "uat-vpc"


}   
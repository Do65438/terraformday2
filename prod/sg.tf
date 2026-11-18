module "prod_sg" {
  source       = "../modules/sg"
  vpcname      = module.prod_vpc.environment
  vpc_id       = module.prod_vpc.vpc_id
  ingres_value = ["22", "80", "443"]
  environment  = module.prod_vpc.environment



}
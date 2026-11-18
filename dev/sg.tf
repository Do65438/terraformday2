module "dev_sg" {
  source       = "../modules/sg"
  vpcname      = module.dev_vpc.vpcname
  vpc_id       = module.dev_vpc.vpc_id
  ingres_value = ["22", "80", "443", "8080"]
  environment  = module.dev_vpc.environment



}
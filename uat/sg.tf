module "uat_sg" {
  source       = "../modules/sg"
  vpcname      = module.uat_vpc.vpcname
  vpc_id       = module.uat_vpc.vpc_id
  ingres_value = ["22", "80", "8080"]
  environment  = module.uat_vpc.environment


}
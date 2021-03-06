module "my_vpc" {
  source           = "../modules/vpc"
  vpc_cidr         = "192.168.0.0/16"
  vpc_id           = "${module.my_vpc.vpc_id}"
  subnet_cidr_pub1 = "192.168.1.0/24"
  subnet_cidr_pub2 = "192.168.2.0/24"
  tenancy          = "default"
}

module "ec2" {
  source        = "../modules/ec2"
  ec2_count     = "2"
  ami_id        = "ami-0f767afb799f45102"
  instance_type = "t2.micro"
  subnet_id     = "${module.my_vpc.subnet_id}"
}

module "rancher" {
  source      = "./rancher-module"
  aws_region  = "us-east-1"
  ami_id      = "ami-05b10e08d247fb927"
  instance_type = "t2.medium"
  key_name    = "rancher"
}

output "rancher_server_public_ip" {
  value = module.rancher.rancher_server_public_ip
}
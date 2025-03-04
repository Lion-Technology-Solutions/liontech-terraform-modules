terraform {
  backend "s3" {

    bucket  = "class26-demo"
    key  = "demo-infra"
    region  = "ca-central-1"
    
  }
}
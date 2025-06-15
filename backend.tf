terraform {
  backend "s3" {
    bucket         = "miniproject-eks-cluster"
    key            = "dev/terraformstate"
    region         = "ap-south-1"
    dynamodb_table = "miniproject_dynamodb"
    encrypt        = true


  }
}

# alex-march-coding-test-module
Platform Engineer Coding Test v1 for 1st stage Interview for Motilent.

Terraform module for providing internet access to an existing VPC private subnet to allow internet using a NAT Gateway.
This module creates a NAT Gateway in an existing public subnet and modifies an existing private subnets route table to route internet traffic through the NAT Gatway, enabling outbound internet access for resources within the private subnet.

## Usage
1. Place this module in your Terraform repo.
2. Add the below reference in your Terraform repo.
note: Below I have added default values. Please update with the correct values for the VPC you wish to add the NAT Gateway.
Source              = PATH to the module.
vpc_cidr            = CIDR range for existing target VPC.
public_subnet_cidr  = CIDR range for existing target public subnet.
private_subnet_cidr = CIDR range for existing target private subnet.
env                 = Target environemnet name for name tagging.
region              = Target AWS region for deployment.

```hcl
module "nat_gateway_deploy" {
  source              = "./alex-march-coding-test-module"
  vpc_cidr            = "172.31.0.0/16"
  public_subnet_cidr  = "172.31.0.0/20"
  private_subnet_cidr = "172.31.16.0/20"
  env                 = "dev"
  region              = "eu-west-2"
}
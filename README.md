# alex-march-coding-test-module

## Overview
This is a Terraform module for providing internet access to an existing VPC private subnet using a NAT Gateway. The module creates a NAT Gateway in an existing public subnet and modifies an existing private subnet's route table to route internet traffic through the NAT Gateway, enabling outbound internet access for resources within the private subnet.

- **`Elastic IP`**: A public IPv4 address that is used to provide consistent internet connectivity for a NAT Gateway in your AWS VPC.
- **`NAT Gateway`**: A service that allows resources in your private subnet to access the internet for outbound traffic, crucial for enabling updates and API calls while keeping the subnet secure from inbound traffic.
- **`Route Table Entry`**: A routing rule added to the private subnet's route table that directs outbound traffic to the NAT Gateway, enabling internet access from the private subnet.

This module is part of the **Platform Engineer Coding Test v1** for the 1st stage interview at Motilent.

## Usage
1. Place this module in your Terraform repository.
2. Reference this module in your Terraform configuration as shown below.

**Note**: The example below includes default values. Ensure you update these with the correct values for the VPC you wish to modify.

### Module Inputs
- **`source`**: Path to the module.
- **`vpc_cidr`**: CIDR range for the existing target VPC.
- **`public_subnet_cidr`**: CIDR range for the existing target public subnet.
- **`private_subnet_cidr`**: CIDR range for the existing target private subnet.
- **`env`**: Target environment name for tagging resources.
- **`region`**: Target AWS region for deployment.

### Example Code
```hcl
module "nat_gateway_deploy" {
  source              = "./alex-march-coding-test-module"
  vpc_cidr            = "172.31.0.0/16"
  public_subnet_cidr  = "172.31.0.0/20"
  private_subnet_cidr = "172.31.16.0/20"
  env                 = "dev"
  region              = "eu-west-2"
}

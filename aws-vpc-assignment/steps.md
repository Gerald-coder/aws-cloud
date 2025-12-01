### STEPS

1. vpc creation

- i created a vpc with two subnets. public and private. created route tables for both. created and attached an internet gateway to public subnet for internet access and attached a nat gateway to the public subnet so services and resources in the private ip can access the internet through an outbound only access
- created security group to allow http from anywhere and ssh from my ip
- create two ec2 instances. one in the public and one in the private instance, i was able to access the resources in the public subnet instance. but was ntot able to. for the private subnet instance

### Key differences between Security Groups and NACLs.

1. Security groups exist at the instance level.
2. NACLs exixts on the subnet level.

### Explanation of why private subnets + NAT are important for security.

1. priivate subnets + NAT are important for security because services and resources in the private subnet should not be accessible over the internet. but they are allow to have an outbound only (stateless) access to the internet for update and installations

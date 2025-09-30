# aws-cloud

# STEPS I TOOK

1. i created my IAM user through my aws root user console with programatic access
2. created an IAM group called Developers and gave it a AmazonS3ReadOnlyAccess policy.
3. added the user i created earlier to this group

4. configure aws cli on my linux machine. by first
   a. update my package repository with # sudo apt update
   b. then installing the aws cli with # sudo apt install -y awscli
5. then i configured my student user with the access key and secret key i created when i created the user.
6. used this command # aws sts get-caller-identity. to see the user i am currently using in my cli
7. used # aws s3 ls. to list the s3 buckets i have in aws
8. used # aws s3 mb s3://studentuser-assignment to created a new s3 bucket called studentuser-assignment
9. used # aws ec2 describe-instances to lists details about all your EC2 instances in the account/region you’re currently connected to.

10. created an IAM role, for ec2 with s3 read write access
11. attached the role to my running EC2 instance
12. synced folders from my local machine to my vagrant vm to be able to have access to the .pem file
13. ssh into the EC2 instance to test my read write access on s3 bucket

# CHALLENGIES FACED

1. configuring aws cli on linux: i had to make research on how to properly configire aws cli on linux or local machine
2. syncing my file from local to my vm where my EC2 is running via ssh. i had to go back to old videos of syncing folder in vagrant to revise and get back to it

# RESPONSIBILITY MODDEL

The IAM Shared Responsibility Model explains how security duties are divided between AWS and the customer. AWS is responsible for securing the underlying cloud infrastructure—this includes the physical hardware, data centers, global network, and foundational services like storage, compute, and networking. They ensure that the infrastructure is resilient, patched, and compliant with security standards.

On the other hand, the customer is responsible for security “in the cloud.” This means configuring IAM users, groups, roles, and policies correctly, managing access keys, enabling multi-factor authentication, and applying the principle of least privilege. Customers must secure their data, monitor activity with tools like CloudTrail, and ensure proper identity and access management. In short, AWS protects the infrastructure, while the customer protects how they use it.

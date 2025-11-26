# CloudFormation Project – README

## Steps I Followed

### 1. Created the CloudFormation Template

- Defined an **EC2 instance** using Amazon Linux 2.
- Added a **User Data script** to install and start Apache/Nginx and serve a simple HTML file.
- Created a **Security Group** allowing:
  - HTTP (80) from anywhere.
  - SSH (22) from my public IP (or 0.0.0.0/0 for testing).
- Added an **S3 bucket** with:
  - A unique bucket name.
  - **Versioning enabled**.

### 2. Deployed the Stack

- Uploaded the `infra-stack.yaml` file in CloudFormation Console.
- Clicked **Create Stack**.
- Waited for all resources to reach `CREATE_COMPLETE`.

### 3. Verified Resources

- Copied the EC2 **Public DNS** from CloudFormation Outputs.
- Opened it in the browser to confirm Apache/Nginx is running.
- Opened the S3 console to confirm the bucket exists.

---

## How I Tested EC2 and S3

### Testing EC2

1. Copied the EC2 Public DNS:
![alt text](image.png)
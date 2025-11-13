# Short Written Summary

## Steps Taken

1. **EBS Volume Creation and Mounting:**

   - Created a **5 GB EBS volume** in the same availability zone as my EC2 instance.
   - Attached the volume to the instance through the AWS Console.
   - Connected via SSH, formatted the disk using `sudo mkfs -t ext4 /dev/nvme1n1`, and mounted it to `/mnt/data`.
   - Verified the mount with `df -h`.

2. **EBS Snapshot:**

   - Created a **snapshot** of the mounted EBS volume and named it `MyDatabaseBackup` for easy identification and recovery.

3. **AMI Creation:**

   - Created a **custom AMI** from the running EC2 instance.
   - The AMI included all installed applications (Node.js, Nginx, and environment configurations) to enable quick redeployment.

4. **EFS Setup:**
   - Created an **EFS file system** in the same VPC and attached security groups allowing NFS (port 2049).
   - Installed EFS utilities (`amazon-efs-utils`) on EC2 and mounted the file system to `/mnt/efs`.
   - Created and verified a test file (`test.txt`) to confirm data sharing between instances.


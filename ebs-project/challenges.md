
## Challenges and Solutions

- **Mounting Errors:** Faced “permission denied” issues while mounting EFS. Solved by adjusting security group inbound rules to allow NFS traffic from EC2 instances.
- **Device Path Confusion:** Initially unsure of the correct EBS device name. Used `lsblk` to identify and confirm the right volume before formatting.
- **Persistence After Reboot:** The mount points were lost after reboot. Solved by adding entries to `/etc/fstab` for automatic remounting.

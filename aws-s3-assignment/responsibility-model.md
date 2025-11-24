## 3. Shared Responsibility Model (Storage)

### AWS Responsibilities

- Physical security of data centers.
- Durability and availability of S3 infrastructure.
- Maintaining hardware, networking, and scaling.
- Replication across AZs (for Standard classes).

### Customer Responsibilities

- Setting IAM permissions and bucket policies.
- Enabling versioning, replication, and encryption.
- Managing data lifecycle rules.
- Preventing public access misconfigurations.
- Choosing appropriate storage classes.


## Summary

This exercise covered S3 storage classes, enabling versioning, configuring replication, and understanding the shared responsibility model. AWS manages the infrastructure and durability, while you manage access control, configuration, and data protection.

## Shared Responsibility Model (EC2 Storage)

In AWS, storage security and management follow the **Shared Responsibility Model**:

- **AWS Responsibilities:**  
  AWS secures the **infrastructure layer**, including data centers, hardware, networking, and the durability of storage services like EBS, EFS.

- **Customer Responsibilities:**  
  The customer secures **data and configurations**, including encryption, IAM permissions, backups, and access control policies. It’s the customer’s duty to manage who can access stored data and how it’s used.

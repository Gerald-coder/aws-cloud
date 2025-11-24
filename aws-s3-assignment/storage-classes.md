# S3 Storage, Versioning & Replication – Summary

## 1. Storage Classes

### S3 Standard

- Default storage class for frequently accessed data.
- High durability and low latency.

### S3 Standard-IA

- Cheaper than Standard with a retrieval fee.
- Best for infrequently accessed data.

### S3 One Zone-IA

- Stores data in one Availability Zone.
- Lower cost but less resilient.

### S3 Glacier Instant Retrieval

- Very low-cost archive storage.
- Millisecond retrieval for archived data.

### S3 Glacier Flexible Retrieval

- Cheaper than Instant Retrieval.
- Retrieval time ranges from minutes to hours.

### S3 Glacier Deep Archive

- Lowest-cost storage tier.
- Hours-long retrieval, ideal for long-term compliance data.


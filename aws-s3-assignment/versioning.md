## 2. Steps for Versioning & Replication

### A. Enabling Versioning

1. Open the S3 Console and select the bucket.
2. Go to **Properties**.
3. Scroll to **Bucket Versioning** → **Edit**.
4. Enable versioning and save.

### B. Setting Up Cross-Region Replication (CRR)

1. Open the source bucket → **Management** → **Replication**.
2. Click **Create Replication Rule**.
3. Choose to replicate the entire bucket or a prefix.
4. Select a destination bucket in another region.
5. Allow AWS to create the required IAM role.
6. (Optional) Enable **Replicate existing objects**.
7. Save the rule.


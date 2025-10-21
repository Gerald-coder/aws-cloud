# **Task 7: Shared Responsibility Model for EC2**

## 🧠 Understanding the Concept

The **AWS Shared Responsibility Model** defines how security and compliance duties are divided between **AWS** and the **customer**.  
This model ensures that both parties understand their specific roles in maintaining a secure cloud environment.

---

## 🔒 What AWS Secures

AWS is responsible for **security of the cloud** — the underlying infrastructure that runs all AWS services.  
This includes:

- Physical data centers and hardware (servers, networking, and storage).
- The global AWS infrastructure (Regions, Availability Zones, and Edge Locations).
- The hypervisor and foundational software that hosts EC2 instances.
- Ensuring redundancy, physical access controls, and data center compliance.

In summary, AWS ensures that the **cloud itself** is secure and reliable.

---

## 🧑‍💻 What You (the Customer) Secure

As a customer, you are responsible for **security in the cloud** — the configurations and resources you deploy.  
This includes:

- Managing your **operating system** (updates, patches, and configurations).
- Securing your **applications and data** running inside EC2 instances.
- Managing **firewall settings** through Security Groups and Network ACLs.
- Controlling **user access and permissions** via IAM.
- Encrypting data and implementing backup or monitoring solutions as needed.

In essence, AWS provides the secure infrastructure, while you are responsible for securing what you run and store **within** it.

---

## ✅ Summary

The Shared Responsibility Model for EC2 ensures a balance of accountability:  
AWS handles the **foundation**, while customers manage their **instances, applications, and data**.  
By understanding and applying this model, organizations can build secure, scalable, and compliant cloud solutions on AWS.

---

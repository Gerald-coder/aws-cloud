# How Route 53, Load Balancer, and EC2 Work Together

## 📌 1. Route 53 (DNS Service)

Route 53 functions as the **DNS (Domain Name System) service**.  
Its role is to translate your domain name (e.g., `example.com`) into the Load Balancer’s underlying DNS name.

### What Route 53 Does:

- Maps your domain name to the ALB using an **A Record (Alias)**.
- Ensures users reach your application using a friendly domain.
- Does _not_ send traffic directly to EC2—only to the Load Balancer.

---

## 📌 2. Application Load Balancer (ALB)

The Load Balancer receives all traffic from Route 53 and distributes it across my EC2 instances.

### What the ALB Does:

- Balances requests between multiple EC2 instances.
- Performs **health checks** to ensure only healthy instances receive traffic.
- Increases availability and resilience.
- Acts as the middle layer between Route 53 and EC2.

---

## 📌 3. EC2 Instances (Web Servers)

The EC2 instances are my actual servers running Apache, Nginx, or any web application.

### Their Role:

- Serve the web pages or application responses.
- Handle traffic forwarded by the ALB.
- Can be scaled up/down depending on load.

---

### Full Traffic Flow

- User → Route 53 → Load Balancer → EC2 Instances

- User enters your domain name

- Route 53 resolves it to the Load Balancer

- The Load Balancer forwards the request to one of your EC2 instances

- The chosen EC2 instance serves the webpage back through the Load Balancer

User sees the website

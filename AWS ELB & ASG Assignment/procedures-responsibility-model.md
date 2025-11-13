# Load Balancer and Auto Scaling Group Setup

## Notes on Load Balancer Types

- **ALB (Application Load Balancer):** Operates at Layer 7 (HTTP/HTTPS). Supports advanced routing (path, host-based), SSL termination, and WebSocket connections. Ideal for web apps and APIs.
- **NLB (Network Load Balancer):** Operates at Layer 4 (TCP/UDP). Offers high performance, ultra-low latency, and preserves source IP. Best for non-HTTP workloads.
- **GLB (Gateway Load Balancer):** Operates at Layer 3 (IP). Routes traffic to virtual appliances like firewalls or intrusion detection systems.

---

## Steps to Configure ALB and ASG

1. **Prepare Instances:** Launch 2 Ubuntu EC2s, install Apache/Nginx, and set unique index pages.
2. **Create Target Group:** Use HTTP:80, register EC2s, and configure health checks (`/`).
3. **Create ALB:** Internet-facing, listener on port 80, attach target group, and ensure inbound HTTP allowed.
4. **Verify Health Checks:** Confirm instances show as healthy in the target group.
5. **Create Launch Template:** Define AMI, instance type, security group, and user-data for auto setup.
6. **Create ASG:** Attach launch template and ALB target group; set min=2, max=4, desired=2.
7. **Test:** Access ALB DNS name to confirm traffic alternates between servers.

---

## Explanation

- ALB routes traffic intelligently; ASG ensures automatic scaling and fault recovery.
- Health checks keep only healthy instances in rotation.
- Scaling policies maintain performance while reducing cost.
- Using multiple AZs improves fault tolerance.
- ALB centralizes access, enhances security, and simplifies scaling.

---

Launch EC2-1 with user-data Hello from EC2-1.

Launch EC2-2 with user-data Hello from EC2-2.

Create SG: SSH from my IP, HTTP and HTTPS from everywhere.

Create target group (HTTP:80) and add both instances.

Create ALB (internet-facing), attach target group, ensure ALB SG allows HTTP.

Create Route 53 hosted zone for domain.

Create Alias A to ALB.

Update registrar nameservers if needed.

Test domain in browser.

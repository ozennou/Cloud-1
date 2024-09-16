# Cloud-1

### Overview:
- The project is based on my previous project [Containerize-wordpress-infrastructure](https://github.com/ozennou/containerize-wordpress-infra). This project is a simple deployment of a WordPress infrastructure based on microservices (MariaDB, WordPress, Nginx, Redis-cache, Adminer) on GCP (Google Cloud Platform), using HashiCorp Terraform for deploying and describing the infrastructure.


    <img src="./resource/image.png" alt="arch" width="700" height="400">


### Infrastructure:
- **VPC Network and its Subnet**:
  - A Virtual Private Cloud (VPC) network is created to isolate the resources.
  - Subnets are defined within the VPC to organize and manage the network traffic efficiently.

- **Compute Instances**:
  - Multiple compute instances are deployed to host the microservices.
  - Each instance is configured with the necessary resources (CPU, memory, storage) to handle the workload.

- **Database**:
  - MariaDB is deployed as the database service.
  - The database instance is configured with persistent storage to ensure data durability.

- **Web Server**:
  - Nginx is used as the web server to serve the WordPress application.
  - It is configured to handle HTTPS requests and forward them to the appropriate backend services.

- **Caching**:
  - Redis is used as a caching layer to improve the performance of the WordPress application.
  - It helps in reducing the load on the database by caching frequently accessed data.

- **Adminer**:
  - Adminer is deployed as a database management tool.
  - It provides a web-based interface for managing the MariaDB database.

- **Security**:
  - Firewall rules are configured to control the inbound and outbound traffic.

- **Monitoring and Logging**:
  - Google Cloud Monitoring and Logging are used to monitor the health and performance of the infrastructure.

### Deployment:
- **Terraform**:
  - In terraform learing journey, I read the official documentation and also [Terraform Up and Running](./Terraform%20Up%20and%20Running%20Writing%20Infrastructure%20as%20Code,%203rd%20Edition%20(Yevgeniy%20Brikman)%20(Z-Library).pdf) of Yevgeniy Brikman.  
  - HashiCorp Terraform is used to define and provision the infrastructure as code.
  - The Terraform configuration files describe the resources and their dependencies.
  - Terraform commands are used to plan and apply the configuration to create the infrastructure.

### Conclusion:
- This project demonstrates the deployment of a WordPress infrastructure on GCP using Terraform.
- It showcases the use of microservices, VPC networks, and other cloud resource

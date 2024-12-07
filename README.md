# Shopping Cart Application DevOps

This project demonstrates the implementation of a CI/CD pipeline for a Shopping Cart Application using modern DevOps tools and methodologies.

## **Process Overview**
- **Source Code Management**: Code changes are committed to Git, triggering the CI/CD pipeline.
- **Build and Test**:
  - Source code is assembled using Maven.
  - Unit tests are executed to ensure code reliability and functionality.
- **Code Quality Analysis**:
  - SonarQube performs a comprehensive code quality check.
  - Identifies and eliminates code vulnerabilities, enhancing security and maintainability.
- **Dependency Vulnerability Scanning**:
  - OWASP Dependency-Check scans for vulnerabilities in third-party components and libraries.
  - Ensures potential risks from dependencies are mitigated.
- **Artifact Packaging**:
  - Maven builds and packages the application and its dependencies into a distributable artifact.
- **Artifact Repository Management**:
  - Packaged artifacts are securely stored in Nexus Repository Manager for efficient build artifact management.
- **Containerization**:
  - A Docker image is created from the bundled artifact.
  - Aqua Trivy scans the Docker image for vulnerabilities to identify and resolve any security issues before deployment.
- **Deployment**:
  - The Docker image is deployed to an AWS Kubernetes cluster.
  - Cloud deployment ensures efficient and scalable application management.

## **Project Goals**
- Integrate **DevOps principles and tools** to develop a secure, continuously deployable cloud-based application.
- Demonstrate the effectiveness of **modern DevOps practices** in enhancing security, reliability, and scalability.

---

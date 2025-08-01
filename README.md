# Next.js Portfolio on AWS with Terraform

This project serves as a practical example of deploying a static Next.js web application to the AWS Cloud using Infrastructure as Code (IaC) principles with Terraform.

The application is hosted on **AWS S3** and globally distributed and secured via **AWS CloudFront**.

## Tech Stack

* **Framework:** Next.js
* **Infrastructure as Code:** Terraform
* **Cloud Provider:** AWS
    * **Hosting:** S3 (Simple Storage Service)
    * **CDN & SSL:** CloudFront
    * **Access Management:** IAM (Identity and Access Management)

## Project Structure

* `/` (root) - Contains the Next.js application.
* `/terraform` - Contains all the Terraform code for creating the AWS infrastructure.

## Running Locally

To run the application on your local machine:

1.  Install all dependencies:
    ```bash
    npm install
    ```
2.  Start the development server:
    ```bash
    npm run dev
    ```
    The application will be available at `http://localhost:3000`.

## Deployment Process (Step-by-Step)

The deployment consists of two main parts: provisioning the infrastructure and deploying the application.

### Part 1: Provisioning the Infrastructure (Terraform)

This step is performed only once, or whenever the infrastructure needs to be modified.

1.  **Configure AWS access** (only needed for the initial setup):
    ```bash
    aws configure
    ```
2.  **Navigate to the Terraform directory**:
    ```bash
    cd terraform
    ```
3.  **Initialize Terraform**:
    ```bash
    terraform init
    ```
4.  **Create an execution plan** (optional, but recommended):
    ```bash
    terraform plan
    ```
5.  **Apply the plan to create the infrastructure**:
    ```bash
    terraform apply
    ```

### Part 2: Deploying the Application (Next.js)

Repeat this step every time you want to publish a new version of the site.

1.  **Navigate to the project root directory** (if you're not already there):
    ```bash
    cd ..
    ```
2.  **Build the application for production.** This creates the `out` directory.
    ```bash
    npm run build
    ```
3.  **Synchronize the `out` directory** with your S3 bucket:
    ```bash
    aws s3 sync ./out s3://tomkewebsitebucket
    ```

After this step, the changes will be live on your CloudFront domain.

## Destroying the Infrastructure

**WARNING:** This command will permanently delete all the created resources on AWS. Use it when you want to tear down the project to avoid incurring costs.

1.  Navigate to the Terraform directory:
    ```bash
    cd terraform
    ```
2.  Run the destroy command:
    ```bash
    terraform destroy
    ```

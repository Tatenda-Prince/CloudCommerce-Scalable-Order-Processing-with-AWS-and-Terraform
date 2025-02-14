# CloudCommerce-Scalable-Order-Processing-with-AWS-and-Terraform

"Event-Driven E-Commerce

# Technical Architecture

![image_alt](https://github.com/Tatenda-Prince/CloudCommerce-Scalable-Order-Processing-with-AWS-and-Terraform/blob/f7dac1724ba050a46f4228a63c55f750f151cdef/img/Screenshot%202025-02-14%20092020.png)

## Project Overview

CloudCommerce is a serverless, event-driven order processing system built using AWS services and Terraform for Infrastructure as Code (IaC). The system efficiently manages e-commerce order workflows by leveraging AWS EventBridge for event-driven architecture, SQS for decoupled processing, SNS for customer notifications, and DynamoDB for order tracking.

## Project Objective Architecture

1.EventBridge: Captures new order events and routes them to the appropriate SQS queues.

2.SQS Queues: Manages order processing tasks for inventory validation, payment processing, and shipping.

3.AWS Lambda: Processes order-related tasks, updates order status, and interacts with DynamoDB.

4.DynamoDB: Stores order details and processing status.

5.SNS: Sends order confirmation messages to customers via email/SMS.

6.Terraform: Deploys and manages all AWS resources as Infrastructure as Code.


## Features

✅ Serverless architecture for scalability and cost efficiency

✅ Decoupled processing with SQS for better fault tolerance

✅ Event-driven design using EventBridge for real-time order handling

✅ Secure and scalable order storage with DynamoDB

✅ Automated customer notifications via SNS

✅ Infrastructure as Code (IaC) with Terraform

## Prerequisites

1.Personal AWS account with basic understanding of AWS and Python

2.AWS CLI configured with the required permissions

3.Terraform installed on your local machine

## Step 1: Clone the Repository

1.1.Clone this repository to your local machine

`git clone https://github.com/Tatenda-Prince/CloudCommerce-Scalable-Order-Processing-with-AWS-and-Terraform.git`

## Step : Run Terraform workflow to initialize, validate, plan then apply

2.1.In your local terraform visual code environment terminal, to initialize the necessary providers, execute the following command in your environment terminal —

`Terraform init`

Upon completion of the initialization process, a successful prompt will be displayed, as shown below.

![image_alt]()


2.2.Next, let’s ensure that our code does not contain any syntax errors by running the following command —

`Terraform validate`

The command should generate a success message, confirming that it is valid, as demonstrated below.


![image_alt]()

2.3.Let’s now execute the following command to generate a list of all the modifications that Terraform will apply. —

`Terraform plan`

![image_alt]()

The list of changes that Terraform is anticipated to apply to the infrastructure resources should be displayed. The “+” sign indicates what will be added, while the “-” sign indicates what will be removed.

2.4.Now, let’s deploy this infrastructure! Execute the following command to apply the changes and deploy the resources.

Note — Make sure to type “yes” to agree to the changes after running this command

`Terraform apply`

Terraform will initiate the process of applying all the changes to the infrastructure. Kindly wait for a few seconds for the deployment process to complete.

![image_alt]()

## Success!

The process should now conclude with a message indicating “Apply complete”, stating the total number of added, modified, and destroyed resources, accompanied by several resources.

![image_alt]()


## Step 3: Verify creation of AWS Lambda, AWS EventBridge, Amazon SNS and Amazon SQQ




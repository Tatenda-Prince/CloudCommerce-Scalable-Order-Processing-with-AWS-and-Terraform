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

```language
git clone https://github.com/Tatenda-Prince/CloudCommerce-Scalable-Order-Processing-with-AWS-and-Terraform.git
```

## Step : Run Terraform workflow to initialize, validate, plan then apply

2.1.In your local terraform visual code environment terminal, to initialize the necessary providers, execute the following command in your environment terminal —

```language
Terraform init
```

Upon completion of the initialization process, a successful prompt will be displayed, as shown below.

![image_alt](https://github.com/Tatenda-Prince/CloudCommerce-Scalable-Order-Processing-with-AWS-and-Terraform/blob/a930cd342016696264f9831307589c7d0fe77b2e/img/Screenshot%202025-02-14%20100443.png)


2.2.Next, let’s ensure that our code does not contain any syntax errors by running the following command —

```language
Terraform validate
```
The command should generate a success message, confirming that it is valid, as demonstrated below.


![image_alt](https://github.com/Tatenda-Prince/CloudCommerce-Scalable-Order-Processing-with-AWS-and-Terraform/blob/894a8ffd0c83fb2664cadd51e8f8b5e81f85077e/img/Screenshot%202025-02-14%20100505.png)

2.3.Let’s now execute the following command to generate a list of all the modifications that Terraform will apply. —

```language
Terraform plan
```

![image_alt](https://github.com/Tatenda-Prince/CloudCommerce-Scalable-Order-Processing-with-AWS-and-Terraform/blob/4adcc54b9bdea54bda3b820a15d8074cfa56e420/img/Screenshot%202025-02-14%20100603.png)

The list of changes that Terraform is anticipated to apply to the infrastructure resources should be displayed. The “+” sign indicates what will be added, while the “-” sign indicates what will be removed.

2.4.Now, let’s deploy this infrastructure! Execute the following command to apply the changes and deploy the resources.

Note — Make sure to type “yes” to agree to the changes after running this command

```language
Terraform apply
```
Terraform will initiate the process of applying all the changes to the infrastructure. Kindly wait for a few seconds for the deployment process to complete.

![image_alt](https://github.com/Tatenda-Prince/CloudCommerce-Scalable-Order-Processing-with-AWS-and-Terraform/blob/3561aeffb1fc58fd0ba21dafac0015d9d8bd0940/img/Screenshot%202025-02-14%20100704.png)

## Success!

The process should now conclude with a message indicating “Apply complete”, stating the total number of added, modified, and destroyed resources, accompanied by several resources.

![image_alt](https://github.com/Tatenda-Prince/CloudCommerce-Scalable-Order-Processing-with-AWS-and-Terraform/blob/82bba43bf5a46ef650003a0c92799bd0ef68b050/img/Screenshot%202025-02-14%20100742.png)


## Step 3: Verify creation of AWS Lambda, AWS EventBridge, Amazon SNS and Amazon SQS

3.1.In the AWS Management Console, head to the Amazon EventBridge dashboard and verify that the rule was successfully created.

![image_alt](https://github.com/Tatenda-Prince/CloudCommerce-Scalable-Order-Processing-with-AWS-and-Terraform/blob/c972f30db68cd31d9f81e7da808f81601f940151/img/Screenshot%202025-02-14%20101240.png)


3.2.In the AWS Management Console, head to the Amazon SQS dashboard and verify that the OrderQueue was successfully created.

![image_alt](https://github.com/Tatenda-Prince/CloudCommerce-Scalable-Order-Processing-with-AWS-and-Terraform/blob/0fbaaa2fbde6c7648cafe40faa09c7c2990a1dc3/img/Screenshot%202025-02-14%20101332.png)


3.3.In the AWS Management Console, head to the Amazon Lambda dashboard and verify that the Order Function was successfully created

![image_alt](https://github.com/Tatenda-Prince/CloudCommerce-Scalable-Order-Processing-with-AWS-and-Terraform/blob/417e3ce444c6f29a8def17051ae4e85f35a24e8a/img/Screenshot%202025-02-14%20101423.png)


3.4.In the AWS Management Console, head to the Amazon DynamoDB dashboard and verify that the Order Table was successfully created

![image_alt]()


3.5.In the AWS Management Console, head to the Amazon SNS dashboard and verify that the Order Topic was successfully created and head to your local email and confirm the subscription

![image_alt]()










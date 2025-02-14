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





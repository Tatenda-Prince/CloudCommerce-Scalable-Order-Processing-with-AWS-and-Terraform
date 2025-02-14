provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

# Create DynamoDB Table
resource "aws_dynamodb_table" "orders" {
  name           = "Orders"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "OrderId"

  attribute {
    name = "OrderId"
    type = "S"
  }
}

# Create SQS Queue
resource "aws_sqs_queue" "order_processing_queue" {
  name = "OrderProcessingQueue"
}

# Create SNS Topic
resource "aws_sns_topic" "order_notifications" {
  name = "OrderNotifications"
}

# Create SNS Subscription (Email)
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.order_notifications.arn
  protocol  = "email"
  endpoint  = "moyot7663@gmail.com" # Replace with your email
}

# Create IAM Role for Lambda
resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Attach Policies to Lambda Role
resource "aws_iam_role_policy_attachment" "lambda_dynamodb" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

resource "aws_iam_role_policy_attachment" "lambda_sqs" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
}

resource "aws_iam_role_policy_attachment" "lambda_sns" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Create Lambda Function
resource "aws_lambda_function" "process_order" {
  function_name = "ProcessOrder"
 handler = "lambda_function.handler"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_role.arn

  filename         = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")

  environment {
    variables = {
      DYNAMODB_TABLE = aws_dynamodb_table.orders.name
      SQS_QUEUE_URL  = aws_sqs_queue.order_processing_queue.url
      SNS_TOPIC_ARN  = aws_sns_topic.order_notifications.arn
    }
  }
}

# Create EventBridge Rule
resource "aws_cloudwatch_event_rule" "order_event_rule" {
  name        = "OrderEventRule"
  description = "Trigger Lambda when an order is created"

  event_pattern = jsonencode({
    source      = ["ecommerce.orders"]
    detail-type = ["OrderCreated"]
  })
}

# Add Lambda as Target for EventBridge Rule
resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.order_event_rule.name
  target_id = "ProcessOrderLambda"
  arn       = aws_lambda_function.process_order.arn
}

# Allow EventBridge to Invoke Lambda
resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.process_order.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.order_event_rule.arn
}
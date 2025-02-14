import json
import boto3
import os

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['DYNAMODB_TABLE'])
sqs = boto3.client('sqs')
sns = boto3.client('sns')

def handler(event, context):
    # Save order to DynamoDB
    order_id = event['detail']['OrderId']
    table.put_item(Item=event['detail'])

    # Send message to SQS
    sqs.send_message(
        QueueUrl=os.environ['SQS_QUEUE_URL'],
        MessageBody=json.dumps(event['detail'])
    )

    # Publish notification to SNS
    sns.publish(
        TopicArn=os.environ['SNS_TOPIC_ARN'],
        Message=f"Order {order_id} has been processed."
    )

    return {
        'statusCode': 200,
        'body': json.dumps('Order processed successfully!')
    }

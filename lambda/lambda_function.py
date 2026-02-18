import json

def lambda_handler(event, context):
    for record in event['Records']:
        print("Image received:", record['s3']['object']['key'])
    return {
        'statusCode': 200,
        'body': json.dumps('Success')
    }

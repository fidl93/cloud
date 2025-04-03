import json
import boto3
import os
import datetime
import base64

# Cliente de S3
s3 = boto3.client("s3")

# Nombre del bucket S3 (cámbialo por el tuyo)
S3_BUCKET = "XXXXXXXXX"

def lambda_handler(event, context):
    try:
        if "body" not in event or not event["body"]:
            return {
                "statusCode": 400,
                "body": json.dumps({"error": "No file provided"})
            }

        timestamp = datetime.datetime.utcnow().strftime("%Y%m%d-%H%M%S")
        file_name = f"uploaded_file_{timestamp}.csv"
        file_content = base64.b64decode(event["body"]) #Decodificamos el base64

        #Interactiuamos con s3
        s3.put_object(Bucket=S3_BUCKET, Key=file_name, Body=file_content)

        return {
            "statusCode": 200,
            "body": json.dumps({"message": "File uploaded successfully"})
        }

    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"error": str(e)})
        }

import os

from google.oauth2 import service_account

# Get the service account key file path.
key_file_path = os.path.join(os.path.dirname(__file__), 'my-service-account.json')

# Create a service account object from the key file.
credentials = service_account.Credentials.from_service_account_file(key_file_path)

# Print the project ID.
print(credentials.project_id)

# List the buckets in the project.
buckets = storage.Client(credentials=credentials).buckets()
for bucket in buckets:
    print(bucket.name)

# Create a new Cloud Storage object.
object = storage.Blob('my-object', bucket='my-bucket', credentials=credentials)
object.upload_from_file('my-file.txt')

# Read the contents of the Cloud Storage object.
data = object.download_as_string()
print(data)

import functions_framework
from google.cloud import firestore
import json
import os
from datetime import datetime

# Initialize Firestore client
db = firestore.Client(database=os.environ.get('FIRESTORE_DATABASE'))

@functions_framework.http
def main(request):
    """HTTP Cloud Function to create a new document in Firestore.
    Args:
        request (flask.Request): The request object.
    Returns:
        The response text, or any set of values that can be turned into a
        Response object using `make_response`
    """

    # Set CORS headers for preflight requests
    if request.method == 'OPTIONS':
        headers = {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'POST',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Max-Age': '3600'
        }
        return ('', 204, headers)

    # Set CORS headers for the main request
    headers = {
        'Access-Control-Allow-Origin': '*'
    }

    try:
        # Parse request body
        request_json = request.get_json(silent=True)

        if not request_json:
            return (json.dumps({'error': 'No data provided'}), 400, headers)

        # Add timestamp
        request_json['created_at'] = datetime.utcnow()
        request_json['updated_at'] = datetime.utcnow()

        # Create document in Firestore
        doc_ref = db.collection('items').document()
        doc_ref.set(request_json)

        # Return created document with ID
        response_data = {
            'id': doc_ref.id,
            **request_json
        }

        # Convert datetime objects to strings for JSON serialization
        response_data['created_at'] = response_data['created_at'].isoformat()
        response_data['updated_at'] = response_data['updated_at'].isoformat()

        return (json.dumps(response_data), 201, headers)

    except Exception as e:
        return (json.dumps({'error': str(e)}), 500, headers)

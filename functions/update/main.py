import functions_framework
from google.cloud import firestore
import json
import os
from datetime import datetime

# Initialize Firestore client
db = firestore.Client(database=os.environ.get('FIRESTORE_DATABASE'))

@functions_framework.http
def main(request):
    """HTTP Cloud Function to update a document in Firestore.
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
            'Access-Control-Allow-Methods': 'PUT, PATCH',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Max-Age': '3600'
        }
        return ('', 204, headers)

    # Set CORS headers for the main request
    headers = {
        'Access-Control-Allow-Origin': '*'
    }

    try:
        # Get document ID from path
        path_parts = request.path.strip('/').split('/')
        doc_id = path_parts[-1] if len(path_parts) > 1 and path_parts[-1] else None

        if not doc_id:
            return (json.dumps({'error': 'Document ID is required'}), 400, headers)

        # Parse request body
        request_json = request.get_json(silent=True)

        if not request_json:
            return (json.dumps({'error': 'No data provided'}), 400, headers)

        # Check if document exists
        doc_ref = db.collection('items').document(doc_id)
        doc = doc_ref.get()

        if not doc.exists:
            return (json.dumps({'error': 'Document not found'}), 404, headers)

        # Update timestamp
        request_json['updated_at'] = datetime.utcnow()

        # Update document
        doc_ref.update(request_json)

        # Get updated document
        updated_doc = doc_ref.get()
        doc_data = updated_doc.to_dict()
        doc_data['id'] = doc_id

        # Convert datetime objects to strings
        if 'created_at' in doc_data:
            doc_data['created_at'] = doc_data['created_at'].isoformat()
        if 'updated_at' in doc_data:
            doc_data['updated_at'] = doc_data['updated_at'].isoformat()

        return (json.dumps(doc_data), 200, headers)

    except Exception as e:
        return (json.dumps({'error': str(e)}), 500, headers)

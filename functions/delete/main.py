import functions_framework
from google.cloud import firestore
import json
import os

# Initialize Firestore client
db = firestore.Client(database=os.environ.get('FIRESTORE_DATABASE'))

@functions_framework.http
def main(request):
    """HTTP Cloud Function to delete a document from Firestore.
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
            'Access-Control-Allow-Methods': 'DELETE',
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

        # Check if document exists
        doc_ref = db.collection('items').document(doc_id)
        doc = doc_ref.get()

        if not doc.exists:
            return (json.dumps({'error': 'Document not found'}), 404, headers)

        # Delete document
        doc_ref.delete()

        return (json.dumps({
            'message': 'Document deleted successfully',
            'id': doc_id
        }), 200, headers)

    except Exception as e:
        return (json.dumps({'error': str(e)}), 500, headers)

from functools import wraps
from flask import request, jsonify
from firebase_admin import auth

def verify_firebase_token(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        id_token = request.headers.get('Authorization')
        if not id_token:
            return jsonify({'error': 'Authorization header missing'}), 401
        try:
            decoded_token = auth.verify_id_token(id_token)
            uid = decoded_token['uid']
            return f(current_user=uid, *args, **kwargs)
        except Exception as e:
            return jsonify({'error': str(e)}), 401
    return decorated_function

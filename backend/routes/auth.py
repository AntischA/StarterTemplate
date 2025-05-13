from flask import Blueprint, request, jsonify
from firebase_admin import auth
from firebase_admin import firestore
from utils.auth_decorator import verify_firebase_token

auth_routes = Blueprint('auth_routes', __name__)
db = firestore.client()

@auth_routes.route('/login', methods=['POST'])
def login():
    id_token = request.json.get('idToken')
    try:
        decoded_token = auth.verify_id_token(id_token)
        uid = decoded_token['uid']
        user_doc = db.collection('users').document(uid).get()

        if not user_doc.exists:
            db.collection('users').document(uid).set({
                'email': decoded_token.get('email'),
                'createdAt': firestore.SERVER_TIMESTAMP,
            })

        return jsonify({'status': 'success', 'uid': uid}), 200
    except Exception as e:
        return jsonify({'status': 'error', 'message': str(e)}), 401

@auth_routes.route('/user_info', methods=['GET'])
@verify_firebase_token
def user_info(current_user):
    user_doc = db.collection('users').document(current_user).get()
    if user_doc.exists:
        return jsonify(user_doc.to_dict())
    return jsonify({'error': 'User not found'}), 404
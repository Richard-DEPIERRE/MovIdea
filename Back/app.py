import os
import hashlib
import uuid
import bcrypt
from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import load_only
from werkzeug.security import generate_password_hash, check_password_hash
from flask_marshmallow import Marshmallow

# Init app
app = Flask(__name__)
basedir = os.path.abspath(os.path.dirname(__file__))

# Database
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'db.sqlite')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Init db
db = SQLAlchemy(app)
# Init ma
ma = Marshmallow(app)

# User Class/Model
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100))
    email = db.Column(db.String(100))
    password = db.Column(db.String(128))

    def __init__(self, username, email, password):
        self.username = username
        self.email = email
        self.password = password

# User Schema
class UserSchema(ma.Schema):
    class Meta:
        fields = ('id', 'username', 'email', 'password')

# Init schema
user_schema = UserSchema()
users_schema = UserSchema(many=True)

# Create a User
@app.route('/user', methods=["POST"])
def add_user():
    username = request.json['username']
    email = request.json['email']
    password = request.json['password']
    hashed_password = generate_password_hash(password)

    new_user = User(username, email, hashed_password)
    
    db.session.add(new_user)
    db.session.commit()

    return user_schema.jsonify(new_user)

# Get all users
@app.route('/user', methods=["GET"])
def get_users():
    fields = ['username', 'email']
    all_users = User.query.options(load_only(*fields)).all()
    result = users_schema.dump(all_users)
    return jsonify(result)

# Get single user by id
@app.route('/user/<id>', methods=["GET"])
def get_user(id):
    user = User.query.get(id)
    return user_schema.jsonify(user)

# Get single user by username
@app.route('/username/<username>', methods=["GET"])
def get_user_by_username(username):
    user = User.query.filter_by(username=username).first()
    return user_schema.jsonify(user)

# Check password
@app.route('/password/<username>/<password>', methods=["GET"])
def check_password(username, password):
    user = User.query.filter_by(username=username).first()
    if check_password_hash(user.password, password):
        return jsonify({"check": True})
    else:
        return jsonify({"check": False}), 400

# Update a username
@app.route('/username/<email>', methods=["PUT"])
def update_username(email):
    user = User.query.filter_by(email=email).first()
    username = request.json['username']

    user.username = username
    db.session.commit()
    
    return user_schema.jsonify(user)


# Update a password
@app.route('/password/<email>', methods=["PUT"])
def update_password(email):
    user = User.query.filter_by(email=email).first()
    new_password = request.json['newPassword']
    old_password = request.json['oldPassword']

    if check_password_hash(user.password, old_password):
        user.password = generate_password_hash(new_password)
        db.session.commit()
        return user_schema.jsonify(user)
    return jsonify({"error": "password-no-match"})

# Delete user
@app.route('/user/<email>', methods=["DELETE"])
def delete_user(email):
    user = User.query.filter_by(email=email).first()
    password = request.json['password']
    if check_password_hash(user.password, password):
        db.session.delete(user)
        db.session.commit()
        return user_schema.jsonify(user)
    return jsonify({"error": "password-no-match"})

# Run Server
if __name__ == '__main__':
    app.run()
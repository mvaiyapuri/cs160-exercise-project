from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
#from flask_login import UserMixin
#from werkzeug.security import generate_password_hash, check_password_hash
#from flask_login import LoginManager
import os

app = Flask(__name__)
basedir = os.path.abspath(os.path.dirname(__file__))

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'db.sqlite')


# suppress SQLALCHEMY_TRACK_MODIFICATIONS warning
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

#login = LoginManager()
db = SQLAlchemy(app)
ma = Marshmallow(app)

#login.init_app(app)
#login.login_view = 'login'

class User(db.Model):
    __tablename__ = 'users'

    id = db.Column(db.Integer(), primary_key=True)
    username = db.Column(db.String(), unique=True)
    firstname = db.Column(db.String())
    lastname = db.Column(db.String())
    password = db.Column(db.String())
    dob = db.Column(db.String())
    height = db.Column(db.Float())
    weight = db.Column(db.Float())
    gender = db.Column(db.String())
    level = db.Column(db.String())
    #api_key = db.Column(db.String())

    def __init__(self, username, firstname, lastname, password, dob, height, weight, gender, level):
        #self.api_key = api_key
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.password = password
        self.dob = dob
        self.height = height
        self.weight = weight
        self.gender = gender
        self.level = level
        

    def __repr__(self):
        return '<id {}>'.format(self.id)

    def serialize(self):
        return {
            #'api_key' : self.api_key,
            'id' : self.id,
            'username' : self.username,
            'firstname' : self.firstname,
            'lastname' : self.lastname,
            'password' : self.password,
            'dob' : self.dob,
            'height' : self.height,
            'weight' : self.weight,
            'gender' : self.gender,
            'level'  : self.level
        }
    #def set_password(self, password):
        #self.password_hash = generate_password_hash(password)

    #def check_password(self, password):
        #return check_password_hash(self. password_hash, password)

#@login.user_loader
#def load_user(id):
#    return User.query.get(int(id))


# user schema
class UserSchema(ma.Schema):
    class Meta:
        fields = ('id', 'username', 'firstname', 'lastname', 'password', 'dob', 'height', 'weight', 'gender', 'level')


# Initialize schema
user_schema = UserSchema()

# Adds user to database if user doesn't exist
@app.route('/signup', methods=['POST'])
def add_user():
    tempUsername = request.json['username']
    username = User.query.filter_by(username=tempUsername).first()

    if username is None:
        firstname = request.json['firstname']
        lastname = request.json['lastname']
        password = request.json['password']
        dob = request.json['dob']
        height = request.json['height']
        weight = request.json['weight']
        gender = request.json['gender']
        level = request.json['level']

        new_user = User(tempUsername, firstname, lastname, password, dob, height, weight, gender, level)
        db.session.add(new_user)
        db.session.commit()

        id = new_user.id
        # Register successful
        return jsonify(new_user)

    else:
        return jsonify(["User Exists"])

# Checks if username and password matches
@app.route('/login', methods=['POST'])
def login():
    username = request.json['username']
    password = request.json['password']

    login = User.query.filter_by(username=username, password=password).first()

    if login is None:
        return jsonify(["Username and/or password is invalid"])

    else:
        # Login successful
        return user_schema.jsonify(login)

@app.route('/profile/<id>', methods=['GET'])
def get_user(id):
    user = User.query.get(id)

    return user_schema.jsonify(user)


@app.route('/profile/<id>', methods=['PUT', 'PATCH'])
def edit_user(id):
    user = User.query.get(id)
    user.username = request.json['username']
    user.firstname = request.json['firstname']
    user.lastname = request.json['lastname']
    user.password = request.json['password']
    user.dob = request.json['dob']
    user.height = request.json['height']
    user.weight = request.json['weight']
    user.gender = request.json['gender']
    user.level = request.json['level']
    db.session.commit()

    return user_schema.jsonify(user)


if __name__ == '__main__':
    app.run(debug=True)
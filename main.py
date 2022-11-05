from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
import os

app = Flask(__name__)
basedir = os.path.abspath(os.path.dirname(__file__))

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'db.sqlite')


# suppress SQLALCHEMY_TRACK_MODIFICATIONS warning
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)
ma = Marshmallow(app)


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

    def __init__(self, username, firstname, lastname, password, dob, height, weight):
        #self.api_key = api_key
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.password = password
        self.dob = dob
        self.height = height
        self.weight = weight
        

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
        }


# user schema
class UserSchema(ma.Schema):
    class Meta:
        fields = ('id', 'username', 'firstname', 'lastname', 'password', 'dob', 'height', 'weight', 'gender', 'level')


# Initialize schema
user_schema = UserSchema()


@app.route('/fitYou', methods=['POST'])
def add_user():
    username = request.json['username']
    firstname = request.json['firstname']
    lastname = request.json['lastname']
    password = request.json['password']
    dob = request.json['dob']
    height = request.json['height']
    weight = request.json['weight']

    new_user = User(username, firstname, lastname, password, dob, height, weight)
    db.session.add(new_user)
    db.session.commit()

    return user_schema.jsonify(new_user)


if __name__ == '__main__':
    app.run(debug=True)
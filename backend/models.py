from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy

ma = Marshmallow()
db = SQLAlchemy()

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
    api_key = db.Column(db.String())

    def __init__(self, api_key, username, firstname, lastname, password, dob, height, weight):
        self.api_key = api_key
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
            'api_key' : self.api_key,
            'id' : self.id,
            'username' : self.username,
            'firstname' : self.firstname,
            'lastname' : self.lastname,
            'password' : self.password,
            'dob' : self.dob,
            'height' : self.height,
            'weight' : self.weight,
        }

class Workout(db.Model):
    __tablename__ = 'workouts'

    id = db.Column(db.Integer(), primary_key=True)
    workoutname = db.Column(db.String(), unique=True)
    level = db.Column(db.String())
    description = db.Column(db.String())
    password = db.Column(db.String())
    dob = db.Column(db.String())
    height = db.Column(db.Float())
    weight = db.Column(db.Float())
    gender = db.Column(db.String())
    level = db.Column(db.String())
    api_key = db.Column(db.String())

    def __init__(self, api_key, workoutname, level, description):
        self.api_key = api_key
        self.workoutname = workoutname
        self.level = level
        self.description = description

        

    def __repr__(self):
        return '<id {}>'.format(self.id)

    def serialize(self):
        return {
            'api_key' : self.api_key,
            'id' : self.id,
            'workoutname' : self.workoutname,
            'level' : self.level,
            'description' : self.description,
        }

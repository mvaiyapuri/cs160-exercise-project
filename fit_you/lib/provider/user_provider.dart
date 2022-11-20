import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fit_you/models/User.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  //final url = 'http://localhost:5000/fitYou';
  final url = 'http://10.0.2.2:5000/';
  User _user = User(
      username: 'username',
      firstname: 'firstname',
      lastname: 'lastname',
      password: 'password',
      dob: 'dob',
      height: 0,
      weight: 0,
      gender: 'gender',
      level: 'level'
  );

  User get user{
    return _user;
  }

  set user (User newUser){
    _user = newUser;
  }

  Future<void> loginUser(String username, String password) async{
    Map<String, dynamic> request = {"username": username, "password": password};
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse('${url}login'), headers: headers, body: json.encode(request));
    Map<String, dynamic> responsePayload = json.decode(response.body);
    _user = User(
        username: responsePayload['username'],
        firstname: responsePayload['firstname'],
        lastname: responsePayload['lastname'],
        password: responsePayload['password'],
        dob: responsePayload['dob'],
        height: responsePayload['height'],
        weight: responsePayload['weight'],
        gender: responsePayload['gender'],
        level: responsePayload['level']
    );
    notifyListeners();
  }

  Future<void> addUser(String username, String firstname, String lastname, String password, String dob, double height, double weight, String gender, String level) async {

    Map<String, dynamic> request = {"username": username, "firstname": firstname, "lastname": lastname, "password": password, "dob": dob, "height": height, "weight": weight, "gender": gender, "level": level};
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse('${url}signup'), headers: headers, body: json.encode(request));
    Map<String, dynamic> responsePayload = json.decode(response.body);
    _user = User(
        username: responsePayload['username'],
        firstname: responsePayload['firstname'],
        lastname: responsePayload['lastname'],
        password: responsePayload['password'],
        dob: responsePayload['dob'],
        height: responsePayload['height'],
        weight: responsePayload['weight'],
        gender: responsePayload['gender'],
        level: responsePayload['level']
    );
    notifyListeners();
  }

  Future<void> get getUser async{
    var response;
    var userId = _user.id;
    try{
      response = await http.get(Uri.parse("${url}profile/$userId"));
      Map<String, dynamic> responsePayload = json.decode(response.body);
      _user = User(
          username: responsePayload['username'],
          firstname: responsePayload['firstname'],
          lastname: responsePayload['lastname'],
          password: responsePayload['password'],
          dob: responsePayload['dob'],
          height: responsePayload['height'],
          weight: responsePayload['weight'],
          gender: responsePayload['gender'],
          level: responsePayload['level']
      );
    }catch(e){
      print(e);
    }
    notifyListeners();
  }
}

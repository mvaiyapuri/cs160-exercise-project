import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fit_you/models/User.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  //final url = 'http://localhost:5000/fitYou';
  final url = 'http://10.0.2.2:5000/';
  late User _user;

  User get user{
    return _user;
  }

  Future<void> loginUser(String username, String password) async{
    Map<String, dynamic> request = {"username": username, "password": password};
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse(url + 'login'), headers: headers, body: json.encode(request));
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

  }

  Future<void> addUser(String username, String firstname, String lastname, String password, String dob, double height, double weight, String gender, String level) async {

    Map<String, dynamic> request = {"username": username, "firstname": firstname, "lastname": lastname, "password": password, "dob": dob, "height": height, "weight": weight, "gender": gender, "level": level};
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse(url + 'signup'), headers: headers, body: json.encode(request));
    Map<String, dynamic> responsePayload = json.decode(response.body);
    final user = User(
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
  }

  Future<void> getUser(dynamic id) async{
    var response;
    try{
      response = await http.get(Uri.parse(url + "profile/" + id.toString()));
      dynamic body = json.decode(response.body);
      _user = body.map((e) => User(
          username: e['username'],
          firstname: e['firstname'],
          lastname: e['lastname'],
          password: e['password'],
          dob: e['dob'],
          height: e['height'],
          weight: e['weight'],
          gender: e['gender'],
          level: e['level']
      ));
    }catch(e){
      print(e);
    }
    notifyListeners();
  }
}

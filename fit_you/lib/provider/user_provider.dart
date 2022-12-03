import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fit_you/models/User.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  //final url = 'http://localhost:5000/';
  final url = 'http://10.0.2.2:5000/';

  static User user = User(
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

  Future<User> loginUser(String username, String password) async{
    Map<String, dynamic> request = {"username": username, "password": password};
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse('${url}login'), headers: headers, body: json.encode(request));
    Map<String, dynamic> responsePayload = json.decode(response.body);
    //print("ID: " + responsePayload['id'].toString());
    //print("Username: " + responsePayload['username']);
    /*
    user = User(
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

     */
    user.id = responsePayload['id'];
    user.username = responsePayload['username'];
    user.firstname = responsePayload['firstname'];
    user.lastname = responsePayload['lastname'];
    user.password = responsePayload['password'];
    user.dob = responsePayload['dob'];
    user.height = responsePayload['height'];
    user.weight = responsePayload['weight'];
    user.gender = responsePayload['gender'];
    user.level = responsePayload['level'];
    print(user.password);
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', user.id);
    return user;
  }

  Future<User> addUser(String username, String firstname, String lastname, String password, String dob, double height, double weight, String gender, String level) async {

    Map<String, dynamic> request = {"username": username, "firstname": firstname, "lastname": lastname, "password": password, "dob": dob, "height": height, "weight": weight, "gender": gender, "level": level};
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse('${url}signup'), headers: headers, body: json.encode(request));
    Map<String, dynamic> responsePayload = json.decode(response.body);
    print(responsePayload['id']);
    print(responsePayload['password']);
    user = User(
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
    //id = user.id;
    print(user.password);
    notifyListeners();
    return user;
  }

  Future<User> get getUser async{
    var response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('id');
    //try{
      response = await http.get(Uri.parse("${url}profile/$userId"));
      Map<String, dynamic> responsePayload = json.decode(response.body);
    user = User(
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
    print(user.password);
    notifyListeners();
    return user;
  }
}

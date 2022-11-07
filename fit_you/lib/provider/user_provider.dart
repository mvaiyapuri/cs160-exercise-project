import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fit_you/models/User.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  //final url = 'http://localhost:5000/fitYou';
  final url = 'http://10.0.2.2:5000/fitYou';

  Future<void> addUser(String username, String firstname, String lastname, String password, String dob, double height, double weight, String gender, String level) async {

    Map<String, dynamic> request = {"username": username, "firstname": firstname, "lastname": lastname, "password": password, "dob": dob, "height": height, "weight": weight, "gender": gender, "level": level};
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse(url), headers: headers, body: json.encode(request));
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
}

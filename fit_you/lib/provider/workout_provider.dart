import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fit_you/models/Workout.dart';
import 'package:http/http.dart' as http;

class WorkoutProvider with ChangeNotifier {
  //final url = 'http://localhost:5000/';
  final url = 'http://10.0.2.2:5000/';

  static List<Workout> warmups = [];
  static List<Workout> mainworkouts = [];
  static List<Workout> cooldowns = [];
  static List<Workout> recreationals =[];

  Future<void> get getWarmups async{
    var response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('id');
    response = await http.get(Uri.parse('${url}warmup/$userId'));
    List<dynamic> body = json.decode(response.body);
    warmups = body.map((e) => Workout(
      id: e['id'], workoutname: e['workoutname'], level: e['level'], description: e['description'], workoutType: e['workoutType'], duration: e['duration']))
    .toList();
  }
}
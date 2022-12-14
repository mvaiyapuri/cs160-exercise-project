import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fit_you/models/Workout.dart';
import 'package:http/http.dart' as http;

class WorkoutProvider with ChangeNotifier {
  //final url = 'http://localhost:5000/';
  final url = 'http://10.0.2.2:5000/';

  static List<Workout> _warmups = [];
  static List<Workout> _mainworkouts = [];
  static List<Workout> _cooldowns = [];
  static List<Workout> _recreationals = [];
  static Workout workout = Workout(
    id: 'id',
    workoutname: 'workoutname',
    level: 'level',
    description: 'description',
    workoutType: 'workoutType',
    duration: 60
  );

  List<Workout> get warmups {
    return [..._warmups];
  }

  List<Workout> get mainworkouts {
    return [..._mainworkouts];
  }

  List<Workout> get cooldowns {
    return [..._cooldowns];
  }

  List<Workout> get recreationals {
    return [..._recreationals];
  }

  Future<Workout> get getWorkout async{
    var response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var workoutId = prefs.getInt('workoutid');
    print("ID RECIEVED: " + workoutId.toString());
    response = await http.get(Uri.parse('${url}workout/$workoutId'));
    Map<String, dynamic> responsePayload = json.decode(response.body);
    workout = Workout(
        id: responsePayload['id'],
        workoutname: responsePayload['workoutname'],
        level: responsePayload['level'],
        description: responsePayload['description'],
        workoutType: responsePayload['workoutType'],
        duration: responsePayload['duration']
    );
    print("ID RECIEVED: " + workout.id.toString());
    notifyListeners();
    return workout;
  }

  Future<void> get getWarmups async{
    var response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('id');
    response = await http.get(Uri.parse('${url}warmup/$userId'));
    List<dynamic> body = json.decode(response.body);
    _warmups = body.map((e) => Workout(
        id: e['id'], workoutname: e['workoutname'], level: e['level'], description: e['description'], workoutType: e['workoutType'], duration: e['duration']))
        .toList();
  }

  Future<void> get getMainWorkouts async{
    var response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('id');
    response = await http.get(Uri.parse('${url}mainWorkout/$userId'));
    List<dynamic> body = json.decode(response.body);
    _mainworkouts = body.map((e) => Workout(
        id: e['id'], workoutname: e['workoutname'], level: e['level'], description: e['description'], workoutType: e['workoutType'], duration: e['duration']))
        .toList();
  }

  Future<void> get getCooldowns async{
    var response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('id');
    response = await http.get(Uri.parse('${url}cooldown/$userId'));
    List<dynamic> body = json.decode(response.body);
    _cooldowns = body.map((e) => Workout(
        id: e['id'], workoutname: e['workoutname'], level: e['level'], description: e['description'], workoutType: e['workoutType'], duration: e['duration']))
        .toList();
  }

  Future<void> get getRecreations async{
    var response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('id');
    response = await http.get(Uri.parse('${url}recreation/$userId'));
    List<dynamic> body = json.decode(response.body);
    _recreationals = body.map((e) => Workout(
        id: e['id'], workoutname: e['workoutname'], level: e['level'], description: e['description'], workoutType: e['workoutType'], duration: e['duration']))
        .toList();
  }
}
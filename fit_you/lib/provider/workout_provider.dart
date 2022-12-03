import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fit_you/models/Workout.dart';
import 'package:http/http.dart' as http;

class WorkoutProvider with ChangeNotifier {
  //final url = 'http://localhost:5000/';
  final url = 'http://10.0.2.2:5000/';

  
}
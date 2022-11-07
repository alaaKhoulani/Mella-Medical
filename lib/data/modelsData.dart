
import 'package:flutter/material.dart';

class Pair {
  late bool b;
  late TimeOfDay t;
}

class Doctor {
  late int id;
  late String name, description, sr;
  late TimeOfDay startTime, endTime;
  late List<Pair> times;
  /*Doctor(
      {required this.id,
      required this.name,
      required this.description,
      required this.sr,
      required this.StartTime,
      required this.EndTime});
    */
  Doctor.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.description = json['description'];
    this.sr = json['sr'];
    this.startTime = json['startTime'];
    this.endTime = json['endTime'];
    //this.times = json[''];
  }
}

class MedicineData {
  final int id;
  final String name;
  List<TimeOfDay> listTime = [];
  String note;
  MedicineData(this.id, this.name, this.note);
}

class UserData {
  final String name, phone, password;
  UserData({required this.name, required this.phone, required this.password});
}

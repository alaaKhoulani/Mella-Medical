import 'package:flutter/material.dart';
import 'package:medical/data/Catdata.dart';
import 'package:provider/provider.dart';
import 'data/modelsData.dart';

class MyProvider with ChangeNotifier {
  late UserData user;
  //-----------------USer Information
  String gender = "not detecte yet";
  String blood = "...";
  Map<String, double> inputNumber = {
    "age": 30.0,
    "height": 160.0,
    "weight": 50.0,
  };
  /////--------------Doctors Screens-------------
  int SelectedCategoty = 0;
  late Doctor selectedDoctor;
  int SelectedDay = -1;
  int curentScreen = 2;
  List<Doctor> CurrentDoctors = [];

  /////----------------Medicine-------------
  int SelectedMedicinID = -1;
  int numberOfDate = 1;
  List<TimeOfDay> ListOfTime = [];
  List<MedicineData> ListOfMedicine = [];

  bool addMedicine(String name, String note) {
    bool ok = false;
    if (SelectedMedicinID != -1) {
      ListOfMedicine.add(
          MedicineData(SelectedMedicinID, name.toString(), note.toString()));
      ListOfMedicine[ListOfMedicine.length - 1].listTime.addAll(ListOfTime);
      ListOfTime.clear();
      ok = true;
    }
    notifyListeners();
    return ok;
  }

  TimeOfDay selectedTime = TimeOfDay(hour: 0, minute: 0);

  selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      //initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      selectedTime = timeOfDay;
      ListOfTime.add(selectedTime);
      notifyListeners();
    }
  }

  addTime(TimeOfDay x) {
    ListOfTime.add(x);
    notifyListeners();
  }

  setMedicinId(int x) {
    SelectedMedicinID = x;
    notifyListeners();
  }

  int setScreen(int x) {
    curentScreen = x;
    notifyListeners();
    return x;
  }

  setSelectedDay(int x) {
    SelectedDay = x;
    notifyListeners();
  }

  setSelectedDoctor(Doctor x) {
    selectedDoctor = x;
    notifyListeners();
  }

  setCategory(int x) {
    SelectedCategoty = x;
    CurrentDoctors.clear();
    //CurrentDoctor.addAll( AllDoctors['1']);
    notifyListeners();
  }

  increas(String key, double maxx) {
    double? x = inputNumber[key]! + 1;
    if (x <= maxx) {
      inputNumber[key] = inputNumber[key]! + 1;
    }
    notifyListeners();
  }

  decrease(String key, double minn) {
    double? x = inputNumber[key]! - 1;
    if (x >= minn) {
      inputNumber[key] = inputNumber[key]! - 1;
    }
    notifyListeners();
  }

  void SetBlood(String x) {
    blood = x;
    notifyListeners();
  }

  void setGender(String x) {
    gender = x;
    notifyListeners();
  }

  setUser(String name, String phon, String pass, String confPass) {
    if (name.isNotEmpty &&
        phon.isNotEmpty &&
        phon.isNotEmpty &&
        pass.isNotEmpty &&
        confPass.isNotEmpty) {
      user = UserData(name: name, phone: phon, password: pass);
      return true;
    }
    return false;
  }

  resetInfo() {
    gender = '...';
    gender = "not detecte yet";
    inputNumber["age"] = 30;
    inputNumber["height"] = 60;
    inputNumber["weight"] = 50;
  }

  remove(int id) {
    ListOfMedicine.removeAt(id);
    notifyListeners();
  }

  var AllDoctors = {
    'key': [
      {
        'id': 0,
        'name': "Neil	Vaughan",
        'description': "description",
        'sr': "Otolaryngologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      
      {
        'id': 1,
        'name': "Jason	Graham",
        'description': "description",
        'sr': "Cardiologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 2,
        'name': "Alexander	Powell",
        'description': "description",
        'sr': "Pediatricians",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 3,
        'name': "Emma	Wallace",
        'description': "description",
        'sr': "Nephrologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
       {
        'id': 4,
        'name': "Bella	Watson",
        'description': "description",
        'sr': "Dermatologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 5,
        'name': "Lily	Terry",
        'description': "description",
        'sr': "Ophthalmologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 6,
        'name': "Wendy	Buckland",
        'description': "description",
        'sr': "Gastroenterologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 7,
        'name': "Angela	Cornish",
        'description': "description",
        'sr': "",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 8,
        'name': "Anna	Wallace",
        'description': "description",
        'sr': "Otolaryngologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 9,
        'name': "Katherine	MacLeod",
        'description': "description",
        'sr': "Cardiologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 10,
        'name': "Edward	McLean",
        'description': "description",
        'sr': "Pediatricians",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 11,
        'name': "James	Abraham",
        'description': "description",
        'sr': "Nephrologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 12,
        'name': "Anne	Butler",
        'description': "description",
        'sr': "Dermatologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 13,
        'name': "Ali Abd1",
        'description': "description",
        'sr': "Ophthalmologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 14,
        'name': "Stephen	Kerr",
        'description': "description",
        'sr': "Gastroenterologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
       {
        'id': 15,
        'name': "Wendy	Parsons",
        'description': "description",
        'sr': "Otolaryngologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 16,
        'name': "Ali Abd1",
        'description': "description",
        'sr': "Cardiologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 17,
        'name': "Maria	Poole",
        'description': "description",
        'sr': "Pediatricians",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 18,
        'name': "Lisa	Henderson",
        'description': "description",
        'sr': "Gastroenterologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 19,
        'name': "Nicholas	Buckland",
        'description': "description",
        'sr': "",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 20,
        'name': "Connor	Scott",
        'description': "description",
        'sr': "Otolaryngologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 21,
        'name': "David	Mackenzie",
        'description': "description",
        'sr': "Cardiologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 22,
        'name': "Lucas Arnold",
        'description': "description",
        'sr': "Pediatricians",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 23,
        'name': "William	Hill",
        'description': "description",
        'sr': "",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 24,
        'name': "Matt	Miller",
        'description': "description",
        'sr': "Otolaryngologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
      {
        'id': 25,
        'name': "Matt Arnold",
        'description': "description",
        'sr': "Cardiologists",
        'startTime': TimeOfDay(hour: 8, minute: 0),
        'endTime': TimeOfDay(hour: 15, minute: 0)
      },
    ]
  };
/*
  Map<int, List<Doctor>> AllDoctors = {
  1: [
    Doctor(
        id: 1,
        name: "Ali Abd1",
        description: "description",
        sr: "sr",
        startTime: TimeOfDay(hour: 8, minute: 0),
        endTime: TimeOfDay(hour: 15, minute: 0)),
    Doctor(
        id: 2,
        name: "Ali Abd2",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
    Doctor(
        id: 3,
        name: "Ali Abd3",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
    Doctor(
        id: 4,
        name: "Ali Abd4",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
  ],
  2: [
    Doctor(
        id: 5,
        name: "Ali Abd5",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
    Doctor(
        id: 6,
        name: "Ali Abd6",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
    Doctor(
        id: 7,
        name: "Ali Abd7",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
    Doctor(
        id: 8,
        name: "Ali Abd8",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
  ],
  3: [
    Doctor(
        id: 9,
        name: "Ali Abd9",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
    Doctor(
        id: 10,
        name: "Ali Abd10",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
    Doctor(
        id: 11,
        name: "Ali Abd11",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
  ],
  4: [
    Doctor(
        id: 12,
        name: "Ali Abd12",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
    Doctor(
        id: 13,
        name: "Ali Abd13",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
  ],
  5: [
    Doctor(
        id: 14,
        name: "Ali Abd14",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
    Doctor(
        id: 15,
        name: "Ali Abd15",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
    Doctor(
        id: 16,
        name: "Ali Abd16",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
    Doctor(
        id: 17,
        name: "Ali Abd17",
        description: "description",
        sr: "sr",
        StartTime: TimeOfDay(hour: 8, minute: 0),
        EndTime: TimeOfDay(hour: 15, minute: 0)),
  ],
};*/
}

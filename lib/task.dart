import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String title;
  String description;
  DateTime dueDate;
  bool isMarked;
  DateTime? dateMarked;

  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    this.isMarked = false,
    this.dateMarked,
  });

  bool isAbove(Task t) {
    if (!isMarked && t.isMarked) return true;
    if (isMarked && !t.isMarked) return false;

    return dueDate.isBefore(t.dueDate);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['description'] = description;
    data['dueDate'] = dueDate;
    data['isMarked'] = isMarked;
    data['dateMarked'] = dateMarked;
    return data;
  }

  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      description: json['description'],
      dueDate: json['dueDate'].toDate(),
      isMarked: json['isMarked'],
      dateMarked:
          json['dateMarked'] != null ? json['dateMarked'].toDate() : null,
    );
  }
}

Future<void> addTask(Task t) async {
  CollectionReference taskList = FirebaseFirestore.instance.collection('Tasks');

  await taskList
      .add(t.toJson())
      .then((value) => print("Task Added"))
      .catchError((error) => print("Failed to add task: $error"));
}

import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

class TasksRepository {
  final DatabaseReference _tasksRef = FirebaseDatabase.instance.ref().child('tasks');

  Stream<List<String>> get tasksStream {
    return _tasksRef.onValue.map((DatabaseEvent event) {
      final snapshot = event.snapshot;
      if (snapshot.value != null && snapshot.value is Map) {
        final data = Map<dynamic, dynamic>.from(snapshot.value as Map);
        return data.entries.map((e) => e.value.toString()).toList();
      } else {
        return <String>[];
      }
    });
  }
}

import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:pondo_flutter_intro/feature/task/model/task_model.dart';

class TasksRepository {
  final DatabaseReference _tasksRef = FirebaseDatabase.instance.ref().child('tasks');

  Stream<List<TaskModel>> get tasksStream {
    try {
      return _tasksRef.onValue.map((DatabaseEvent event) {
        final snapshot = event.snapshot;
        if (snapshot.value != null && snapshot.value is Map) {
          final data = Map<dynamic, dynamic>.from(snapshot.value as Map);
          return data.entries.map((e) {
            final valueMap = Map<String, dynamic>.from(e.value as Map);
            return TaskModel.fromJson(valueMap);
          }).toList();
        } else {
          return <TaskModel>[];
        }
      });
    } catch (e) {
      print(e);
      return Stream.empty();
    }
  }
}

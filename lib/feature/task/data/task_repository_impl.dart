import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:pondo_flutter_intro/feature/task/data/dto/task_create_dto.dart';
import 'package:pondo_flutter_intro/feature/task/data/task_repository.dart';
import 'package:pondo_flutter_intro/feature/task/model/task_complete_status.dart';
import 'package:pondo_flutter_intro/feature/task/model/task_model.dart';

class TasksRepositoryImpl implements TasksRepository {
  final DatabaseReference _tasksRef = FirebaseDatabase.instance.ref().child('tasks');

  @override
  Stream<List<TaskModel>> get tasksStream {
    try {
      return _tasksRef.onValue.map((DatabaseEvent event) {
        final snapshot = event.snapshot;
        if (snapshot.value != null && snapshot.value is Map) {
          final data = Map<dynamic, dynamic>.from(snapshot.value as Map);
          return data.entries.map((e) {
            final valueMap = Map<String, dynamic>.from(e.value as Map);
            valueMap.putIfAbsent('id', () => '${e.key}');
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

  @override
  Future<void> createTask({
    required String title,
    String? description,
  }) async {
    final dto = TaskCreateDto(
      title: title,
      description: description,
      status: TaskCompleteStatus.pending,
    );

    try {
      await _tasksRef.push().set(dto.toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> updateTaskStatus({
    required String taskId,
    required TaskCompleteStatus status,
  }) async {
    try {
      await _tasksRef.child(taskId).update({'status': status.index});
    } catch (e) {
      print(e);
    }
  }
}

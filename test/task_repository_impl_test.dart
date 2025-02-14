import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:pondo_flutter_intro/feature/task/data/task_repository_impl.dart';
import 'package:pondo_flutter_intro/feature/task/model/task_complete_status.dart';

void main() {
  late DatabaseReference databaseReference;
  late DatabaseReference tasksRef;
  late TasksRepositoryImpl tasksRepository;

  setUp(() {
    setupFirebaseMocks();
    MockFirebaseDatabase.setDataPersistenceEnabled(enabled: false);
    databaseReference = MockFirebaseDatabase.instance.ref();
    tasksRef = databaseReference.child('tasks');
    tasksRepository = TasksRepositoryImpl(tasksRef: tasksRef);
  });

  group('TasksRepositoryImpl', () {
    test('tasksStream возвращает пустой список, если задач нет', () async {
      final tasks = await tasksRepository.tasksStream.first;
      expect(tasks, isEmpty);
    });

    test('createTask создает новую задачу в базе данных', () async {
      const title = 'Test Task';
      const description = 'Task Description';

      await tasksRepository.createTask(title: title, description: description);

      final snapshot = await tasksRef.get();
      expect(snapshot.value, isNotNull);

      final Map<dynamic, dynamic> tasksMap = snapshot.value as Map<dynamic, dynamic>;
      expect(tasksMap.length, equals(1));

      final taskData = tasksMap.values.first as Map<dynamic, dynamic>;
      expect(taskData['title'], equals(title));
      expect(taskData['description'], equals(description));
      expect(taskData['status'], equals(TaskCompleteStatus.pending.index));
    });

    test('tasksStream возвращает созданные задачи', () async {
      const title = 'Stream Task';
      const description = 'Stream Task Description';

      expect(await tasksRepository.tasksStream.first, isEmpty);

      await tasksRepository.createTask(title: title, description: description);

      await Future.delayed(const Duration(milliseconds: 100));

      final tasksList = await tasksRepository.tasksStream.first;
      expect(tasksList, isNotEmpty);
      expect(tasksList.length, equals(1));

      final task = tasksList.first;
      expect(task.title, equals(title));
      expect(task.description, equals(description));
      expect(task.status, equals(TaskCompleteStatus.pending));
      expect(task.id, isNotEmpty);
    });

    test('updateTaskStatus обновляет статус существующей задачи', () async {
      final newTaskRef = tasksRef.push();
      final taskId = newTaskRef.key!;
      final initialData = {
        'title': 'Task to Update',
        'description': 'Initial description',
        'status': TaskCompleteStatus.pending.index,
      };
      await newTaskRef.set(initialData);

      await tasksRepository.updateTaskStatus(taskId: taskId, status: TaskCompleteStatus.completed);

      final updatedSnapshot = await tasksRef.child(taskId).get();
      final updatedData = updatedSnapshot.value as Map<dynamic, dynamic>;
      expect(updatedData['status'], equals(TaskCompleteStatus.completed.index));
    });
  });
}

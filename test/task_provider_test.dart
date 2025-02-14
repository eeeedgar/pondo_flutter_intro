import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pondo_flutter_intro/feature/task/data/task_repository.dart';
import 'package:pondo_flutter_intro/feature/task/model/task_complete_status.dart';
import 'package:pondo_flutter_intro/feature/task/model/task_model.dart';
import 'package:pondo_flutter_intro/feature/task/provider/task_list_provider.dart'; // Предполагается, что TasksProvider здесь

class FakeTasksRepository implements TasksRepository {
  final StreamController<List<TaskModel>> _controller = StreamController<List<TaskModel>>.broadcast();

  bool createTaskCalled = false;
  bool updateTaskStatusCalled = false;

  @override
  Stream<List<TaskModel>> get tasksStream => _controller.stream;

  void addTasks(List<TaskModel> tasks) {
    _controller.add(tasks);
  }

  @override
  Future<void> createTask({required String title, String? description}) async {
    createTaskCalled = true;
  }

  @override
  Future<void> updateTaskStatus({
    required String taskId,
    required TaskCompleteStatus status,
  }) async {
    updateTaskStatusCalled = true;
  }

  void dispose() {
    _controller.close();
  }
}

void main() {
  group('TasksProvider Widget Tests', () {
    late FakeTasksRepository fakeTasksRepository;

    setUp(() {
      fakeTasksRepository = FakeTasksRepository();
    });

    tearDown(() {
      fakeTasksRepository.dispose();
    });

    testWidgets('TasksProvider updates task list on repository stream update', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TasksProvider(
            tasksRepository: fakeTasksRepository,
            child: Builder(
              builder: (context) {
                final provider = TasksProvider.of(context);
                return Text(
                  'Tasks count: ${provider.tasks.length}',
                  textDirection: TextDirection.ltr,
                );
              },
            ),
          ),
        ),
      );

      expect(find.text('Tasks count: 0'), findsOneWidget);

      final newTasks = [
        TaskModel(
          id: '1',
          title: 'Task 1',
          description: 'Description 1',
          status: TaskCompleteStatus.pending,
        ),
        TaskModel(
          id: '2',
          title: 'Task 2',
          description: 'Description 2',
          status: TaskCompleteStatus.completed,
        ),
      ];
      fakeTasksRepository.addTasks(newTasks);

      await tester.pumpAndSettle();

      expect(find.text('Tasks count: 2'), findsOneWidget);
    });

    testWidgets('Method createTask calls createTask in a repository', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TasksProvider(
            tasksRepository: fakeTasksRepository,
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    TasksProvider.of(context).createTask(title: 'New Task', description: 'New Desc');
                  },
                  child: const Text('Create Task'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(fakeTasksRepository.createTaskCalled, isTrue);
    });

    testWidgets('Method updateTaskStatus calls updateTaskStatus in a repository', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TasksProvider(
            tasksRepository: fakeTasksRepository,
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    TasksProvider.of(context).updateTaskStatus(
                      taskId: '1',
                      status: TaskCompleteStatus.completed,
                    );
                  },
                  child: const Text('Update Task'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(fakeTasksRepository.updateTaskStatusCalled, isTrue);
    });
  });
}

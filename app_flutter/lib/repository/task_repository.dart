import 'dart:convert';

import 'package:app_flutter/http/http_client.dart';
import 'package:app_flutter/models/task_model.dart';

abstract class ITaskRepository {
  Future<List<TaskModel>> getTasks();
  //Future<void> addTask(Task task);
  //Future<void> updateTask(Task task);
  //Future<void> deleteTask(Task task);
}

class TaskRepository implements ITaskRepository {
  final IHttpClient client;

  TaskRepository({required this.client});

  @override
  Future<List<TaskModel>> getTasks() async {
    final response = await client.get(url: 'http://localhost:8000/getTasks/1');

    if (response.statusCode == 200) {
      final List<TaskModel> tasks = [];
      final body = jsonDecode(response.body);
      body.map((item) {
        final TaskModel task = TaskModel.fromMap(item);
        tasks.add(task);
      }).toList();
      return tasks;
      } else {
      throw Exception('Failed to load tasks');
    }
    }

  }



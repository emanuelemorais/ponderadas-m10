import 'package:app_flutter/models/task_model.dart';
import 'package:app_flutter/repository/task_repository.dart';
import 'package:flutter/material.dart';

class TaskStore{

  final ITaskRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<TaskModel>> state = ValueNotifier<List<TaskModel>>([]);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  TaskStore({required this.repository});

  Future getTasks() async {
    isLoading.value = true;

    try{
      final result = await repository.getTasks();
      state.value = result;
    } catch(e){
      error.value = 'Erro ao carregar tarefas';
    } finally {
      isLoading.value = false;
    }
  }
}
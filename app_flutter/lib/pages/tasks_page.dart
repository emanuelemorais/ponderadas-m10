import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/tasks_session.dart';
import 'package:app_flutter/widgets/new_task_widget.dart';
import 'package:app_flutter/models/task_model.dart';
import 'package:app_flutter/services/get_tasks.dart';

class PageTasks extends StatefulWidget {
  final String token;

  const PageTasks({
    Key? key,
    required this.token
  }) : super(key: key);

  @override
  _PageTasksState createState() => _PageTasksState();
}

class _PageTasksState extends State<PageTasks> {
  late Future<List<TaksModel>> futureTasks = getTasks(widget.token);

  Future<void> refreshTasks() async {
    setState(() {
      futureTasks = getTasks(widget.token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 0,
              child: SingleChildScrollView(
                child: NewTask(
                  token: widget.token,
                  refreshTasks: refreshTasks,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "My tasks",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TasksSession(
                token: widget.token,
                futureTasks: futureTasks,
                refreshTasks: refreshTasks,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

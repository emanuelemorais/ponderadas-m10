import 'package:flutter/material.dart';
import 'package:app_flutter/models/task_model.dart';
import 'package:app_flutter/widgets/task_card.dart';


class TasksSession extends StatefulWidget {
  final Future<List<TaksModel>> futureTasks;
  final Function() refreshTasks;
  final String token;

  TasksSession({
    Key? key,
    required this.futureTasks,
    required this.refreshTasks,
    required this.token,
  }) : super(key: key);

  @override
  State<TasksSession> createState() => _TasksSessionState();
}

class _TasksSessionState extends State<TasksSession> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<List<TaksModel>>( 
          future: widget.futureTasks,
          builder: (context, snapshot) {

            // done
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final task = snapshot.data![snapshot.data!.length - 1 - index];
                  return TaskCard(
                    token: widget.token,
                    taskId: task.id,
                    title: task.title,
                    description: task.description,
                    refreshTasks: widget.refreshTasks,
                  );
                },
              );

              //error
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // waiting
            return const CircularProgressIndicator();
          },
        ),
      );
  }
}

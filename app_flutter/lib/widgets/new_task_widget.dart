import 'package:flutter/material.dart';
import 'package:app_flutter/services/post_task.dart';
//import 'package:flutter/widgets.dart';

class NewTask extends StatefulWidget {
  final Function() refreshTasks;
  final String token;

  const NewTask({
    Key? key,
    required this.token,
    required this.refreshTasks,
  }) : super(key: key);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String _title = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Create new task",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Color.fromARGB(255, 106, 71, 171)
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius:
                BorderRadius.circular(8), 
          ),
          child: TextFormField(
            decoration: const InputDecoration(
                hintStyle:TextStyle(
                  fontFamily: 'Poppins'
                ),
                labelText: 'Title',
                border: OutlineInputBorder(),
                fillColor: Colors.white),
            onChanged: (value) {
              setState(() {
                _title = value;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius:
                BorderRadius.circular(8), 
          ),
          child: TextField(
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintStyle:TextStyle(
                  fontFamily: 'Poppins'
            ),
            labelText: 'Description',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            setState(() {
              _description = value;
            });
          },
        )),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            await postTask(_title, _description, widget.token);
            await widget.refreshTasks();
          },
          child: const Text(
            'Enviar',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

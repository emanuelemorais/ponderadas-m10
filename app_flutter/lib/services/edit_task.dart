import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> editTask(String id, String newTitle, String newDescription, String token) async {
  const url = "http://10.0.2.2:8000/editTask";
  
  final response = await http.put(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode({
      'id': id,
      'title': newTitle,
      'description': newDescription,
    }),
  );

  if (response.statusCode == 200) {
    print('Tarefa editada com sucesso!');
  } else {
    throw Exception('Erro ao editar a tarefa: ${response.statusCode}');
  }
}

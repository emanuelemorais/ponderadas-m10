import 'package:app_flutter/models/task_model.dart';
import 'package:http/http.dart' as http;

Future<List<TaksModel>> getTasks(String token) async {
  const url = "http://10.0.2.2:8000/getTasks/1";

  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },);

  if (response.statusCode == 200) {
    return taskFromJson(response.body);
  } else {
    print(response.body);
    throw Exception("Erro ao solicitar dados da API.");
  }
}
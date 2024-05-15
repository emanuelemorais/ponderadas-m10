import 'dart:convert';

List<TaksModel> taskFromJson(String str) {
  final Iterable<dynamic> parsed = json.decode(str);
  return List<TaksModel>.from(parsed.map((x) => TaksModel.fromJson(x)));
}


String taskToJson(List<TaksModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaksModel {
    String id;
    String userId;
    String title;
    String description;

    TaksModel({
        required this.id,
        required this.userId,
        required this.title,
        required this.description,
    });

    factory TaksModel.fromJson(Map<String, dynamic> json) => TaksModel(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "description": description,
    };
}

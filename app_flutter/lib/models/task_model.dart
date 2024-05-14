class TaskModel {
  String id;
  String userId;
  String title;
  String description;

  TaskModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map){
    return TaskModel(
        id: map['id'],
        userId: map['userId'],
        title: map['title'],
        description: map['description'],
    );  
  }      
}

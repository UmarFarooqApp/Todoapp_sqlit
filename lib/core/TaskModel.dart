class TaskModel {
  final int ?id;
  final String ?task;

  TaskModel({this.id, this.task});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task': task,
    };
  }
}

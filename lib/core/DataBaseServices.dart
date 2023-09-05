
import 'Database.dart';
import 'TaskModel.dart';


class TaskDao {
  final dbHelper = DatabaseHelper.instance.database;

  Future<int> insertTask(TaskModel task) async {
    final db = await dbHelper;
    return await db.insert('Task', task.toMap());
  }

  Future<List<TaskModel>> getAllTasks() async {
    final db = await dbHelper;
    final List<Map<String, dynamic>> maps = await db.query('Task');
    return List.generate(maps.length, (i) {
      return TaskModel(
        id: maps[i]['id'],
        task: maps[i]['task'],
      );
    });
  }

  Future<void> updateTask(TaskModel task) async {
    final db = await dbHelper;
    await db.update(
      'Task',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
    getAllTasks();
  }

  Future<void> deleteTask(int taskId) async {
    final db = await dbHelper;
    await db.delete(
      'Task',
      where: 'id = ?',
      whereArgs: [taskId],
    );
  }
}

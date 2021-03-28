import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/task.dart';

class DatabaseHelper {

 Future<Database> database() async {
  return openDatabase(
    join(await getDatabasesPath(),'notes.db'),
    onCreate: (db, version) async {
      
      await db.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)");
      // to add fav data base


      return db;
    },
    version: 1,
  );
}

Future<int> insertTask(Task task) async {

   int taskId =0;
   Database _db = await database();
   await _db.insert('tasks', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace).then((value) {
     taskId = value;
   });
   return taskId;

}

 Future<void> updateTaskDescription(int id, String description) async {
   Database _db = await database();
   await _db.rawUpdate("UPDATE tasks SET description = '$description' WHERE id = '$id'");
 }

 Future<void> updateTaskTitle(int id, String title) async {
   Database _db = await database();
   await _db.rawUpdate("UPDATE tasks SET title = '$title' WHERE id = '$id'");
 }





 Future<List<Task>> getTasks() async {

   Database _db = await database();
   List<Map<String, dynamic>> taskMap = await _db.query('tasks');
   return List.generate(taskMap.length, (index){
     return Task(id: taskMap[index]['id'], title: taskMap[index]['title'], description: taskMap[index]['description']);
   });

 }

 Future<void> deleteTask(int id) async {
   Database _db = await database();
   await _db.rawDelete("DELETE FROM tasks WHERE id = '$id'");
 }

}
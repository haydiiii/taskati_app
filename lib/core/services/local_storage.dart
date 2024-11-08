import 'package:hive/hive.dart';
import 'package:taskati_app/features/add_task/data/task_model.dart';

class AppLocalStorage {
  static late Box userBox;
  static late Box taskBox;
  static init() {
    userBox = Hive.box('userBox');
    taskBox = Hive.box<TaskModel>('taskBox');
  }

  static cashData(key, value) {
    userBox.put(key, value);
  }
  static cashTaskBox(key, TaskModel value) {
    taskBox.put(key, value);
  }

  static getCahData(key) {
    return userBox.get(key);
  }
  static TaskModel getTaskBoxCashed(key) {
    return taskBox.get(key);
  }
}

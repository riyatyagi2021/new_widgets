import 'package:flutter/cupertino.dart';
import 'package:trying_widgetss/new_trials/provider/task_model.dart';

class TodoModel extends ChangeNotifier{
  List<TaskModel> taskList = []; //contians all the task

  addTaskInList(){
    TaskModel taskModel = TaskModel("Title ${taskList.length}", "Helllo Detail no ${taskList.length}");
    taskList.add(taskModel);

    notifyListeners();
    //code to do
  }

}
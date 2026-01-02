import 'package:get/get.dart';

import '../../../../helper/utils/utils.dart';
import '../../../data/models/todo_model.dart';

class TodoController extends GetxController {
  List<TodoModel> todo = <TodoModel>[];
  int rowsPerPage = 10;
  int currentPage = 0;

  @override
  void onInit() {
    super.onInit();
    TodoModel.dummyList.then((List<TodoModel> value) {
      todo.assignAll(value);
      update();
    });
  }

  List<TodoModel> get paginatedData {
    final int start = currentPage * rowsPerPage;
    final int end = start + rowsPerPage;
    return todo.sublist(start, end < todo.length ? end : todo.length);
  }

  int get totalPages => (todo.length / rowsPerPage).ceil();

  void nextPage() {
    if (currentPage < totalPages - 1) {
      currentPage++;
    }
    update();
  }

  void previousPage() {
    if (currentPage > 0) {
      currentPage--;
    }
    update();
  }

  void onCompleteTask(TodoModel todo) {
    todo.isComplete = !todo.isComplete;
    update();
  }

  void updateTask(TodoModel task, String updatedTask, String updatedDueDate) {
    task.task = updatedTask;
    task.dueDate = Utils.convertStringToDate(updatedDueDate);
    update();
  }

  void removeData(TodoModel index) {
    todo.remove(index);
    update();
  }
}

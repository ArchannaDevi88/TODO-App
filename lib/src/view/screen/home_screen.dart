import 'package:flutter/material.dart';
import 'package:flutter_todo_digital_prizm/routes/route_constants.dart';
import 'package:flutter_todo_digital_prizm/src/controllers/todo_controller.dart';
import 'package:flutter_todo_digital_prizm/src/view/widget/todo_edit_widget.dart';
import 'package:flutter_todo_digital_prizm/utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeScreen extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());


  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO "),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
         // todoController.storeValue();
          Get.toNamed(RouteConstants.todoScreenRoute);
        },
      ),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.deepOrange,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (_) {
              todoController.todos.removeAt(index);
              Get.snackbar('Remove!', "Task was succesfully Delete",
                  snackPosition: SnackPosition.BOTTOM);
            },
            child: Card(
              elevation: 2.0,
              child: ListTile(
                title: Text(
                  todoController.todos[index].todoTaskMessage!,
                  style: todoController.todos[index].done
                      ? const TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        )
                      : const TextStyle(
                          color: Colors.black,
                        ),
                ),
                subtitle: Text(
                  '${CommonUtils().yearDateMonthTimeFormat(todoController.selectedDate.value)}',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black38,
                    decoration: todoController.todos[index].done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: (todoController.todos[index].done)
                    ? IconButton(
                        onPressed: (){
                          todoController.todos.removeAt(index);
                          Get.snackbar('Remove!', "Task was succesfully Delete",
                              snackPosition: SnackPosition.BOTTOM);
                        },
                        icon: const Icon(Icons.delete),
                      )
                    : IconButton(
                        onPressed: () => Get.to(() => TodoEdit(index: index)),
                        icon: const Icon(Icons.edit),
                      ),
                leading: Checkbox(
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                  value: todoController.todos[index].done,
                  onChanged: (neWvalue) {
                    var todo = todoController.todos[index];
                    todo.done = neWvalue!;
                    todoController.todos[index] = todo;
                  },
                ),
              ),
            ),
          ),
          itemCount: todoController.todos.length,
        ),
      ),
    );
  }
}

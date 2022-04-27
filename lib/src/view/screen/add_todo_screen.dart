import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_digital_prizm/src/controllers/todo_controller.dart';
import 'package:flutter_todo_digital_prizm/src/model/todo_model.dart';
import 'package:flutter_todo_digital_prizm/utils/common_utils.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();
  TodoScreen({Key? key}) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.0,
                ),
                TextField(
                  // textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'TODO Task',
                    labelStyle: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  autofocus: true,
                  controller: textEditingController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Set Remainder',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                InkWell(
                  onTap: () {
                    todoController.pickDateTime();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black12, width: 1)),
                    child: Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.date_range),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 20.0, top: 20.0, bottom: 20.0),
                          child: Text(
                            '${CommonUtils().yearDateMonthTimeFormat(todoController.selectedDate.value)}',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // ignore: deprecated_member_use
                    RaisedButton(
                      child: const Text('Cancel'),
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      child: const Text('Add'),
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () {
                        todoController.todos.add(
                          TodoModel(
                            todoTaskMessage: textEditingController.text,
                            remainder: todoController.selectedDate.value.toString()
                          ),
                        );
                        print(todoController.todos.toJson());
                        Get.back();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

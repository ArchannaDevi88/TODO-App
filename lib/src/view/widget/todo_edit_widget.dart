import 'package:flutter/material.dart';
import 'package:flutter_todo_digital_prizm/src/controllers/todo_controller.dart';
import 'package:flutter_todo_digital_prizm/utils/common_utils.dart';
import 'package:get/get.dart';

class TodoEdit extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();
  final int? index;
  TodoEdit({Key? key, @required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
    TextEditingController(text: todoController.todos[index!].todoTaskMessage);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
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
                          '${CommonUtils().yearDateMonthTimeFormat(DateTime.tryParse(todoController.todos[index!].remainder)!)}',
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
                    child: const Text('Update'),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      var editing = todoController.todos[index!];
                      editing.todoTaskMessage = textEditingController.text;
                      editing.remainder = todoController.selectedDate.value.toString();
                      todoController.todos[index!] = editing;
                      Get.back();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
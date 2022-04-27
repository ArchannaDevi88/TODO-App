


import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_todo_digital_prizm/src/model/todo_model.dart';
import 'package:get/get.dart';



class TodoController extends GetxController {
  var todos = List<TodoModel>.empty().obs;
  var selectedDate  = DateTime.now().obs;
  var currentDatetime = DateTime.now();
  Rx<TextEditingController> dateEditingController = TextEditingController().obs;
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  // Create a Reference to the file
  firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
      .ref()
      .child('TODO')
      .child('/todo_list.txt');


  @override
  void onInit() {
    _downloadFile(ref);
    ever(todos, (_) {
      storeValue();
    });
    super.onInit();
  }


  storeValue() async {
    Todo todo = Todo(todos);
    String putStringText = json.encode(todo.toJson()).toString();
    return ref.putString(putStringText,
        metadata: firebase_storage.SettableMetadata(
            contentLanguage: 'en',
            customMetadata: <String, String>{'example': 'putString'}));

  }

  Future<void> _downloadFile(firebase_storage.Reference ref) async {
    Uint8List? downloadedData  =  await ref.getData();
    String todoList   = (utf8.decode(downloadedData!));
     print('*****  DECODE ${ jsonDecode(todoList)}');
   Todo todoModel = Todo.fromJson(jsonDecode(todoList));
   List<TodoModel> list =  todoModel.todoModelList;
   todos.value=list;
  }
  

  pickDateTime() async {
    DateTime? date = await pickDate();
    if(date == null) return;

    TimeOfDay? timeOfDay = await pickTime();
    if(timeOfDay ==null ) return;

    final newDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        timeOfDay.hour,
        timeOfDay.minute
    );
    if(newDateTime != selectedDate.value){
      selectedDate.value = newDateTime;
      dateEditingController.value.text = newDateTime.toString();
    }
  }
  
 Future<DateTime?> pickDate() => showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(2024));

  Future<TimeOfDay?> pickTime() =>
      showTimePicker(context: Get.context!,
          initialTime: TimeOfDay(
              hour: currentDatetime.hour,
              minute: currentDatetime.minute));



}
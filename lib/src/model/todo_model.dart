

class TodoModel {
  String? todoTaskMessage;
  String remainder;
  bool done;

  TodoModel({this.todoTaskMessage, this.done = false,this.remainder=""});

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      TodoModel(todoTaskMessage: json['text'], done: json['done'], remainder: json['remainder']);

  Map<String, dynamic> toJson() =>
      {'text': todoTaskMessage,
        'done': done,
        'remainder': remainder.toString()};
}

class Todo {
  List<TodoModel> todoModelList=[];

  Todo(this.todoModelList);

  Todo.fromJson(Map<String, dynamic> json) {

    if (json['todoModelList'] != null) {
      todoModelList = [];
      json['todoModelList'].forEach((v) {
        todoModelList.add(new TodoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.todoModelList != null) {
      data['todoModelList'] =
          this.todoModelList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_test/controller/todoController.dart';
import 'package:getx_test/models/todo.dart';

class TodoScreen extends StatelessWidget {
  final int index;
  TodoScreen({this.index});
  final TodoController todoController = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    String text = '';
    if (! this.index.isNull) {
      text = todoController.todos[index].text;
    }
    TextEditingController textEditingController =
        TextEditingController(text: text);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'What do you want to accomplished? ',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: TextStyle(fontSize: 25),
                keyboardType: TextInputType.multiline,
                maxLines: 999,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  child: Text(
                    'Cancel',
                  ),
                  color: Colors.red,
                  onPressed: () {
                    Get.back();
                  },
                ),
                RaisedButton(
                  child: Text(this.index.isNull ? 'Add' : 'Edit'),
                  color: Colors.green,
                  onPressed: () {
                    if (this.index.isNull) {
                      todoController.todos
                          .add(Todo(text: textEditingController.text));
                    } else {
                       var editing = todoController.todos[index];
                      editing.text = textEditingController.text;
                      todoController.todos[index] = editing;
                    }
                    Get.back();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

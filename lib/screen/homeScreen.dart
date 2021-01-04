import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controller/todoController.dart';
import 'package:getx_test/screen/todoScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(title: Text('Getx Todo List')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TodoScreen());
        },
      ),
      body: Container(
        child: Obx(() => ListView.separated(
            itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) {
                    var removed = todoController.todos[index];
                    todoController.todos.removeAt(index);
                    Get.snackbar('task removed',
                        'The Task "${removed.text}" was successfully removed',
                        mainButton: FlatButton(
                          child: Text('undo'),
                          onPressed: (){
                            if(removed.isNull) return;
                            todoController.todos.insert(index, removed);
                            if(Get.isSnackbarOpen) Get.back();
                          }
                        )
                        );
                  },
                  child: ListTile(
                    title: Text(
                      todoController.todos[index].text,
                      style: (todoController.todos[index].done)
                          ? TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough)
                          : TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color),
                    ),
                    onTap: () {
                      Get.to(TodoScreen(
                        index: index,
                      ));
                    },
                    leading: Checkbox(
                      value: todoController.todos[index].done,
                      onChanged: (value) {
                        var changer = todoController.todos[index];
                        changer.done = value;
                        todoController.todos[index] = changer;
                      },
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
            separatorBuilder: (_, __) => Divider(),
            itemCount: todoController.todos.length)),
      ),
    );
  }
}

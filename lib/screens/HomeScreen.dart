import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moor_example/persistence/database.dart';

class HomeScreen extends StatelessWidget {
  final toDoDao = MyDatabase().toDoDao;
  final scaffoleKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoleKey,
      appBar: AppBar(
        title: Text("MOOR EG"),
      ),
      body: StreamBuilder<List<ToDos>>(
        stream: toDoDao.todoList,
        builder: (context, AsyncSnapshot<List<ToDos>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data != null) {
            if (snapshot.data.isEmpty)
              return Center(
                child: Text('Empty'),
              );
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(snapshot.data[index].title),
                subtitle: Text(snapshot.data[index].content),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final randomValue = Random().nextInt(1000);
          toDoDao
              .insert(
            ToDos(
              id: null,
              title: "New Data - $randomValue",
              content: "New Content - $randomValue",
            ),
          )
              .then((value) {
            _showSanckBar(context, 'Insert Successfully');
          }).catchError((onError) {
            _showSanckBar(context, onError.toString());
          });
        },
      ),
    );
  }

  _showSanckBar(BuildContext context, String message) {
    scaffoleKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1500),
    ));
  }
}

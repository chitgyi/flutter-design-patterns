import 'package:moor_example/persistence/database.dart';
import 'package:moor_example/persistence/entities/to_do.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'todo_dao.g.dart';

@UseDao(tables: [ToDo])
class ToDoDao extends DatabaseAccessor<MyDatabase> with _$ToDoDaoMixin {
  ToDoDao(MyDatabase db) : super(db);

  // order by id desc
  Stream<List<ToDos>> get todoList => (select(toDo)
        ..orderBy([
          (u) => OrderingTerm(expression: u.id, mode: OrderingMode.desc),
          (u) => OrderingTerm(expression: u.id)
        ]))
      .watch();
  Future<void> insert(ToDos toDos) => into(toDo).insert(toDos);
}

import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("ToDos")
class ToDo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text()();
}

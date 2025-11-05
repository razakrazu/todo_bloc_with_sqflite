import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_bloc/todo/model/model.dart';

part 'todobloc_event.dart';
part 'todobloc_state.dart';

class TodoblocBloc extends Bloc<TodoblocEvent, TodoblocState> {
  final Future<Database> database;
  final bool dbExists;
  TodoblocBloc(this.database, this.dbExists) : super(TodoblocInitial()) {
    on<addTodo>((event, emit) async {
      emit(TodoLoading());

      try {
        if (!dbExists) {
          emit(TodoError(errormsg: 'Database not exists'));
        }

        await insertTodo(event.todomodel);
        final List<TodoModel> todolist = await fetchTodos();

        emit(TodoLoaded(todolist));
      } catch (e) {
        emit(TodoError(errormsg: e.toString()));
      }



    });
    

    on<LoadTodo>((event,emit) async{

  emit(TodoLoading());

  try {
    if (!dbExists) {
          emit(TodoError(errormsg: 'Database not exists'));

             final List<TodoModel> todolist = await fetchTodos();
            emit(TodoLoaded(todolist));
        }
 }catch(e) {
        emit(TodoError(errormsg: e.toString()));
      }
});
  }



  
  Future<List<TodoModel>> fetchTodos() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('todo');
    return List.generate(maps.length, (index) {
      print(maps[index]);
      return TodoModel.fromMap(maps[index]);
    });
  }

  Future<void> insertTodo(TodoModel todomodel) async {
    final Database db = await database;
    await db.insert(
      'todo',
      todomodel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTodo(TodoModel todomodel) async {
    final Database db = await database;
    await db.update(
      'todo',
      todomodel.toMap(),
      where: 'id = ?',
      whereArgs: [todomodel.id],
    );
  }

  Future<void> deleteTodo(int id) async {
    final Database db = await database;
    await db.delete('todo', where: 'id = ?', whereArgs: [id]);
  }
}

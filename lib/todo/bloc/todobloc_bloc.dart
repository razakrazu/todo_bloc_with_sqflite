

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_bloc/todo/model/model.dart';

part 'todobloc_event.dart';
part 'todobloc_state.dart';

class TodoblocBloc extends Bloc<TodoblocEvent, TodoblocState> {
  final Future<Database> database;

  TodoblocBloc(this.database) : super(TodoblocInitial()) {
    on<LoadTodo>((event, emit) async {
      emit(TodoLoading());

      try {
        final List<TodoModel> todolist = await fetchTodos();
        emit(TodoLoaded(todolist));
      } catch (e) {
        emit(TodoError(errormsg: 'faild to load ${e.toString()}'));
      }
    });

    // Add Todo Event
    on<AddTodo>((event, emit) async {
      emit(TodoLoading());
      try {
        await insertTodo(event.todomodel);
        final List<TodoModel> todolist = await fetchTodos();
        emit(TodoLoaded(todolist));
      } catch (e) {
        emit(TodoError(errormsg: 'Failed to add todo: ${e.toString()}'));
      }
    });
    // Update Todo Event
    on<UpdateTodo>((event, emit) async {
      emit(TodoLoading());
      try {
        await updateTodo(event.todomodel);
        final List<TodoModel> todolist = await fetchTodos();
        emit(TodoLoaded(todolist));
      } catch (e) {
        emit(TodoError(errormsg: 'Failed to update todo: ${e.toString()}'));
      }
    });

    // Delete Todo Event
    on<DeleteTodo>((event, emit) async {
      emit(TodoLoading());
      try {
        await deleteTodo(event.id);
        final List<TodoModel> todolist = await fetchTodos();
        emit(TodoLoaded(todolist));
      } catch (e) {
        emit(TodoError(errormsg: 'Failed to delete todo: ${e.toString()}'));
      }
    });
  }




  Future<List<TodoModel>> fetchTodos() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('todo');
    return List.generate(maps.length, (index) {

      return TodoModel.fromMap(maps[index]);
    });
  }

  Future<void> insertTodo(TodoModel todomodel) async {
    //  log('${todomodel.toMap()}');
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

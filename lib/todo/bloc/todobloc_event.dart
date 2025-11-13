part of 'todobloc_bloc.dart';

@immutable
sealed class TodoblocEvent {}

class LoadTodo extends TodoblocEvent {}

class AddTodo extends TodoblocEvent {
  final TodoModel todomodel;
  AddTodo(this.todomodel);
}

class UpdateTodo extends TodoblocEvent {
  final TodoModel todomodel;
  UpdateTodo(this.todomodel);
}

class DeleteTodo extends TodoblocEvent {
  final int id;
  DeleteTodo(this.id);
}

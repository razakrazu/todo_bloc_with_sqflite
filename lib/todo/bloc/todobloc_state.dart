part of 'todobloc_bloc.dart';

@immutable
sealed class TodoblocState {}

final class TodoblocInitial extends TodoblocState {}



class TodoLoading extends TodoblocState{}


class TodoLoaded extends TodoblocState{
  final List<TodoModel> todolist;
  TodoLoaded(this.todolist);
}

class TodoError extends TodoblocState {
  final String errormsg;
  TodoError({required this.errormsg});
}

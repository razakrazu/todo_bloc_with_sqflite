part of 'todobloc_bloc.dart';

@immutable
sealed class TodoblocEvent {}


class LoadTodo extends TodoblocEvent{}


class addTodo extends TodoblocEvent{

  final TodoModel  todomodel;
 addTodo(this.todomodel);


}



class updateTodo extends TodoblocEvent{
   final TodoModel todomodel;
   updateTodo(this.todomodel);

}


class deleteTodo extends TodoblocEvent{
  final int id;
  deleteTodo(this.id);
}

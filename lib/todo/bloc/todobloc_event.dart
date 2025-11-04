part of 'todobloc_bloc.dart';

@immutable
sealed class TodoblocEvent {}


class LoadTodo extends TodoblocEvent{}


class addTodo extends TodoblocEvent{}



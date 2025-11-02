import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todobloc_event.dart';
part 'todobloc_state.dart';

class TodoblocBloc extends Bloc<TodoblocEvent, TodoblocState> {
  TodoblocBloc() : super(TodoblocInitial()) {
    on<TodoblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

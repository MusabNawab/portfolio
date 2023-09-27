import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changecolor_event.dart';
part 'changecolor_state.dart';

class ChangecolorBloc extends Bloc<ChangecolorEvent, ChangecolorState> {
  ChangecolorBloc() : super(ChangecolorInitial()) {
    on<ChangeColor>((event, emit) {
      emit(ChangecolorState(!state.changed));
    });
  }
}

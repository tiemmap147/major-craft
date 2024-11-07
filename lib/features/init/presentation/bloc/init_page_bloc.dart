import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'init_page_event.dart';
part 'init_page_state.dart';

class InitPageBloc extends Bloc<InitPageEvent, InitPageState> {
  InitPageBloc() : super(InitPageInitial()) {
    on<InitPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

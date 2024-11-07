import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_address_event.dart';
part 'my_address_state.dart';

class MyAddressBloc extends Bloc<MyAddressEvent, MyAddressState> {
  MyAddressBloc() : super(MyAddressInitial()) {
    on<MyAddressEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

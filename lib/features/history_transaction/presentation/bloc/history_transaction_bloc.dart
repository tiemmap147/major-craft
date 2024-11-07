import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_transaction_event.dart';
part 'history_transaction_state.dart';

class HistoryTransactionBloc extends Bloc<HistoryTransactionEvent, HistoryTransactionState> {
  HistoryTransactionBloc() : super(HistoryTransactionInitial()) {
    on<HistoryTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

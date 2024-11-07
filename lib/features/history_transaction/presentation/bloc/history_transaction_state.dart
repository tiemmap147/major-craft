part of 'history_transaction_bloc.dart';

abstract class HistoryTransactionState extends Equatable {
  const HistoryTransactionState();  

  @override
  List<Object> get props => [];
}
class HistoryTransactionInitial extends HistoryTransactionState {}

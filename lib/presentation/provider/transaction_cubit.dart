import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/data/models/transaction_model.dart';
import 'package:travel_app/services/transaction_service.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void creatTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());
      await TransactionService().creatTransaction(transaction);
      emit(const TransactionSuccess([]));
    } catch (e) {
      TransactionFailed(e.toString());
    }
  }

  void fetchTransaction() async {
    try {
      emit(TransactionLoading());
      List<TransactionModel> transactions =
          await TransactionService().fetchTransaction();
      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  // void deleteTransaction() async {
  //   try {
  //     TransactionService().deleteItem();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}

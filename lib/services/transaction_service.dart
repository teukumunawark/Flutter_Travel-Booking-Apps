import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/data/models/transaction_model.dart';

class TransactionService {
  final CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> creatTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'destination': transaction.destination.toJson(),
        'amountOfTravel': transaction.amountOfTravel,
        'selectedSeat': transaction.selectedSeat,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> fetchTransaction() async {
    try {
      QuerySnapshot result = await _transactionReference.get();

      List<TransactionModel> transactions = result.docs.map(
        (e) {
          return TransactionModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return transactions;
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> deleteItem() async {
  //   DocumentReference documentReferencer =
  //       _transactionReference.doc().collection('x').doc();

  //   await documentReferencer
  //       .delete()
  //       // ignore: avoid_print
  //       .whenComplete(() => print('Note item deleted from the database'))
  //       // ignore: avoid_print
  //       .catchError((e) => print(e));
  // }
}

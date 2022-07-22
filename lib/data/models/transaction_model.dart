import 'package:equatable/equatable.dart';
import 'package:travel_app/data/models/destination_model.dart';

class TransactionModel extends Equatable {
  final DestinationModel destination;
  final String id;
  final int amountOfTravel;
  final String selectedSeat;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;
  final String airportName;

  const TransactionModel({
    required this.destination,
    this.id = '',
    this.amountOfTravel = 0,
    this.selectedSeat = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
    this.airportName = '',
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        destination: DestinationModel.fromJson(
          json['destination']['id'],
          json['destination'],
        ),
        id: id,
        amountOfTravel: json['amountOfTravel'],
        selectedSeat: json['selectedSeat'],
        insurance: json['insurance'],
        refundable: json['refundable'],
        vat: json['vat'],
        price: json['price'],
        grandTotal: json['grandTotal'],
        airportName: json['destination']['airportName'],
      );

  @override
  List<Object?> get props => [
        destination,
        amountOfTravel,
        selectedSeat,
        insurance,
        refundable,
        vat,
        price,
        grandTotal,
        airportName,
      ];
}

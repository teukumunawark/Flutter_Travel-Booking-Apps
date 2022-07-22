import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String country;
  final String imageUrl;
  final String aboutcity;
  final String city;
  final double rating;
  final int price;
  final String airportName;
  final String kodeIATA;

  const DestinationModel({
    required this.id,
    this.name = '',
    this.country = '',
    this.city = '',
    this.imageUrl = '',
    this.rating = 0.0,
    this.price = 0,
    this.aboutcity = '',
    this.airportName = '',
    this.kodeIATA = '',
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        name: json['name'].toString(),
        country: json['country'].toString(),
        city: json['city'].toString(),
        imageUrl: json['imageUrl'].toString(),
        rating: json['rating'].toDouble(),
        aboutcity: json['about'].toString(),
        price: json['price'],
        airportName: json['airportName'].toString(),
        kodeIATA: json['kodeIATA'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country,
        'city': city,
        'imageUrl': imageUrl,
        'rating': rating,
        'price': price,
        'about': aboutcity,
        'airportName': airportName,
        'kodeIATA': kodeIATA,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        country,
        city,
        imageUrl,
        rating,
        price,
        aboutcity,
        airportName,
        kodeIATA,
      ];
}

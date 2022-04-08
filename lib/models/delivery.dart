
import 'dart:developer';

class Delivery {
  final int id;
  final int amountOfSpaces;
  final String organisation;

  const Delivery({
    required this.id,
    required this.amountOfSpaces,
    required this.organisation,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      id: json['id'],
      amountOfSpaces: json['amountOfSpaces'],
      organisation: json['organisation'],
    );
  }
}

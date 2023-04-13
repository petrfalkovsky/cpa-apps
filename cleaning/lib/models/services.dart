import 'package:cleaning/config/config.dart';

class ServicesModel {
  final String name;
  final int price;
  final String currency;
  int count;

  ServicesModel({
    required this.name,
    required this.price,
    this.currency = AppConfig.currency,
    this.count = 0,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['quantity'] = count;
    data['cost'] = price;
    return data;
  }
}

import 'package:flutter/foundation.dart';

class BagItem with ChangeNotifier{

  final String id;
  final String title;
  int quantity;
  double amount;
  final double price;
  final String country;
  final String store;
  final String imageUrl;

  BagItem({
    @required this.id,
    @required this.title,
    this.quantity,
    this.amount,
    @required this.price,
    @required this.country,
    @required this.store,
    @required this.imageUrl,
  });

  void changeAmount(double amount){
    this.amount = amount;
    notifyListeners();
  }
  void changeQuantity(int quantity){
    this.quantity = quantity;
    notifyListeners();
  }



}
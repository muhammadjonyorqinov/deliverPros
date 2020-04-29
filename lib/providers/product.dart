import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier{

  final String  id;
  final String title;
  final String country;
  final String store;
  final double price;
  final String imageUrl;
  final String description;
  final int discount;
  final String type;
  bool isWished;
  bool isAddPressed;
  final bool isCountable;


  Product({
    @required this.id,
    @required this.title,
    @required this.country,
    @required this.imageUrl,
    @required this.store,
    @required this.price,
    @required this.description,
    @required this.isCountable,
    @required this.type,
    this.discount = 0,
    this.isWished = false,
    this.isAddPressed = false});

  void toggleWishedStatus(){
    isWished = !isWished;
    notifyListeners();
  }
  void togglePressedStatus(){
    isAddPressed = !isAddPressed;
    notifyListeners();
  }
  void falsifyPressedStatus(){
    isAddPressed = false;
    notifyListeners();
  }
}
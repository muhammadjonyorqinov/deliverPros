import 'package:flutter/foundation.dart';



class Delivery with ChangeNotifier{

  final String title;
  final String description;
  final int price;
  final String imageUrl;
  bool isSelected;
  Delivery({
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isSelected = false,
  });

  void selectType(){
    isSelected = true;
    notifyListeners();
  }

  void falsifyType(){
    isSelected = false;
    notifyListeners();
  }




}
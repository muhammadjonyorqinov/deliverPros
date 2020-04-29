import 'package:deliverpros/models/delivery.dart';
import 'package:flutter/material.dart';


class DeliveryTypes with ChangeNotifier{


  List<Delivery> _items = [
    Delivery(
        title: 'Standart',
        description: '1-2 hour',
        price: 5000,
        imageUrl:'assets/images/std_truck.png',
        isSelected: true,
    ),
    Delivery(
      title: 'Supersonic',
      description: '30 min',
      price: 10000,
      imageUrl:'assets/images/fast_truck.png',
    ),
  ];


  List<Delivery> get items{
    return [..._items];
  }

  void notSelectAll(){
    _items.forEach((item){
      item.falsifyType();
    });
    notifyListeners();
  }

}
import 'package:deliverpros/providers/card.dart' as C;
import 'package:flutter/material.dart';


class Cards with ChangeNotifier{

  List<C.Card> _cards = [
    C.Card(
      id: '1',
      holderName: 'MUKHAMMADJON YORKINOV',
      cardNumber: '8600011223452134',
      expiryDate: '1221',
    )
  ];


  List<C.Card> get cards{
    return _cards;
  }

  void addCard(String holderName,String cardNumber,String expiryDate){
    _cards.add(C.Card(
      id: DateTime.now().toString(),
      holderName:holderName,
      cardNumber:cardNumber,
      expiryDate:expiryDate,
    ));
    notifyListeners();
  }



}
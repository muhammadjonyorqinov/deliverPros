import 'package:flutter/material.dart';


class Card with ChangeNotifier{

  final String id;
  final String holderName;
  final String cardNumber;
  final String expiryDate;
  bool isChosen;
  
  Card({@required this.id,@required this.holderName,@required this.cardNumber,@required this.expiryDate,this.isChosen = false});

  void chooseCard(){
    isChosen =true;
  }


}

import 'package:flutter/cupertino.dart';

class User with ChangeNotifier{

  final String id;
  final String name;
  final String surname;
  final String phone;
  final String email;
  final String password;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.surname,
  });






}

import 'dart:convert';

import 'package:deliverpros/univ/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class UserConnection with ChangeNotifier{

  User user = User();

  Future<bool> createUser(User user)async{

    var urls = '$url/createUser';
    try {
      print(user.name);
      print(user.surname);
      print(user.phone);
      print(user.email);
      print(user.password);
      var response = await http.post(urls,body: {
        'name':user.name,
        'surname':user.surname,
        'email':user.email,
        'password':user.password,
        'phone':user.phone,
      });
      print('answer ${response.statusCode}');
      print(json.decode(response.body));

      if(response.body.contains("User has been created"))
        return true;
      else
        return false;

    }catch (error){
      print('error $error');
      return false;
    }

  }


  Future<String> login(String email,String password)async{

    var urls = '$url/loginUser';
    try {

      var response = await http.post(urls,body:{
        'email':email,
        'password':password,
      });
      //print(response.body);

      final extractedData = json.decode(response.body) as Map<String,
          dynamic>;
      //print(extractedData);
      if(extractedData.isNotEmpty && extractedData != null && extractedData['id'] != null){
          print(extractedData);
          user = User(
            id: extractedData['id'].toString(),
            name: extractedData['name'],
            surname: extractedData['surname'],
            email: extractedData['email'],
            phone: extractedData['phone'],
          );
          return 'success';
      }
      else if(response.body.contains("Password is incorrect")){
        return 'password';
      }
      else if(response.body.contains("User is not found")) {
        return 'no_user';
      }
    }catch (error){
      print(error);
      throw error;
    }



  }




}
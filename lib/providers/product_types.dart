import 'dart:convert';

import 'package:deliverpros/providers/product_type.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class ProductTypes with ChangeNotifier{

  List<ProductType> _titles = [];

  Future<void> fetchTitles()async{
    const url ='https://deliverpros-5e614.firebaseio.com/types.json';
    try{
      if(_titles == null || _titles.length == 0) {
        final response = await http.get(url);
        print(response.statusCode);
        final extractedData = json.decode(response.body) as Map<String,
            dynamic>;
        if (extractedData == null) {
          return;
        }
        final List<ProductType> loadedTitles = [];
        extractedData.forEach((key, value) {
          loadedTitles.add(ProductType(id: key, title: value['title']));
        });
        _titles = loadedTitles;
        print(_titles.length);
        notifyListeners();
      }
    }catch(error){
      throw error;
    }


  }


  List<ProductType> get titles{
    return [..._titles];
  }

  int get itemCount {
    return _titles.length;
  }





}
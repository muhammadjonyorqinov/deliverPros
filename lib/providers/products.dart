import 'dart:convert';

import 'package:flutter/material.dart';
import './product.dart';
import 'package:http/http.dart' as http;


class Products with ChangeNotifier{

  List<Product> _items = [];


  List<Product> get items {
    return [..._items];
  }
  int get wishedItemsCount{
    return _items.where((prod)=> prod.isWished).toList().length;

  }
  List<Product> get wishedItems{
    return _items.where((prod)=> prod.isWished).toList();
  }
  List<Product> sortedProducts(String type){
    return _items.where((prod)=> prod.type == type).toList();
  }
  void closeAllPresseds(){
    _items.forEach((product){
      product.falsifyPressedStatus();
    });
  }
  //find item with ID
  Product findById(String id)
  {
    return _items.firstWhere((prod)=> prod.id == id);
  }

  void addProducts(){
    //_items.add(product);
    notifyListeners();
  }

  Future<void> getAndFetchProducts()async{
    const url ='https://deliverpros-5e614.firebaseio.com/products.json';
    try{
      if(_items.length == 0 || _items == null) {
        final response = await http.get(url);
        final extractedData = json.decode(response.body) as Map<String,
            dynamic>;
        print(extractedData);
        if (extractedData == null) {
          return;
        }
        final List<Product> loadedItems = [];
        extractedData.forEach((key, value) {
          print(value['price'].runtimeType);
          var product = Product(
            id: key,
            title: value['title'],
            description: value['description'],
            price: double.tryParse(value['price']),
            isCountable: value['isCountable'],
            country: value['country'],
            store: value['store'],
            imageUrl: value['imageUrl'],
            type: value['type'],
          );
          loadedItems.add(product);
        });
        _items = loadedItems;
        notifyListeners();
      }
    }catch(error){
      print('errrrr $error');
    }
  }

  Future<void> addProductsToServer() {
    try {
      const url = 'https://deliverpros-5e614.firebaseio.com/products.json';
      http.post(url, body: json.encode({
        'title': 'tomato',
        'description': 'tomato is one of the best vegetables in the world',
        'price': 19.99.toString(),
        'isCountable': false,
        'country': 'UZB',
        'store': 'Macro',
        'imageUrl': 'https://i7.pngguru.com/preview/891/45/256/tomato.jpg',
        'type': 'Nuts & Seeds',
      }));

    }catch(error){
      throw error;
    }
  }
}
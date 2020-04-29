import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'bag.dart';

class ShoppingBag with ChangeNotifier {
  Map<String, BagItem> _items = {};

  Map<String, BagItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach(
      (key, bagItem) {
        if(bagItem.quantity != null){
          total += bagItem.price * bagItem.quantity;
        }else{
          total+=bagItem.price * bagItem.amount;
        }

      },
    );
    return total;

  }

  void notifyShoppingBag(){
    notifyListeners();
  }

  void addItemQuantity(String productId, double price, String title,
      String country, String store, String imageUrl, int quantity) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingItem) => BagItem(
          id: existingItem.id,
          title: existingItem.title,
          price: existingItem.price,
          country: existingItem.country,
          imageUrl: existingItem.imageUrl,
          store: existingItem.store,
          quantity: existingItem.quantity + quantity,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => BagItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          country: country,
          imageUrl: imageUrl,
          store: store,
          quantity: quantity,
        ),
      );
    }
    notifyListeners();
  }

  void addItemAmount(String productId, double price, String title,
      String country, String store, String imageUrl, double amount) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingItem) => BagItem(
          id: existingItem.id,
          title: existingItem.title,
          price: existingItem.price,
          country: existingItem.country,
          imageUrl: existingItem.imageUrl,
          store: existingItem.store,
          amount: existingItem.amount + amount,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => BagItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          country: country,
          imageUrl: imageUrl,
          store: store,
          amount: amount,
        ),
      );
    }
    notifyListeners();
  }


  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSIngleItemQuantity(String productId, int quantity) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity >= 1) {
      _items.update(
        productId,
        (existingItem) => BagItem(
          id: existingItem.id,
          title: existingItem.title,
          price: existingItem.price,
          quantity: quantity,
          imageUrl: existingItem.imageUrl,
          country: existingItem.country,
          store: existingItem.store,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void removeSIngleItemAmount(String productId, double amount) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity >= 0.2) {
      _items.update(
        productId,
        (existingItem) => BagItem(
          id: existingItem.id,
          title: existingItem.title,
          price: existingItem.price,
          amount: amount,
          imageUrl: existingItem.imageUrl,
          country: existingItem.country,
          store: existingItem.store,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }



  void clear() {
    _items = {};
    notifyListeners();
  }
}

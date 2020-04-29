import 'package:deliverpros/constants.dart';
import 'package:deliverpros/providers/internet_connection.dart';
import 'package:deliverpros/providers/products.dart';
import 'package:deliverpros/screens/no_connection_screen.dart';
import 'package:deliverpros/widgets/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifications_screen.dart';
import 'shopping_bag_screen.dart';
import 'wishlist_screen.dart';



class ProductDetailScreen extends StatelessWidget {
  static const String routeName = 'products_detail_screen';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false);
    final id = ModalRoute.of(context).settings.arguments as String;
    final product = products.findById(id);
    final connection = Provider.of<InternetConnection>(context).connectionStatus;
    return connection == false?NoConnectionScreen() :Scaffold(
      appBar: AppBar(
        backgroundColor: product_background,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(icon: Image.asset('assets/images/notification.png',height: 28,),
                onPressed: (){
                  Navigator.of(context).pushNamed(NotificationsScreen.routeName);
                },
              ),
              IconButton(icon: Image.asset('assets/images/wishlist.png',height: 20,),
                onPressed: (){
                  Navigator.of(context).pushNamed(WishlistScreen.routeName);
                },
              ),
              IconButton(icon: Image.asset('assets/images/bag.png',height: 26,),
                onPressed: (){
                  Navigator.of(context).pushNamed(ShoppingBagScreen.routeName);
                },
              )
            ],
          )
        ],
      ),
      body: ChangeNotifierProvider.value(
          value: product,
          child: ProductDetail()),

    );
  }
}

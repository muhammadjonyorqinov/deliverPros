import 'package:deliverpros/providers/internet_connection.dart';
import 'package:deliverpros/providers/products.dart';
import 'package:deliverpros/screens/no_connection_screen.dart';
import 'package:deliverpros/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

PreferredSizeWidget getAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(90),
    child: AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70))),
      title: Container(
          padding: EdgeInsets.only(bottom: 16, top: 35),
          child: Text(
            'Wishlist',
            style: Theme.of(context).textTheme.title,
          )),
    ),
  );
}

class WishlistScreen extends StatelessWidget {
  static const String routeName = 'wishlist_screen';


  @override
  Widget build(BuildContext context) {
    final wishlistData = Provider.of<Products>(context);
    final connection = Provider.of<InternetConnection>(context).connectionStatus;
    return connection == false?NoConnectionScreen():
    Scaffold(
      appBar: getAppBar(context),
      body: wishlistData.wishedItemsCount== 0?Center(child: Text('No items in wishlist yet',style: TextStyle(color: text_color_price, fontSize: 20),)):ListView.builder(
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: wishlistData.wishedItems[index],
          child:WishlistItem() ,),
        itemCount: wishlistData.wishedItemsCount,
      ),
    );
  }
}

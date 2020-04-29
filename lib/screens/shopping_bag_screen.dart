import 'package:deliverpros/constants.dart';
import 'package:deliverpros/providers/internet_connection.dart';
import 'package:deliverpros/providers/shopping_bag.dart' show ShoppingBag;
import 'package:deliverpros/screens/delivery_screen.dart';
import 'package:deliverpros/screens/no_connection_screen.dart';
import 'package:deliverpros/widgets/bag_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget getAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(90),
    child: AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70))),
      title: Container(
        height: 90,
          padding: EdgeInsets.only(bottom: 16, top: 35),
          child: Text(
            'Shopping bag',
            style: Theme.of(context).textTheme.title,
          )),
    ),
  );
}

class ShoppingBagScreen extends StatelessWidget {
  static const String routeName = 'cart_screen';


  void onPressCheckOut(BuildContext context){
    Navigator.of(context).pushNamed(DeliveryScreen.routeName);

  }

  @override
  Widget build(BuildContext context) {
    final shoppingBag = Provider.of<ShoppingBag>(context);
    final connection = Provider.of<InternetConnection>(context).connectionStatus;
    return connection == false?NoConnectionScreen():
    Scaffold(
      appBar: getAppBar(context),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: shoppingBag.itemCount,
                  itemBuilder: (context, index)=> ChangeNotifierProvider.value(
                      value: shoppingBag.items.values.toList()[index],
                      child: BagItem(shoppingBag.items.keys.toList()[index])),),
            ),
          ),

          if(shoppingBag.totalAmount != 0.0)Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: shadow_color,
                  blurRadius: 10.0, // has the effect of softening the shadow
                  spreadRadius: 5.0, // has the effect of extending the shadow
                  offset: Offset(
                    1.0, // horizontal, move right 10
                    1.0, // vertical, move down 10
                  ),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Sub total',
                        style: shopping_bag_text_style,
                      ),
                      Text(
                        '${shoppingBag.totalAmount.toStringAsFixed(0)} UZS',
                        style: shopping_bag_text_style,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Delivery',
                        style: shopping_bag_text_style,
                      ),
                      Text(
                        'Standart(5000 UZS)',
                        style: shopping_bag_text_style,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total',
                        style: shopping_bag_text_style.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Text(
                        '${(shoppingBag.totalAmount+5000).toStringAsFixed(0)} UZS',
                        style: shopping_bag_text_style.copyWith(fontSize: 30),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  child: RaisedButton(
                    disabledColor: text_color,
                    color: btn_color,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/arrow_right.png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'CHECKOUT',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    onPressed:()=>onPressCheckOut(context),
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:deliverpros/constants.dart';
import 'package:deliverpros/screens/add_card_screen.dart';
import 'package:flutter/material.dart';

class DeliveryPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 50),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Material(
              color: product_background,
              child: InkWell(
                splashColor: shadow_color,
                child: GridTile(
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    height: 180,
                    child: Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/add_2.png',height: 50,width: 50,color: icon_color,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('ADD CARD',style: TextStyle(fontSize: 16, color: icon_color,fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(AddCard.routeName);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}

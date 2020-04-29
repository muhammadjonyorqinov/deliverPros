import 'package:deliverpros/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deliverpros/providers/cards.dart' as c;
import '../constants.dart';
import 'add_card_screen.dart';

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
            'My cards',
            style: Theme.of(context).textTheme.title,
          )),
    ),
  );
}

class MyWalletsScreen extends StatelessWidget {
  static const String routeName = 'mywallets';
  @override
  Widget build(BuildContext context) {
    final cardData = Provider.of<c.Cards>(context);
    return Scaffold(
      appBar: getAppBar(context),
      body: Container(
        child: Column(
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
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: cardData.cards.length,
                  itemBuilder: (context,index)=>ChangeNotifierProvider.value(
                      value: cardData.cards[index],
                      child: CardItem())),
            ),
          ],
        ),

      ),
    );
  }
}

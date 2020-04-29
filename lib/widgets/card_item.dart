import 'package:flutter/material.dart';
import 'package:deliverpros/providers/card.dart' as c;
import 'package:provider/provider.dart';

import '../constants.dart';


class CardItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final card = Provider.of<c.Card>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        child: Material(
          color: card_color,
          child: InkWell(
            splashColor: shadow_color,
            child: GridTile(
              child: Container(
                width: double.infinity,
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top:16.0,left: 16),
                            child: Text('UzCard',style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                            ),),
                          ),
                          PopupMenuButton(
                            icon: Icon(Icons.more_vert,color: Colors.white,),
                            itemBuilder: (BuildContext context)=>[
                            const PopupMenuItem(
                              value: 'remove',
                              child: Text('Remove'),
                            ),
                            const PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                            ),
                          ],

                          )
                        ],
                      ),
                      Center(child: Text('****  ****  ****  ${card.cardNumber.substring(12,16)}',style: TextStyle(color: Colors.white,fontSize: 20,letterSpacing: 2),)),
                      Center(child: Text('${card.expiryDate.substring(0,2)}/${card.expiryDate.substring(2,4)}',style: TextStyle(color: Colors.white,fontSize: 14,letterSpacing: 2),)),
                      Padding(
                        padding: const EdgeInsets.only(bottom:25.0,left:20),
                        child: Text('${card.holderName}',style: TextStyle(color: Colors.white,fontSize: 16,),),
                      ),


                    ],
                  ),
                ),
              ),
            ),
            onTap: () {

            },
          ),
        ),
      ),
    );
  }
}

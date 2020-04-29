import 'package:deliverpros/constants.dart';
import 'package:deliverpros/models/delivery.dart';
import 'package:deliverpros/providers/delivery_types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SpeedItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final delivery = Provider.of<Delivery>(context);
    final types = Provider.of<DeliveryTypes>(context);
    return Padding(
      padding: const EdgeInsets.only(right:20.0),
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
                padding: EdgeInsets.only(top:13),
                width: MediaQuery.of(context).size.width*0.4,

                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:13.0,bottom: 20),
                      child: Image.asset(delivery.imageUrl,height: 20,),
                    ),
                    Text(delivery.title,style: TextStyle(color: icon_color,fontSize: 16),),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:2.0),
                      child: Text('${delivery.description} (${delivery.price} UZS)',style: TextStyle(color: speed_text_color,fontSize: 12),),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:speed_container_color
                      ),
                      child: delivery.isSelected?Image.asset('assets/images/checkbox.png'):Container(),
                    ),

                  ],

                ),
              ),
            ),
            onTap: (){
              types.notSelectAll();
              delivery.selectType();
            },
          ),
        ),
      ),
    );
  }
}

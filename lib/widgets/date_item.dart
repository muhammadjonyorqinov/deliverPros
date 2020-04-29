import 'package:deliverpros/constants.dart';
import 'package:flutter/material.dart';



class DateItem extends StatelessWidget {
  final Object object;
  DateItem(this.object);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          color: product_background,
          borderRadius: BorderRadius.circular(10)
      ),
        height: 60,
        width: 90,
        child: ListTile(title:Text(object,style: TextStyle(color: icon_color,fontSize: 15),),));
  }
}

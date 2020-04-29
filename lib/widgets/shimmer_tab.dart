import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child:Container(
          alignment: Alignment.center,
          height: 48,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.grey,height: 30,width: 80,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.grey,height: 30,width: 80,),
                Container(

                  margin: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.grey,height: 30,width: 80,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.grey,height: 30,width: 80,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.grey,height: 30,width: 80,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.grey,height: 30,width: 80,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.grey,height: 30,width: 80,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.grey,height: 30,width: 80,),
              ],
            ),
          ),
        ),
        baseColor: Colors.grey[350],
        highlightColor: Colors.white);
  }
}

import 'package:deliverpros/constants.dart';
import 'package:deliverpros/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';



class WishlistItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 21.0),
      child: Container(
        width: double.infinity,

        color: product_background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric( horizontal: 13),
              child: CircleAvatar(
                backgroundColor: wishlist_avatar_background,
                backgroundImage: NetworkImage(product.imageUrl),
                radius: 53,
                //child: Image.network(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:4.0),
                  child: Text('${product.title} - Made in ${product.country}', style: TextStyle(fontFamily: 'Futura',fontWeight:FontWeight.bold, fontSize: 18,color: text_color_country),
                  ),
                ),
                Text('Supplier: ${product.store}', style:TextStyle(fontFamily: 'Segoe', fontSize: 14,color: text_color_red,fontWeight: FontWeight.w600),),

                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Text('${product.price.toStringAsFixed(0)} UZS', style: TextStyle(fontFamily: 'Futura',fontWeight: FontWeight.bold, fontSize: 20,color: text_color_price,),),
                ),
                Padding(
                  padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.25,),
                  child: Text('${product.isCountable?'1 pc':'1.0 kg'}', style: TextStyle(fontFamily: 'Segoe', fontSize: 16,color: Theme.of(context).primaryColor),),
                )
              ],
            ),
            Spacer(),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Image.asset(product.isWished?'assets/images/wishlist_pressed.png':'assets/images/wishlist.png', width: 20,),
                  onPressed: (){
                    product.toggleWishedStatus();
                  },
                ),
               SizedBox(height: 50,),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(8),
                        bottomLeft: Radius.circular(0),
                      )),
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {

                    },
                  ),
                ),
              ],
            )
          ],
        ),

      ),
    );
  }
}

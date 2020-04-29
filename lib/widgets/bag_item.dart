import 'package:deliverpros/providers/shopping_bag.dart';

import '../providers/bag.dart' as shop;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class BagItem extends StatelessWidget {
  final String productId;
  BagItem(this.productId);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<shop.BagItem>(context);
    final products = Provider.of<ShoppingBag>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: double.infinity,
        color: product_background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundColor: wishlist_avatar_background,
                backgroundImage: NetworkImage(product.imageUrl),
                radius: 55,
                //child: Image.network(),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${product.title} - Made in ${product.country}',
                  style: futura_style,
                ),
                Text(
                  'Supplier: ${product.store}',
                  style: TextStyle(
                      fontFamily: 'Segoe',
                      fontSize: 13,
                      color: text_color_red,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '${(product.price*(product.quantity!=null?product.quantity:product.amount)).toStringAsFixed(0)} UZS',
                    style: futura_bold_style.copyWith(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.25,
                  ),
                  child: Text(
                    ''
                    '${product.quantity == null ? (product.amount < 1.0 ? (product.amount * 1000).toStringAsFixed(0) : product.amount.toStringAsFixed(1)) : product.quantity} '
                    '${product.quantity != null ? 'pc' : product.amount < 1.0 ? 'g' : 'kg'}',
                    style: Theme.of(context).textTheme.title.copyWith(
                        fontSize: 16, color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
            Container(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        color: bag_item_delete_container_color),
                    child: IconButton(
                      icon: Image.asset('assets/images/trash.png', height: 24,width: 24,),
                      onPressed: () {
                        print('delete pressed');
                        products.removeItem(productId);
                      },
                    ),
                  ),
                  //SizedBox(height: 50,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    margin: EdgeInsets.only(bottom: 15, right: 15),
                    padding: EdgeInsets.all(4),
                    child: Row(
                      children: <Widget>[
                        ClipOval(
                          child: Material(
                            color:
                                bag_item_minus_container_color, // button color
                            child: InkWell(
                              splashColor:
                                  bag_item_minus_pressed_color, // inkwell color
                              child: SizedBox(
                                  width: 27,
                                  height: 27,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  )),
                              onTap: () {
                                if (product.quantity != null &&
                                    product.quantity > 1) {
                                  products.notifyShoppingBag();
                                  product.changeQuantity(product.quantity - 1);
                                } else {
                                  if (product.amount > 0.4) {
                                    products.notifyShoppingBag();
                                    product.changeAmount(product.amount - 0.2);
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: Text(
                            '${product.quantity != null ? product.quantity : product.amount.toStringAsFixed(1)}',
                            style: futura_style.copyWith(color: text_color_price),
                          ),
                        ),
                        ClipOval(
                          child: Material(
                            color: bag_item_minus_pressed_color, // button color
                            child: InkWell(
                              splashColor:
                                  bag_item_minus_container_color, // inkwell color
                              child: SizedBox(
                                width: 27,
                                height: 27,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                if (product.quantity != null) {
                                  products.notifyShoppingBag();
                                  product.changeQuantity(product.quantity + 1);
                                } else {
                                  products.notifyShoppingBag();
                                  product.changeAmount(product.amount + 0.2);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

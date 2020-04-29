import 'package:deliverpros/providers/product.dart';
import 'package:deliverpros/providers/shopping_bag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;
  double amount = 1.0;

  void subtractAmount(Product product) {
    setState(() {
      if (product.isCountable && quantity > 1) {
        quantity -= 1;
      } else if (amount > 0.4) {
        amount -= 0.2;
      }
    });
  }

  void addAmount(Product product) {
    setState(() {
      if (product.isCountable) {
        quantity += 1;
      } else {
        amount += 0.2;
      }
    });
  }

  String showAmount(Product product) {
    return product.isCountable
        ? quantity.toString()
        : amount.toStringAsFixed(1);
  }

  String showTotalPrice(Product product) {
    return product.isCountable
        ? ((product.price-product.price*product.discount/100) * quantity).toStringAsFixed(0)
        : ((product.price-product.price*product.discount/100) * amount).toStringAsFixed(0);
  }

  void onPressBagIt(Product product, ShoppingBag shoppingBag) {
    if (product.isCountable) {
      shoppingBag.addItemQuantity(
          product.id,
          (product.price-product.price*product.discount/100),
          product.title,
          product.country,
          product.store,
          product.imageUrl,
          quantity);
    } else {
      shoppingBag.addItemAmount(
          product.id,
          (product.price-product.price*product.discount/100),
          product.title,
          product.country,
          product.store,
          product.imageUrl,
          amount);
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final shoppingBag = Provider.of<ShoppingBag>(context, listen: false);
    return Container(
      width: double.infinity,
      color: product_background,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.15),
              child: Image.network(
                product?.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Supplier: ${product?.store}',
                          style: TextStyle(
                              color: text_color_red,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        if(product.discount != 0)Container(
                          alignment: Alignment.center,
                          width: 63,
                          height: 32,
                          decoration: BoxDecoration(
                            color: text_color_red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('-${product.discount}%',style: TextStyle(color: Colors.white, fontSize: 16),),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      '${product?.title} - Medium',
                      style: shopping_bag_text_style.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(
                      '1 pc (80g - 150g)',
                      style: shopping_bag_text_style.copyWith(
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 80,
                      child: SingleChildScrollView(
                          child: Text(
                        '${product.description}',
                        style: TextStyle(
                            fontFamily: 'Segoe',
                            fontSize: 18,
                            color: description_color),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ClipOval(
                            child: Material(
                              color: Colors.white, // button color
                              child: InkWell(
                                splashColor:
                                    bag_item_minus_container_color, // inkwell color
                                child: SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Image.asset(
                                    'assets/images/minus.png',
                                    color: text_color_price,
                                  ),
                                ),
                                onTap: () => subtractAmount(product),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Text(
                              '${showAmount(product)}',
                              style: TextStyle(
                                  fontFamily: 'Segoe',
                                  fontSize: 20,
                                  color: text_color_price),
                            ),
                          ),
                          ClipOval(
                            child: Material(
                              color: Colors.white, // button color
                              child: InkWell(
                                splashColor:
                                    bag_item_minus_container_color, // inkwell color
                                child: SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Image.asset(
                                    'assets/images/add_2.png',
                                    color: text_color_price,
                                  ),
                                ),
                                onTap: () => addAmount(product),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${showTotalPrice(product)} UZS',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Segoe',
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 38,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                            borderRadius: BorderRadius.circular(15)),
                        child: Consumer<Product>(
                          builder: (context, prod, child) => IconButton(
                            icon: Image.asset(
                              product.isWished
                                  ? 'assets/images/wishlist_pressed.png'
                                  : 'assets/images/wishlist.png',
                              color: Theme.of(context).primaryColor,
                              width: 20,
                              height: 20,
                            ),
                            onPressed: () {
                              product.toggleWishedStatus();
                            },
                          ),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width * 0.6,
                        height: 50,
                        child: RaisedButton(
                          color: btn_color,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/handle.png',
                                color: Colors.white,
                                height: 20,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Bag It',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                          onPressed: () =>onPressBagIt(product,shoppingBag),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 47,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

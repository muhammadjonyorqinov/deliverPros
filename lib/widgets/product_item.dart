import 'package:deliverpros/constants.dart';
import 'package:deliverpros/providers/products.dart';
import 'package:deliverpros/providers/shopping_bag.dart';
import 'package:deliverpros/screens/product_detail_screen.dart';
import '../providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int quantity = 1;
  double amount = 1.0;

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final product = Provider.of<Product>(context);
    final shoppingBag = Provider.of<ShoppingBag>(context);

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
        bottomRight: Radius.circular(8),
        bottomLeft: Radius.circular(25),
      ),
      child: !product.isAddPressed
          ? GridTile(
              header: Container(
                alignment: Alignment.topRight,
                child:IconButton(
                    icon: Image.asset(product.isWished
                        ? 'assets/images/wishlist_pressed.png'
                        : 'assets/images/wishlist.png', height: 20,),
                    onPressed: () {
                      product.toggleWishedStatus();
                    },
                  ),
              ),
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.topCenter,
                  color: product_background,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 40),
                    child: Image.network(product.imageUrl),
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: product.id);
                },
              ),
              footer: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,),
                    child: Text(
                      product.title,
                      style:
                          TextStyle(fontSize: 16, fontFamily: 'Lintel', fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Made in ${product.country}',style: TextStyle(color: text_color_country, fontFamily: 'Segoe'),

                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, bottom: 6),
                    child: Text(
                      product.store,
                      style: TextStyle(
                        fontSize: 12,
                          color: text_color_red, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 25.0),
                        child: Text(
                          '${product.price.toStringAsFixed(0)} /${product.isCountable?'pc':'kg'}',
                          style: TextStyle(color: text_color_price, fontFamily: 'Futura',fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            color: btn_color,
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
                            products.closeAllPresseds();
                            product.togglePressedStatus();
                            print(product.isAddPressed);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : GridTile(
              header: Container(
                alignment: Alignment.centerRight,
                child: Consumer<Product>(
                  builder: (context, product, child) => IconButton(
                    icon: Image.asset('assets/images/cancel.png',height: 15, width: 15,),
                    onPressed: () {

                      product.togglePressedStatus();
                    },
                  ),
                ),
              ),
              child: Container(
                alignment: Alignment.topCenter,
                color: product_background,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    ClipOval(
                      child: Material(
                        color: product_background, // button color
                        child: InkWell(
                          splashColor: Colors.grey[400], // inkwell color
                          child: SizedBox(width: 28, height:28, child: Image.asset(
                            'assets/images/add_2.png',
                          )),
                          onTap: () {
                            setState(() {
                              if(product.isCountable){
                                quantity+=1;
                              }else{
                                amount+=0.2;
                              }
                            });

                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Text(
                      '${product.isCountable?quantity:amount.toStringAsFixed(1)}',
                      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 17, fontFamily: 'Segoe', fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12,),
                    ClipOval(
                      child: Material(
                        color: product_background, // button color
                        child: InkWell(
                          splashColor: Colors.grey[400], // inkwell color
                          child: SizedBox(width: 28, height:28, child: Image.asset(
                            'assets/images/minus.png',
                          )),
                          onTap: () {
                            setState(() {
                              if(product.isCountable && quantity>1){
                                quantity-=1;
                              }else if(product.isCountable && quantity==1){
                                return;
                              }else if(amount>0.21){
                                amount-=0.2;
                              }else{
                                return;
                              }
                            });

                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 17,),
                    Text(
                      '${(product.price * (product.isCountable?quantity:amount)).toStringAsFixed(0)}',
                      style: TextStyle(color: text_color_price, fontFamily: 'Futura', fontWeight:FontWeight.bold,fontSize: 24),
                    ),

                  ],
                ),
              ),
              footer: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FlatButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Image.asset('assets/images/handle.png',height: 16,),
                          SizedBox(width: 10,),
                          Text('Bag It', style: Theme.of(context).textTheme.title.copyWith(fontSize: 18),)
                        ],
                      ),
                      onPressed: (){
                        if(product.isCountable){
                          shoppingBag.addItemQuantity(
                              product.id,
                              product.price,
                              product.title,
                              product.country,
                              product.store,
                              product.imageUrl,
                              quantity);
                          quantity = 1;
                        }else {
                          shoppingBag.addItemAmount(
                              product.id,
                              product.price,
                              product.title,
                              product.country,
                              product.store,
                              product.imageUrl,
                              amount);
                          amount = 1.0;
                        };
                        },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

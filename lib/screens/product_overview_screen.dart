import 'package:deliverpros/constants.dart';
import 'package:deliverpros/providers/internet_connection.dart';
import 'package:deliverpros/providers/product_types.dart';
import 'package:deliverpros/providers/products.dart';
import 'package:deliverpros/screens/no_connection_screen.dart';
import 'package:deliverpros/screens/shopping_bag_screen.dart';
import 'package:deliverpros/screens/notifications_screen.dart';
import 'package:deliverpros/screens/products_screen.dart';
import 'package:deliverpros/screens/wishlist_screen.dart';
import 'package:deliverpros/widgets/main_drawer.dart';
import 'package:deliverpros/widgets/shimmer_products.dart';
import 'package:deliverpros/widgets/shimmer_tab.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductOverviewScreen extends StatefulWidget {
  static const routeName = "product_overview";

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool connected = false;
  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    var connection = await Provider.of<InternetConnection>(context).connectionStatus;
    setState(() {
      connected = connection;
    });
    print('connection status $connection');


  }

  @override
  Widget build(BuildContext context) {
    final types = Provider.of<ProductTypes>(context);
    return !connected ?
    NoConnectionScreen():
    DefaultTabController(
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
              icon: Image.asset(
                'assets/images/bar.png',
                height: 20,
              ),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset(
                      'assets/images/notification.png',
                      height: 30,
                    ),
                    onPressed: () {
                      //types.fetchTitles();
                      Navigator.of(context)
                          .pushNamed(NotificationsScreen.routeName);
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/images/wishlist.png',
                      height: 20,
                    ),
                    onPressed: () {
                      //products.showFavoritesOnly();
                      Navigator.of(context)
                          .pushNamed(WishlistScreen.routeName);
//                        .then((onValue) {
////                      products.showAll();
////                    }
////                    )

                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/images/bag.png',
                      height: 26,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ShoppingBagScreen.routeName);
                    },
                  )
                ],
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(96.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.black),
                            ),
                            child: TextFormField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: Image.asset(
                                  'assets/images/search.png',
                                  width: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/images/filter.png',
                            height: 20,
                          ),
                          onPressed: () {
                            Provider.of<Products>(context,listen: false).addProductsToServer();
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 48,
                    width: double.infinity,
                    child: FutureBuilder(
                      future: Provider.of<ProductTypes>(context,listen: false).fetchTitles().catchError((error){
                        if(error.toString().contains('SocketException')){
                          //Navigator.of(context).pushNamed(NoConnectionScreen.routeName);
                        }
                       //return Navigator.of(context).pushNamed(NoConnectionScreen.routeName);
                      }),
                      builder: ((context,dataSnapshot){
                        if(dataSnapshot.connectionState == ConnectionState.done){
                          return Consumer<ProductTypes>(
                            builder: ((context,types,child)=>TabBar(
                              labelStyle: kTabStyle,
                              indicatorColor: Theme.of(context).primaryColor,
                              labelColor: Theme.of(context).textTheme.title.color,
                              isScrollable: true,
                              tabs:types.titles.map((title)=>Tab(text: title.title,)).toList(),
                            )),
                          );
                        }else{
                          return ShimmerTab();
                        }
                      }),
                    ),
                  ),

                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
          drawer: MainDrawer(),
          body:FutureBuilder(
            future: Provider.of<Products>(context).getAndFetchProducts(),
            builder: ((context,dataSnapshot){
              if(dataSnapshot.connectionState == ConnectionState.done){
                return TabBarView(
                      children: types.titles.map((type)=> ProductsScreen(type.title)).toList());

              }
              else{
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ShimmerProducts(),
                );
              }
            }),
          )
      ),
      length: types.itemCount,
    );
  }
}
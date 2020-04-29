import 'package:deliverpros/constants.dart';
import 'package:deliverpros/providers/products.dart';
import 'package:deliverpros/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false).items;
    return Container(
      width: double.infinity,
      child: Drawer(
        //elevation: 0,
        child: Container(
          color: btn_color,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Text(
                        'DeliverPros',
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: drawerItems
                            .map((item) => DrawerItem(
                                title: item.title, imageUrl: item.imageUrl))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: background_transparent.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15))),
                        height: MediaQuery.of(context).size.height * 0.6,
                      ),
                    ),
                    GestureDetector(
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: background_transparent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15))),
                          margin: EdgeInsets.only(left: 28),
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 40.0, left: 25),
                                child: Image.asset(
                                  'assets/images/bar.png',
                                  width: 22,
                                ),
                              ),
                              Container(
                                height: 40,
                                margin: EdgeInsets.only(
                                  top: 30,
                                  left: 25,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Center(
                                      child: Text(
                                    'Search here',
                                    style: TextStyle(color: Colors.grey),
                                    maxLines: 1,
                                  )),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 15,
                                  left: 25,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        'Fruits',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Lintel',
                                          fontSize: 12,
                                          color: text_color_price,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 10,
                                        right: 20,
                                      ),
                                      height: 2,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: GridView(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 83 / 124,
                                      mainAxisSpacing: 20,
                                    ),
                                    children: <Widget>[
                                      GridTile(
                                        child: Container(
                                          alignment: Alignment.topCenter,
                                          decoration: BoxDecoration(
                                            color: drawer_color,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft:
                                                    Radius.circular(10)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10),
                                            child: Image.network(
                                              products[0].imageUrl,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        footer: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 16.0,
                                              ),
                                              child: Text(
                                                products[0].title,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontFamily: 'Lintel',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0),
                                              child: Text(
                                                'Made in ${products[0].country}',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: text_color_country,
                                                    fontFamily: 'Segoe'),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 16.0,
                                              ),
                                              child: Text(
                                                products[0].store,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: text_color_red,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16,
                                                          bottom: 13.0),
                                                  child: Text(
                                                    '${products[0].price.toStringAsFixed(0)} /${products[0].isCountable ? 'pc' : 'kg'}',
                                                    style: TextStyle(
                                                        color: text_color_price,
                                                        fontFamily: 'Futura',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (products.asMap().containsKey(2))
                                        GridTile(
                                          child: Container(
                                            alignment: Alignment.topCenter,
                                            decoration: BoxDecoration(
                                              color: drawer_color,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10)),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0, top: 10),
                                              child: Image.network(
                                                products[2].imageUrl,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          footer: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 16.0,
                                                ),
                                                child: Text(
                                                  products[2].title,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontFamily: 'Lintel',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Text(
                                                  'Made in ${products[2].country}',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: text_color_country,
                                                      fontFamily: 'Segoe'),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 16.0,
                                                ),
                                                child: Text(
                                                  products[0].store,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: text_color_red,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 16,
                                                            bottom: 13.0),
                                                    child: Text(
                                                      '${products[2].price.toStringAsFixed(0)} /${products[2].isCountable ? 'pc' : 'kg'}',
                                                      style: TextStyle(
                                                          color:
                                                              text_color_price,
                                                          fontFamily: 'Futura',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
//                              Container(
//                                margin: EdgeInsets.only(top:20,left: 25),
//                                decoration: BoxDecoration(
//                                  color: drawer_color,
//                                  borderRadius: BorderRadius.only(
//                                    topLeft: Radius.circular(10),
//                                    bottomLeft: Radius.circular(10),
//                                  ),
//                                ),
//                                height: 180,
//                                width: double.infinity,
//                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

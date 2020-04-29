import 'package:connectivity/connectivity.dart';
import 'package:deliverpros/constants.dart';
import 'package:deliverpros/providers/cards.dart';
import 'package:deliverpros/providers/product_types.dart';
import 'package:deliverpros/providers/products.dart';
import 'package:deliverpros/providers/shopping_bag.dart';
import 'package:deliverpros/screens/add_card_screen.dart';
import 'package:deliverpros/screens/code_screen.dart';
import 'package:deliverpros/screens/delivery_screen.dart';
import 'package:deliverpros/screens/instruction_all_screen.dart';
import 'package:deliverpros/screens/instruction_first_screen.dart';
import 'package:deliverpros/screens/my_wallets_screen.dart';
import 'package:deliverpros/screens/no_connection_screen.dart';
import 'package:deliverpros/screens/product_detail_screen.dart';
import 'package:deliverpros/screens/registration_screen.dart';
import 'package:deliverpros/screens/shopping_bag_screen.dart';
import 'package:deliverpros/screens/notifications_screen.dart';
import 'package:deliverpros/screens/product_overview_screen.dart';
import 'package:deliverpros/screens/wishlist_screen.dart';
import 'package:deliverpros/univ/auth_screen.dart';
import 'package:deliverpros/univ/user_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'providers/internet_connection.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light
  ));
  runApp(MyApp());

}

class MyApp extends StatefulWidget {



  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: ShoppingBag()),
        ChangeNotifierProvider.value(value: ProductTypes()),
        ChangeNotifierProvider.value(value: InternetConnection()),
        ChangeNotifierProvider.value(value: Cards()),
        ChangeNotifierProvider.value(value: UserConnection()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xff557ad0),
          primarySwatch: Colors.blue,
          accentColor: text_color_price,
          textTheme: TextTheme(title: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color:text_color_price)),
        ),
        initialRoute: AuthScreen.routeName,

        routes: {
          ProductOverviewScreen.routeName: (context)=> ProductOverviewScreen(),
          NotificationsScreen.routeName: (context)=> NotificationsScreen(),
          ShoppingBagScreen.routeName: (context)=> ShoppingBagScreen(),
          WishlistScreen.routeName: (context)=> WishlistScreen(),
          ProductDetailScreen.routeName: (context)=> ProductDetailScreen(),
          DeliveryScreen.routeName: (context)=> DeliveryScreen(),
          InstructionFirstScreen.routeName: (context)=> InstructionFirstScreen(),
          InstructionAllScreen.routeName: (context)=> InstructionAllScreen(),
          RegistrationScreen.routeName: (context)=> RegistrationScreen(),
          CodeScreen.routeName: (context)=> CodeScreen(),
          NoConnectionScreen.routeName: (context)=> NoConnectionScreen(),
          AddCard.routeName: (context)=> AddCard(),
          MyWalletsScreen.routeName: (context)=> MyWalletsScreen(),




          /////////////////////////////
          AuthScreen.routeName:(contex)=>AuthScreen(),
        },
      ),
    );
  }
}

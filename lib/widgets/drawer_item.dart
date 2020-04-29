import 'package:deliverpros/providers/products.dart';
import 'package:deliverpros/screens/my_wallets_screen.dart';
import 'package:deliverpros/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class DrawerItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  DrawerItem({this.title,this.imageUrl});


  void itemsPressed(String title,Products products, BuildContext context){
    switch(title){
      case 'Change supplier':
        break;
      case 'All categories':
        break;
      case 'My cards & wallets':
        Navigator.of(context).pushNamed(MyWalletsScreen.routeName);
        break;
      case 'Address':
        break;
      case 'Wishlist':
        Navigator.of(context).pushNamed(WishlistScreen.routeName);
        break;
      case 'My orders':
        break;
      case  'Call-center':
        break;
      case 'F.A.Q':
        break;
      case 'Public offer':
        break;
      case 'Language':
        break;
      case 'My Profile':
        break;
      case 'Log out':
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: Image.asset(imageUrl, color: Colors.white, height: 22, width: 22,),
          title: Text(title,style: TextStyle(color: Colors.white, fontSize: 16,),maxLines: 1,softWrap: true,),
          trailing: Image.asset('assets/images/arrow.png',height: 16, color: Colors.white,),
          enabled: true,
          onTap:()=> itemsPressed(title,products,context),
        ),
        Divider()
      ],
    );
  }
}

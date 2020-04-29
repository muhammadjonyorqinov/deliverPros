import 'package:deliverpros/constants.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget getAppBar(BuildContext context){
  return PreferredSize(
    preferredSize: Size.fromHeight(96),
    child: AppBar(
      iconTheme:IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70))
      ),
      title: Container(
          padding: EdgeInsets.only(bottom:16,top: 35),
          child: Text('Notifications', style: Theme.of(context).textTheme.title,)),),

  );
}

class NotificationsScreen extends StatelessWidget {
  static const String routeName = 'notifications_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: Center(child: Text('No notifications yet', style: TextStyle(color: text_color_price, fontSize: 20),)),
    );
  }
}

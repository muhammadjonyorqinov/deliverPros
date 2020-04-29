import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  final String title;
  CustomAppBar(this.title);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(90),
      child: AppBar(
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70))
        ),
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(title, style: Theme.of(context).textTheme.title,)),
        ),),

    );
  }
}

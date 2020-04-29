import 'package:deliverpros/constants.dart';
import 'package:deliverpros/providers/internet_connection.dart';
import 'package:deliverpros/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NoConnectionScreen extends StatefulWidget {
  static const String routeName = 'no_connection';

  @override
  _NoConnectionScreenState createState() => _NoConnectionScreenState();
}

class _NoConnectionScreenState extends State<NoConnectionScreen> {
  var connected = false;

  @override
  void didChangeDependencies() async{

    super.didChangeDependencies();

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/internet.png', height: 250,fit: BoxFit.cover,),
              Text('NO INTERNET CONNECTION', style: futura_bold_style.copyWith(color: text_color_price),),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  color: Theme.of(context).primaryColor,
                  child: Text('TRY AGAIN', style: futura_bold_style.copyWith(color: Colors.white),
                  ),
                  onPressed: ()async{
                    final connection =await Provider.of<InternetConnection>(context,listen: false).connectionStatus;
                    if(connection) {
                      Navigator.of(context).pushReplacementNamed(
                          ProductOverviewScreen.routeName);
                    }
                  },
                ),
              )

            ],
          )),
    );
  }
}

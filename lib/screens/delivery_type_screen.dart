import 'package:deliverpros/constants.dart';
import 'package:deliverpros/providers/delivery_types.dart';
import 'package:deliverpros/widgets/date_item.dart';
import 'package:deliverpros/widgets/speed_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class DeliveryTypeScreen extends StatelessWidget {

  final Function changeTabs;
  DeliveryTypeScreen(this.changeTabs);

  List<Map<String, Object>> get dates{

    return List.generate(30, (index){
      final weekDay = DateTime.now().add(Duration(days: index));
      return { 'date': weekDay};
    });
  }


  @override
  Widget build(BuildContext context) {
    final deliveries = Provider.of<DeliveryTypes>(context);
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top:30, left: 30),
                      child: Text('Select Speed', style: TextStyle(color: icon_color,fontSize: 20),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left:30,top:25, bottom: 25),
                      height: MediaQuery.of(context).size.width*0.4,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index)=>ChangeNotifierProvider.value(
                            value: deliveries.items[index],
                            child: SpeedItem()),
                        itemCount: deliveries.items.length,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:30.0),
                      child: Text('Select Date', style: TextStyle(color: icon_color,fontSize: 20),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left:30, top: 25),
                      height: 60,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dates.length,
                        itemBuilder: (context, index)=>DateItem(DateFormat('dd MMMM').format(dates[index]['date']).substring(0,6)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:30, top:30.0),
                      child: Text('Select Time', style: TextStyle(color: icon_color,fontSize: 20),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left:30,top: 25),
                      height: 60,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dates.length,
                        itemBuilder: (context, index)=>DateItem(DateFormat('dd MMMM').format(dates[index]['date']).substring(0,6)),
                      ),
                    ),


                  ],
                ) ,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: EdgeInsets.only(left:(MediaQuery.of(context).size.width * 0.1),right:(MediaQuery.of(context).size.width * 0.1),bottom:  50),
            child: ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: RaisedButton(
                disabledColor: text_color,
                color: btn_color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/arrow_right.png'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'CONTINUE',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                onPressed:changeTabs,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

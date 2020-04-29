import 'package:deliverpros/constants.dart';
import 'package:flutter/material.dart';


class DeliveryAddressScreen extends StatelessWidget {

  final Function changeTabs;
  DeliveryAddressScreen(this.changeTabs);



  void onChangePressed(){

  }


  @override
  Widget build(BuildContext context) {
    return Stack(

      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:30.0, right: 30, top: 48, bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: product_background
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text('Mukhammadjon Yorkinov', style: TextStyle(color: icon_color,fontSize: 18),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('assets/images/checkbox.png'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: product_background
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:42.0, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Shipping address', style: futura_bold_style.copyWith(fontSize: 18,color: text_color_price),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Image.asset('assets/images/truck.png',height: 21, width: 28,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width*0.5,
                                      child: Text('10/12 Ziyolilar st. Mirzo Ulug\'bek District, Tashkent', style:TextStyle(fontFamily: 'Futura',fontWeight: FontWeight.normal ,fontSize: 16, color: text_color_price.withOpacity(0.41)) ,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Material(
                                  color: product_background, // button color
                                  child: InkWell(
                                    splashColor:
                                    bag_item_minus_container_color, // inkwell color
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: btn_color)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('CHANGE',style: futura_bold_style.copyWith(color: text_color_price,fontSize: 16),),
                                        )),
                                    onTap: onChangePressed,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: product_background,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Text('Comment',style: futura_bold_style.copyWith(color: text_color_price,fontSize: 18),),
                ),
              ),
              Container(
                height: 120,
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: product_background,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Container(
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      autofocus: false,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                      hintText: 'write here ...',
                      border: InputBorder.none,

//                focusedBorder: InputBorder.none,
//                enabledBorder: InputBorder.none,
//                errorBorder: InputBorder.none,
//                disabledBorder: InputBorder.none,
                      contentPadding:
                      EdgeInsets.only(bottom: 11,),
                    ),),
                  ),

                ),
              ),

            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50,horizontal:(MediaQuery.of(context).size.width * 0.1)),
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
                onPressed: changeTabs,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

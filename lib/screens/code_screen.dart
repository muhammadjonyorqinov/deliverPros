import 'package:deliverpros/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CodeScreen extends StatefulWidget {
  static const String routeName = 'code_screen';

  @override
  _CodeScreenState createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  FocusNode _node1 = FocusNode();
  FocusNode _node2 = FocusNode();
  FocusNode _node3 = FocusNode();
  FocusNode _node4 = FocusNode();


  @override
  void dispose() {
    _node1.dispose();
    _node2.dispose();
    _node3.dispose();
    _node4.dispose();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: 65.0,
            left: 30,
            bottom: 5,
            right: 30,
        ),
        alignment: Alignment.topLeft,
        color: product_background,
        width: double.infinity,
        child: GestureDetector(
          //behavior: HitTestBehavior.opaque,
          onTap: (){
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: text_color_price,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Center(
                      child: Text(
                    '+998 91 174 47 41',
                    style: futura_bold_style.copyWith(
                        color: text_color_price, fontSize: 21),
                  )),
                ),
                Center(
                    child: Text(
                  'We have sent you a verification code',
                  style:
                      futura_style.copyWith(color: code_text_color, fontSize: 14),
                )),
                Container(
                  margin: EdgeInsets.only(top:70,bottom: 20),

                  child: Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          width:60,
                          height: 81,
                          child: Center(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.none,
                              focusNode: _node1,
                              textAlign: TextAlign.center,
                              //maxLength: 1,
                              style: TextStyle(fontSize: 50),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value){
                                if(value.length == 1){
                                  FocusScope.of(context).requestFocus(_node2);
                                }
                              },
                              //maxLines: 1,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          width:60,
                          height: 81,
                          child: Center(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.none,
                              focusNode: _node2,
                              textAlign: TextAlign.center,
                              //maxLength: 1,
                              style: TextStyle(fontSize: 50),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value){
                                if(value.length == 1){
                                  FocusScope.of(context).requestFocus(_node3);
                                }
                                if(value.length == 0){
                                  FocusScope.of(context).requestFocus(_node1);
                                }
                              },
                              //maxLines: 1,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),

                          width:60,
                          height: 81,
                          child: Center(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              focusNode: _node3,
                              textAlign: TextAlign.center,
                              textInputAction: TextInputAction.none,
                              //maxLength: 1,
                              style: TextStyle(fontSize: 50),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value){
                                if(value.length == 1){
                                  FocusScope.of(context).requestFocus(_node4);
                                }
                                if(value.length == 0){
                                  FocusScope.of(context).requestFocus(_node2);
                                }
                              },
                              //maxLines: 1,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),

                          width:60,
                          height: 81,
                          child: Center(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              focusNode: _node4,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 50),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value){
                                if(value.length >=1){
                                  FocusScope.of(context).requestFocus(FocusNode());
                                }
                                if(value.length == 0){
                                  FocusScope.of(context).requestFocus(_node3);
                                }
                              },

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: FlatButton(
                    child: Text('Resend code', style: TextStyle(color: register_text_color,fontSize: 14),),
                    onPressed: (){

                    },
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 25),
                  //padding: EdgeInsets.symmetric(horizontal: 60),
                  child: FlatButton(
                    color: btn_color,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Text('FINISH REGISTRATION',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                    onPressed: (){
                      Navigator.pushNamed(context, ProductOverviewScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

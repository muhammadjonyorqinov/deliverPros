import 'package:deliverpros/constants.dart';
import 'package:deliverpros/providers/card.dart' as c;
import 'package:flutter/material.dart';



class AddCard extends StatefulWidget {
  static const String routeName = 'add_card';

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  FocusNode _nameNode = FocusNode();
  FocusNode _numberNode = FocusNode();
  FocusNode _dateNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var card = c.Card(
      id: null,
      holderName: '',
      cardNumber: '',
      expiryDate: '',
  );


  @override
  void dispose() {
    _nameNode.dispose();
    _dateNode.dispose();
    _numberNode.dispose();
    super.dispose();

  }

  void onConfirm(){
    if(!_form.currentState.validate()){
      return;
    }


    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 40),
                alignment: Alignment.centerRight,
                child:IconButton(
                  icon: Image.asset('assets/images/cancel.png', height: 18, width: 18,color: icon_color,),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },),

            ),

            Padding(
              padding: const EdgeInsets.only(bottom:35.0),
              child: Text('Add Card',style: TextStyle(color: icon_color,fontSize: 20,),textAlign: TextAlign.center,),
            ),
            Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment:Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 60,
                    decoration: BoxDecoration(
                      color: product_background,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/images/account.png'),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left:16.0),
                              child: TextFormField(
                                focusNode: _nameNode,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(color: text_color_price,fontSize: 18),
                                decoration: InputDecoration(
                                  hintText: 'Cardholder Name',
                                  hintStyle: TextStyle(color: speed_text_color,fontSize: 18),
                                  border: InputBorder.none
                                ),
                                onFieldSubmitted: (_){
                                  FocusScope.of(context).requestFocus(_numberNode);
                                },
                                onSaved: (value){
                                  card = c.Card(
                                    id: card.id,
                                    holderName: value,
                                    cardNumber: card.cardNumber,
                                    expiryDate: card.expiryDate,
                                  );
                                },
                                validator: (value){
                                  RegExp reg = RegExp(r'^\D*$',caseSensitive: false,
                                    multiLine: false,);
                                  if(!reg.hasMatch(value)){
                                    return 'A-Z letters only';
                                  }else
                                  if(value.isEmpty){
                                    return 'This field is required';
                                  }
                                  else{
                                    return null;
                                  }

                                },

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    alignment:Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 60,
                    decoration: BoxDecoration(
                        color: product_background,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/images/pay.png',height: 18,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left:16.0),
                              child: TextFormField(
                                focusNode: _numberNode,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(color: text_color_price,fontSize: 18),
                                decoration: InputDecoration(
                                    hintText: 'Card Number',
                                    hintStyle: TextStyle(color: speed_text_color,fontSize: 18),
                                    border: InputBorder.none
                                ),
                                onFieldSubmitted: (_){
                                  FocusScope.of(context).requestFocus(_dateNode);
                                },
                                onSaved: (value){
                                  card = c.Card(
                                    id: card.id,
                                    holderName: card.holderName,
                                    cardNumber: value,
                                    expiryDate: card.expiryDate,
                                  );
                                },
                                validator: (value){
                                  RegExp reg = RegExp(r'^8600+\d*$',caseSensitive: false,
                                    multiLine: false,);
                                  if(!reg.hasMatch(value)){
                                    return '1-9 numbers only';
                                  }else
                                  if(value.length<16 ||value.length>16){
                                    return '16 digits only';
                                  }else
                                  if(value.isEmpty){
                                    return 'This field is required';
                                  }
                                  else{
                                    return null;
                                  }

                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    alignment:Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 60,
                    decoration: BoxDecoration(
                        color: product_background,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/images/calendar.png'),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left:16.0),
                              child: TextFormField(
                                focusNode: _dateNode,
                                textInputAction: TextInputAction.done,
                                style: TextStyle(color: text_color_price,fontSize: 18),
                                decoration: InputDecoration(
                                    hintText: 'Expiry Date',
                                    hintStyle: TextStyle(color: speed_text_color,fontSize: 18),
                                    border: InputBorder.none
                                ),
                                onSaved: (value){
                                  card = c.Card(
                                    id: card.id,
                                    holderName: card.holderName,
                                    cardNumber: card.cardNumber,
                                    expiryDate: value,
                                  );
                                },
                                validator: (value){
                                  RegExp reg = RegExp(r'^[0-1][0-9][2-9][0-9]$',caseSensitive: false,
                                    multiLine: false,);
                                  if(!reg.hasMatch(value)){
                                    return '1-9 numbers only';
                                  }else
                                  if(value.length<4 ||value.length>4){
                                    return '4 digits only';
                                  }else
                                  if(value.isEmpty){
                                    return 'This field is required';
                                  }
                                  else{
                                    return null;
                                  }

                                },

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 80,horizontal:30),
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
                              'CONFIRM',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        onPressed: onConfirm,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

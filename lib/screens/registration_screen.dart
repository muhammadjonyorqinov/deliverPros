import 'package:deliverpros/constants.dart';
import 'package:deliverpros/models/person.dart';

import 'package:deliverpros/screens/code_screen.dart';
import 'package:flutter/material.dart';



class RegistrationScreen extends StatefulWidget {
  static const routeName = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FocusNode _phoneFocusNode = FocusNode();
  FocusNode _addressFocusNode = FocusNode();
  FocusNode _streetFocusNode = FocusNode();
  FocusNode _houseFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var addressValue = regions[0];
  var person = Person(
      id:null,
      fullName: '',
      region: '',
      street: '',
      house: '',
      phoneNumber: '',
  );


  void _onSubmit(){
    if(!_form.currentState.validate()){
      return;
    }
    if(addressValue == regions[0]){
      return;
    }
    Navigator.of(context).pushNamed(CodeScreen.routeName);
  }
  
  

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _addressFocusNode.dispose();
    _streetFocusNode.dispose();
    _houseFocusNode.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          color: product_background,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top:65.0,left: 30,bottom: 30,right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back,color: text_color_price,size: 30,),
                    onPressed: (){
                      print(('pressed'));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Registration',style: futura_bold_style.copyWith(color: register_text_color,fontSize: 20),),
                  ),
                  Center(child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/images/purchase.png',height: 115,),
                  ),),
                  Form(
                    key: _form,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,borderRadius: BorderRadius.circular(10)
                          ),

                          height: 53,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Image.asset('assets/images/profile_small.png',height: 20, width: 20,),
                              ),
                              Expanded(
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  maxLines: 1,
                                  textCapitalization: TextCapitalization.words,
                                  style:futura_style.copyWith(color:text_color_price,fontSize: 16) ,
                                  decoration: InputDecoration(
                                      errorMaxLines: 1,
                                      border: InputBorder.none,
                                      hintStyle: futura_style.copyWith(color: Colors.grey,fontSize: 16),
                                      hintText: 'First & Last Name'
                                  ),
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(_phoneFocusNode);
                                  },
                                  onSaved: (value){
                                    person = Person(
                                      id:person.id,
                                      fullName: value,
                                      region: person.region,
                                      street: person.street,
                                      house: person.house,
                                      phoneNumber:person.phoneNumber,
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
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,borderRadius: BorderRadius.circular(10)
                          ),

                          height: 53,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Image.asset('assets/images/flag.png',height: 20, width: 20,),
                              ),
                              Expanded(
                                child: TextFormField(
                                  focusNode: _phoneFocusNode,
                                  textInputAction: TextInputAction.next,
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                  style:futura_style.copyWith(color:text_color_price,fontSize: 16) ,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixText:'+998',
                                    prefixStyle: futura_style.copyWith(color: text_color_price,fontSize: 16),

                                  ),
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(_addressFocusNode);
                                  },
                                  onSaved: (value){
                                    person = Person(
                                      id:person.id,
                                      fullName: person.fullName,
                                      region: person.region,
                                      street: person.street,
                                      house: person.house,
                                      phoneNumber:value,
                                    );
                                  },
                                  validator: (value){
                                    RegExp reg = RegExp(r'^\d*$',caseSensitive: false,
                                      multiLine: false,);
                                    if(!reg.hasMatch(value)){
                                      return '1-9 numbers only';
                                    }else
                                    if(value.length<9 ||value.length>9){
                                      return 'Provide correct number';
                                    }else
                                    if(value.isEmpty){
                                      return 'This field is required';
                                    }
                                    else{
                                      return null;
                                    }

                                  },

                                ),
                              )
                            ],
                          ),
                        ),
                        Text('Address',style: futura_bold_style.copyWith(color: register_text_color,fontSize: 20),),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,borderRadius: BorderRadius.circular(10)
                          ),

                          height: 53,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Image.asset('assets/images/asia.png',height: 20,),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right:10.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      value: addressValue,
                                      focusNode: _addressFocusNode,
                                      isExpanded: true,
                                      items: regions.map((region){
                                        return DropdownMenuItem(
                                          value: region,
                                          child: Text('$region', style: addressValue == regions[0]?futura_style:futura_style.copyWith(color: text_color_price),),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          addressValue = value;
                                        });
                                          person = Person(
                                            id:person.id,
                                            fullName: person.fullName,
                                            region: value,
                                            street: person.street,
                                            house: person.house,
                                            phoneNumber:person.phoneNumber,
                                          );
                                        FocusScope.of(context).requestFocus(_streetFocusNode);
                                    },
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,borderRadius: BorderRadius.circular(10)
                          ),

                          height: 53,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Image.asset('assets/images/street.png',height: 20, width: 20,),
                              ),
                              Expanded(
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  focusNode: _streetFocusNode,
                                  maxLines: 1,
                                  textCapitalization: TextCapitalization.words,
                                  style:futura_style.copyWith(color:text_color_price,fontSize: 16) ,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: futura_style.copyWith(color: Colors.grey,fontSize: 16),
                                      hintText: 'Street'
                                  ),
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(_houseFocusNode);
                                  },
                                  onSaved: (value){
                                    person = Person(
                                      id:person.id,
                                      fullName: person.fullName,
                                      region: person.region,
                                      street: value,
                                      house: person.house,
                                      phoneNumber:person.phoneNumber,
                                    );
                                  },
                                  validator: (value){
                                    if(value.isEmpty){
                                      return 'This field is required';
                                    }
                                    else{
                                      return null;
                                    }

                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,borderRadius: BorderRadius.circular(10)
                          ),
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 53,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Image.asset('assets/images/house.png',height: 20, width: 20,),
                              ),
                              Expanded(
                                child: TextFormField(
                                  focusNode: _houseFocusNode,
                                  maxLines: 1,
                                  textInputAction: TextInputAction.done,
                                  textCapitalization: TextCapitalization.words,
                                  style:futura_style.copyWith(color:text_color_price,fontSize: 16) ,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: futura_style.copyWith(color: Colors.grey,fontSize: 16),
                                      hintText: 'House'
                                  ),
                                  onSaved: (value){
                                    person = Person(
                                      id:person.id,
                                      fullName: person.fullName,
                                      region: person.region,
                                      street: person.street,
                                      house: value,
                                      phoneNumber:person.phoneNumber,
                                    );
                                  },
                                  validator: (value){
                                    if(value.isEmpty){
                                      return 'This field is required';
                                    }
                                    else{
                                      return null;
                                    }

                                  },

                                ),
                              )
                            ],
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
                            child: Text('SUBMIT',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                            onPressed: _onSubmit,
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

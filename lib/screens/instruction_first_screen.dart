import 'package:deliverpros/constants.dart';
import 'package:deliverpros/screens/instruction_all_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class InstructionFirstScreen extends StatelessWidget {
  static const String routeName = 'instruction_first';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Image.asset('assets/images/back1.png', fit: BoxFit.cover,)),
              Positioned(
                top: MediaQuery.of(context).size.height*0.3,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('STAY HOME',
                      style:TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: instruction_btn_color,),),
                    Text('WE DELIVER!',
                      style:TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal,
                        fontSize: 26,
                      ),),
                  ],
                ),
              ),
              Image.asset('assets/images/back2.png', fit: BoxFit.cover,),
              Positioned(
                  top: 100,
                  child: Image.asset('assets/images/cloud.png',height: 80,),),
              Positioned(
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70),bottomRight: Radius.circular(50)),
                  child: Material(
                    color: instruction_btn_color, // button color
                    child: InkWell(
                      splashColor:speed_container_color, // inkwell color
                      child: Container(
                          height: 60,
                          width: 150,
                          child: Center(child: Text('Get Started',style: TextStyle(fontFamily: 'Segoe',color: Colors.white,fontSize: 17),))),
                      onTap: (){
                        Navigator.of(context).pushReplacementNamed(InstructionAllScreen.routeName);
                      },
                    ),
                  ),
                ),
              ),


            ],

          ),
        ),
      ),
    );
  }
}

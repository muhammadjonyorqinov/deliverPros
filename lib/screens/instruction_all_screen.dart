import 'package:deliverpros/constants.dart';
import 'package:deliverpros/screens/registration_screen.dart';
import 'package:deliverpros/widgets/instruction_item.dart';
import 'package:deliverpros/widgets/sample_flat_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class InstructionAllScreen extends StatefulWidget {
  static const String routeName = 'instructions_all';

  @override
  _InstructionAllScreenState createState() => _InstructionAllScreenState();
}

class _InstructionAllScreenState extends State<InstructionAllScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;


  List<Widget> buildPageIndicator(){
    List<Widget> list = [];
    for(int i = 0; i<_numPages;i++){
      list.add(i == _currentPage?_indicator(true):_indicator(false));
    }
    return list;

  }

  Widget _indicator(bool isActive){
    return AnimatedContainer(duration: Duration(microseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8),
      height: 8,
      width: isActive?18:16,
      decoration: BoxDecoration(color: isActive?instruction_indicator_color:instruction_indicator_unselect_color,borderRadius: BorderRadius.circular(12)),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:70.0,left: 50),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: instruction_back_btn_color.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(50)
                ),
                alignment: Alignment.center,
                child: IconButton(
                  icon: Image.asset('assets/images/left_arrow.png',height: 21,width: 12,),
                  onPressed: (){
                    SystemNavigator.pop();
                  },
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.65,
              child: PageView(
                physics: ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int val){
                  setState(() {
                    _currentPage = val;
                  });
                },
                children: instructions.map((instruct)=>InstructionItem(instruct)).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildPageIndicator(),
            ),
            _currentPage!= _numPages-1?
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.symmetric(horizontal:60.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SampleFlatButton(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Skip', style: TextStyle(color: icon_color),),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          bgcolor: Colors.white,
                          onPressed: (){
                            Navigator.of(context).pushNamed(RegistrationScreen.routeName);
                          },
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: instruction_back_btn_color.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward,size: 30,),
                            onPressed: (){
                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                  ),
                ):Container(
              height: 60,
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: FlatButton(
                color: btn_color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.arrow_forward,color: Colors.white,),
                    SizedBox(width: 10,
                    ),
                    Text('GET STARTED',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                  ],
                ),
                onPressed: (){
                  Navigator.of(context).pushNamed(RegistrationScreen.routeName);
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}

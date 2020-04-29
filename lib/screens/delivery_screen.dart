import 'package:deliverpros/constants.dart';
import 'package:deliverpros/providers/delivery_types.dart';
import 'package:deliverpros/screens/delivery_address_screen.dart';
import 'package:deliverpros/screens/delivery_payment_screen.dart';
import 'package:deliverpros/screens/delivery_type_screen.dart';
import 'package:deliverpros/screens/order_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget getAppBar(BuildContext context, TabController tabController) {

  return PreferredSize(
    preferredSize: Size.fromHeight(150),
    child: AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      title: Text(
        'Delivery',
        style: TextStyle(
            fontFamily: 'Montserrat',
            color: text_color_price,
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(52),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
          child: TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,

            indicatorColor: Colors.blue,

            unselectedLabelColor: Colors.white,
            indicator: BoxDecoration(
              color: btn_color,
                  borderRadius: BorderRadius.circular(50)
            ),
            tabs: <Widget>[
              Tab(
                icon: Image.asset('assets/images/icon-location.png', height: 52, width: 28,color:tabController.index == 0
                    ? Colors.white
                    : icon_color),
              ),
              Tab(
                icon: Image.asset('assets/images/icon-delivery.png', height: 52, width: 28,color:tabController.index == 1
                    ? Colors.white
                    : icon_color),
              ),
              Tab(
                icon: Image.asset('assets/images/icon-payment.png', height: 52, width: 28,color:tabController.index == 2
                    ? Colors.white
                    : icon_color),
              ),
              Tab(
                icon: Image.asset('assets/images/icon-summary.png', height:52, width: 28,color:tabController.index == 3
                    ? Colors.white
                    : icon_color),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class DeliveryScreen extends StatefulWidget {
  static const String routeName = 'delivery_screen';

  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void nextTab(){
    _tabController.animateTo((_tabController.index+1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, _tabController),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: <Widget>[
          DeliveryAddressScreen(nextTab),
          ChangeNotifierProvider.value(
              value: DeliveryTypes(),
              child: DeliveryTypeScreen(nextTab)),
          DeliveryPaymentScreen(),
          OrderSummaryScreen(),
        ],
      ),
    );
  }
}

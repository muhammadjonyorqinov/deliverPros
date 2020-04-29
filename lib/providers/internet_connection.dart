import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';



class InternetConnection with ChangeNotifier{


  Future<bool> get connectionStatus async{

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||connectivityResult == ConnectivityResult.wifi ) {
      return true;
    } else{
      return false;
    }
  }

}
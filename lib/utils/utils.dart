import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/splash_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:prefs/prefs.dart';
import 'commons.dart';
import 'constants.dart';



class Utils{
  Future<void>showAlertMessage(BuildContext context, String message, Function() onpress){
    return showDialog(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("GASP", style: TextStyle(color: Theme.of(context).primaryColor),),
          content: Text(message,  textAlign: TextAlign.center,),
          actions: <Widget>[
            TextButton(
                child: Text("Oui", style: TextStyle(color: Colors.red),),
                onPressed: onpress
            ),
            TextButton(
              child: Text("Non",  style: TextStyle(color: Theme.of(context).primaryColor),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void>showAlertSimpleMessage(BuildContext context, String message, Function() onpress){
    return showDialog(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Image.asset("assets/images/logo.png", height: 50.0,)),
          content: Text(message, textAlign: TextAlign.center,),
          actions: <Widget>[
            TextButton(
              child: Text("OK",  style: TextStyle(color: Theme.of(context).primaryColor),),
              onPressed: onpress,
            ),
          ],
        );
      },
    );
  }


  Future<void>showAlertDoubleMessage(BuildContext context, String message, String action1, String action2, Function() onpress1, Function() onpress2){
    return showDialog(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Image.asset("assets/images/logo.png", height: 50.0,)),
          content: Container(
            width: double.infinity,
            // height: 80,
              child: Text(message,  textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2,)),
          actions: <Widget>[
            TextButton(
              child: Text(action1,  style: TextStyle(color: Colors.red),),
              onPressed: onpress1,
            ),
            TextButton(
              child: Text(action2,  style: TextStyle(color: Theme.of(context).primaryColor),),
              onPressed: onpress2,
            ),
          ],
        );
      },
    );
  }


  loadingDialog(BuildContext context, {String? msg}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            height: 170.0,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SpinKitRing(
                  color: Theme.of(context).primaryColor,
                  lineWidth: 1.5,
                  size: 35.0,
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(msg == null ? 'Chargement en cours...' : msg, textAlign: TextAlign.center,),
              ],
            ),
          ),
        );
      },
    );
  }

  logout(BuildContext context) async {
    Prefs.init();
    Prefs.setString(APP_USER, null);
    Commons.user = null;
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>  SplashScreen()), (Route<dynamic> route) => false);
  }
}
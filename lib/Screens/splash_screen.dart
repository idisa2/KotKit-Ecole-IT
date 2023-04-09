// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' if (dart.library.html) 'dart:html';

import 'package:prefs/prefs.dart';

import '../models/user.dart';
import '../utils/commons.dart';
import '../utils/constants.dart';
import 'Login/login_screen.dart';
import 'Profil/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> navigationPage() async {
    print("--------------------------splash screen navigationPage");

      print("--------------------------splash screen navigationPage kIsWeb");
      print("--------------------------splash screen navigationPage kIsWeb 0");
      print("--------------------------splash screen navigationPage kIsWeb 1");

      String userData = Prefs.getString(APP_USER);
      print("--------------------------splash screen navigationPage kIsWeb 2");

      if (userData.isEmpty) {
        print("--------------------------splash screen navigationPage kIsWeb 3");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return  LoginScreen();
            },
          ),
        );
        
        print("--------------------------splash screen navigationPage kIsWeb 4");
      }
      else {
        print("--------------------------splash screen navigationPage kIsWeb 5");
        print("--------------------------splash screen navigationPage kIsWeb 5 0 userData : $userData - ${userData.runtimeType}");
        Map<String, dynamic> mapData = json.decode(userData);
        print("--------------------------splash screen navigationPage kIsWeb 5 0 userData : $mapData -  ${mapData.runtimeType} - ${mapData["groups"]}");

        mapData.forEach((key, value) {
          print('------------------$key : $value');
        });


        AppUser localUser = AppUser.fromJson(mapData as Map<String, dynamic>);
        print("--------------------------splash screen navigationPage kIsWeb 6");
        Commons.user = localUser;
        print("--------------------------splash screen navigationPage kIsWeb 7");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return  HomeScreen();
            },
          ),
        );

        print("--------------------------splash screen navigationPage kIsWeb 8");

      }

      print("--------------------------splash screen navigationPage !kIsWeb");
  }

  startTime() async {
    var _duration = const Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    Prefs.init();

    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Wellcome to KotKit,\n your favourite app!"),
      ),
    );
  }
}

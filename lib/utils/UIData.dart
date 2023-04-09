import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'commons.dart';

class UIData {
  //strings
  static const String appName = "VBG";

  //Colors
  static Color ColorsPrimary = Color(0xFFEA4549);
  static Color primary = Color(0xFF165DA4);
  static Color green = Color(0xFF54B676);
  static Color secondGreen = Color(0xFF59BA24);
  static Color lightGrey = Color(0xFFE7E4E6);
  static Color darkGrey = Color(0xFF5C5C5C);
  static Color Grey70 = Color(0xFF999898);
  static Color Grey80 = Color(0xFF7A7778);
  static Color Grey20 = Color(0xFFCBCBCB);
  static Color Grey10 = Color(0xFFEAEBEF);
  static Color Grey5 = Color(0xFFF5F5F2);
  static Color blueSky = Color(0xFF7CC8D7);
  static Color lightGreen = Color(0xFF49A591);

  static Color red = Color(0xFFA23417);

  static Color loadColor(statut) {
    if (statut == 0) {
      return Grey20;
    } else if (statut == 1) {
      return ColorsPrimary;
    } else if (statut == 2) {
      return primary;
    }
    return primary;
  }

  //images
  static const String imageDir = "assets/img";
  static const String iconDir = "assets/icons";
  static const String recordsDir = "assets/records";
  static const String mdmLogo = "$imageDir/mdm.png";
  static const String bgApp = "$imageDir/backG.png";
  static const String avatar = "$imageDir/avatar.png";
  static const String recorder = "$iconDir/record.png";
  static const String recorderDisco = "$recordsDir/disco.mp3";
  static const String rdvIcon = "$iconDir/iconrdv.png";

  //Version
  static const String version = "Version : 1.0";

  static userProfle(url, {required String firstName, required String lastName}) {
    return CachedNetworkImage(
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
      imageBuilder: (context, image) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: image, fit: BoxFit.cover),
          ),
        );
      },
      imageUrl: url,
      fit: BoxFit.cover,
      errorWidget: (BuildContext context, String url, dynamic dy) {
        print(lastName);
        print(firstName);
        return CircleAvatar(
          child: Text(firstName.toString()[0] + lastName.toString()[0]),
        );
      },
    );
  }

  static String getInitial(String firstName, String lastName) {
    return (firstName[0].toUpperCase()) +  (lastName[0].toUpperCase());
  }
}

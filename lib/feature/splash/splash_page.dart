import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friendlist/feature/friends/friends.dart';
import 'package:friendlist/feature/onboarding/onboarding_page.dart';
import 'package:friendlist/util/localization_util.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "/splash";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: 
        (BuildContext) => OnboardingPage()
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid){
      return androidScaffold();
    }
    else {
      return iosScaffold();
    }
  }

  Widget iosScaffold(){
    return CupertinoPageScaffold(
      child: setBody(),
    );
  }

  Widget androidScaffold(){
    return Scaffold(
      body: setBody(),
    );
  }

  Widget setBody(){
    return Center(
      child: Container(
        margin: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/image/icon.png"), width: 200, height: 200),
            Padding(padding: EdgeInsets.only(top: 16.0)),
            Text(LocalizationUtil.of(context).getValue(AppTitle), 
              style: TextStyle(
                fontSize: 40
              ),
            )
          ],
        ),
      ),
    );
  }
}

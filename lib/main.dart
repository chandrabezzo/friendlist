import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'feature/splash/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'util/localization_util.dart';
import 'package:core/data/session_util.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

  static void setLanguage(BuildContext context, Locale newLocale){
    _MyAppState state = context.ancestorStateOfType(TypeMatcher<_MyAppState>());

    state.setState((){
      SessionUtil.getAsString(LANGUAGE, "en").then((code) {
        state.locale = Locale(code, '');
      });
    });
  }
}

class _MyAppState extends State<MyApp> {
  Locale locale = Locale('id');

  Widget setHome(){
    return SplashPage();
  }

  Locale setLocale(){
    return this.locale;
  }

  Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates(){
    return [
      const LocalizationUtilDelegate(),
      GlobalMaterialLocalizations.delegate, 
      GlobalWidgetsLocalizations.delegate
    ];
  }

  Iterable<Locale> supportedLocales(){
    return [
      const Locale('en', ''),
      const Locale('id', '')
    ];
  }

  @override
  Widget build(BuildContext context) {
    if(this.locale == null){
      return CircularProgressIndicator();
    }
    else {
      if (Platform.isIOS){
        return CupertinoApp(
          locale: setLocale(),
          localizationsDelegates: localizationsDelegates(),
          supportedLocales: supportedLocales(),
          debugShowCheckedModeBanner: false,
          home: setHome(),
        );
      }
      else {
        return MaterialApp(
          localizationsDelegates: localizationsDelegates(),
          supportedLocales: supportedLocales(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.blueGrey[800]),
          darkTheme: ThemeData.dark(),
          home: setHome(),
        );
      }
    }
  }
}

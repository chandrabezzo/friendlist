import 'package:flutter/material.dart';
import 'package:friendlist/feature/friends/friends_page.dart';
import 'package:friendlist/util/localization_util.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class OnboardingPage extends StatefulWidget {
  static const String routeName = "/onboarding";

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final pages = [
      PageViewModel(
          pageColor: const Color(0xFF03A9F4),
          // iconImageAssetPath: 'assets/air-hostess.png',
          bubble: Image.asset('assets/image/person.png'),
          body: Text(
            LocalizationUtil.of(context).getValue(NearbyDesc),
          ),
          title: Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Text(
              LocalizationUtil.of(context).getValue(Nearby),
            ),
          ),
          textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
          mainImage: Image(
            image: AssetImage("assets/image/people_list.png"), 
            width: 285, 
            height: 285,
            alignment: Alignment.center,
          )),
      PageViewModel(
        pageColor: const Color(0xFF8BC34A),
        iconImageAssetPath: 'assets/image/person.png',
        body: Text(
          LocalizationUtil.of(context).getValue(LovedDesc),
        ),
        title: Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Text(
            LocalizationUtil.of(context).getValue(Loved),
          ),
        ),
        mainImage: Image(
          image: AssetImage("assets/image/loved_friend.png"), 
          width: 285, 
          height: 285,
          alignment: Alignment.center,
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),
      PageViewModel(
        pageColor: const Color(0xFF607D8B),
        iconImageAssetPath: 'assets/image/icon.png',
        body: Text(
          LocalizationUtil.of(context).getValue(DetailDesc),
        ),
        title: Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Text(
            LocalizationUtil.of(context).getValue(Detail),
          ),
        ),
        mainImage: Image(
          image: AssetImage("assets/image/detail_friend.png"), 
          width: 285, 
          height: 285,
          alignment: Alignment.center,
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),
    ];

    return Scaffold(
      body: Builder(
        builder: (context) => IntroViewsFlutter(
              pages,
              onTapDoneButton: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FriendsPage(),
                  ), //MaterialPageRoute
                );
              },
              pageButtonTextStyles: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ), //IntroViewsFlutter
      ),
    );
  }
}

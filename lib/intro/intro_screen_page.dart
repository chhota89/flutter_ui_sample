import 'package:flutter/material.dart';
import 'package:flutterui_hiretalent/intro/page.dart';
import 'package:flutterui_hiretalent/intro/page_reveal.dart';
import 'package:flutterui_hiretalent/intro/pager_indicator.dart';

class IntroScreenPage extends StatefulWidget {
  @override
  _IntroScreenPageState createState() => _IntroScreenPageState();
}

class _IntroScreenPageState extends State<IntroScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Page(
            pageViewModel: pages[0],
            percentageVisible: 1.0,
          ),
          PageReveal(
            revealPercent: 1.0,
            child: Page(
              pageViewModel: pages[1],
              percentageVisible: 1.0,
            ),
          ),
          PagerIndicator(
            pagerIndicatorViewModel:
                new PagerIndicatorViewModel(pages, 0, SlideDirection.none, 0.0),
          )
        ],
      ),
    );
  }
}

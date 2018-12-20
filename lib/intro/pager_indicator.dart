import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterui_hiretalent/intro/page.dart';

class PagerIndicator extends StatelessWidget {
  final PagerIndicatorViewModel pagerIndicatorViewModel;

  const PagerIndicator({this.pagerIndicatorViewModel});

  @override
  Widget build(BuildContext context) {
    List<PageBubble> bubbles = [];

    for (var i = 0; i < pagerIndicatorViewModel.pages.length; ++i) {
      final page = pagerIndicatorViewModel.pages[i];

      var percentActive;
      if (i == pagerIndicatorViewModel.activeIndex) {
        percentActive = 1.0 - pagerIndicatorViewModel.slidePercent;
      } else if (i == pagerIndicatorViewModel.activeIndex - 1 &&
          pagerIndicatorViewModel.slideDirection ==
              SlideDirection.leftToRight) {
        percentActive = pagerIndicatorViewModel.slidePercent;
      } else if (i == pagerIndicatorViewModel.activeIndex + 1 &&
          pagerIndicatorViewModel.slideDirection ==
              SlideDirection.rightToLeft) {
        percentActive = pagerIndicatorViewModel.slidePercent;
      } else {
        percentActive = 0.0;
      }

      bool isHollow = i > pagerIndicatorViewModel.activeIndex ||
          (i == pagerIndicatorViewModel.activeIndex &&
              pagerIndicatorViewModel.slideDirection ==
                  SlideDirection.leftToRight);

      bubbles.add(PageBubble(
        pageBubbleViewModel: PageBubbleViewModel(
            page.iconAssetPath, page.color, isHollow, percentActive),
      ));
    }

//    final translation =
    final BUBBLE_WIDTH = 55.0;
    final baseTranslation =
        ((pagerIndicatorViewModel.pages.length * BUBBLE_WIDTH) / 2) -
            (BUBBLE_WIDTH / 2);
    var translation =
        baseTranslation - (pagerIndicatorViewModel.activeIndex * BUBBLE_WIDTH);
    if (pagerIndicatorViewModel.slideDirection == SlideDirection.leftToRight) {
      translation += BUBBLE_WIDTH * pagerIndicatorViewModel.slidePercent;
    } else if (pagerIndicatorViewModel.slideDirection ==
        SlideDirection.rightToLeft) {
      translation -= BUBBLE_WIDTH * pagerIndicatorViewModel.slidePercent;
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Transform(
          transform: new Matrix4.translationValues(baseTranslation, 0.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bubbles,
          ),
        )
      ],
    );
  }
}

enum SlideDirection {
  leftToRight,
  rightToLeft,
  none,
}

class PagerIndicatorViewModel {
  final List<PageViewModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PagerIndicatorViewModel(
    this.pages,
    this.activeIndex,
    this.slideDirection,
    this.slidePercent,
  );
}

class PageBubbleViewModel {
  final String iconPath;
  final Color color;
  final bool isHallow;
  final double activePercent;

  PageBubbleViewModel(
      this.iconPath, this.color, this.isHallow, this.activePercent);
}

class PageBubble extends StatelessWidget {
  final PageBubbleViewModel pageBubbleViewModel;

  const PageBubble({Key key, this.pageBubbleViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      height: 55.0,
      child: Center(
        child: Container(
          height: lerpDouble(20, 45, pageBubbleViewModel.activePercent),
          width: lerpDouble(20, 45, pageBubbleViewModel.activePercent),
          decoration: BoxDecoration(
              color: pageBubbleViewModel.isHallow
                  ? Colors.transparent
                  : Color(0x88FFFFFF),
              shape: BoxShape.circle,
              border: Border.all(
                  width: 3.0,
                  color: pageBubbleViewModel.isHallow
                      ? Color(0x88FFFFFF)
                      : Colors.transparent)),
          child: Opacity(
              opacity: pageBubbleViewModel.activePercent,
              child: Image.asset(pageBubbleViewModel.iconPath)),
        ),
      ),
    );
  }
}

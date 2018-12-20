import 'package:flutter/material.dart';

final pages = [
  new PageViewModel(
      const Color(0xFF678FB4),
      'assets/hotels.png',
      'Hotels',
      'All hotels and hostels are sorted by hospitality rating',
      'assets/key.png'),
  new PageViewModel(
      const Color(0xFF65B0B4),
      'assets/banks.png',
      'Banks',
      'We carefully verify all banks before adding them into the app',
      'assets/wallet.png'),
  new PageViewModel(
    const Color(0xFF9B90BC),
    'assets/stores.png',
    'Store',
    'All local stores are categorized for your convenience',
    'assets/shopping_cart.png',
  ),
];

class Page extends StatelessWidget {
  final PageViewModel pageViewModel;
  final double percentageVisible;

  Page({this.pageViewModel, this.percentageVisible = 1.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: pageViewModel.color,
      child: Opacity(
        opacity: percentageVisible,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform(
                transform: Matrix4.translationValues(
                    0.0, 0.5 * (1 - percentageVisible), 0.0),
                child: Image.asset(pageViewModel.heroAssetPath,
                    width: 200.0, height: 200.0)),
            Transform(
              transform: Matrix4.translationValues(
                  0.0, 0.3 * (1 - percentageVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(pageViewModel.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontFamily: 'FlamanteRoma')),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(
                  0.0, 0.3 * (1 - percentageVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(pageViewModel.body,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            SizedBox(height: 70)
          ],
        ),
      ),
    );
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetPath;

  PageViewModel(
    this.color,
    this.heroAssetPath,
    this.title,
    this.body,
    this.iconAssetPath,
  );
}

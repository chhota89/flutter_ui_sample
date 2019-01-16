import 'package:flutter/material.dart';
import 'package:flutterui_hiretalent/shoppingapp/row_chops_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: RawChopsHomePage(),
//      home: HireTalentPage(),
    );
  }
}

//decoration: BoxDecoration(
//color: status == 'Away' ? Colors.green : Colors.grey,
//borderRadius: BorderRadius.only(
//bottomLeft: Radius.circular(10.0),
//bottomRight: Radius.circular(10.0),
//)

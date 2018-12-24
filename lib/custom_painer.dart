import 'package:flutter/material.dart';

Color mainBGColor = Color(0xFF652A78);
Color redColor = Color(0xFFDE3C10);
Color purpleColor = Color(0xFF8132AD);
Color cyan = Color(0xFF99D5E5);
Color orange = Color(0xFFE97A4D);

class CustomPainerPage extends StatefulWidget {
  @override
  _CustomPainerPageState createState() => _CustomPainerPageState();
}

class _CustomPainerPageState extends State<CustomPainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: MyCustomPaint(),
        child: Container(
          height: 500,
        ),
      ),
    );
  }
}

class MyCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path mainBgPath = new Path();
    mainBgPath.addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    paint.color = mainBGColor;
    canvas.drawPath(mainBgPath, paint);

    Path purplePath = new Path();
    purplePath.lineTo(size.height * 0.45, 0.0);
    purplePath.quadraticBezierTo(
        size.height * 0.35, size.width * 0.3, 0.0, size.width * 0.55);
    purplePath.close();
    paint.color = purpleColor;
    canvas.drawPath(purplePath, paint);

    Path cyanPath = new Path();
    cyanPath.lineTo(size.height * 0.3, 0.0);
    cyanPath.lineTo(0.0, size.width * 0.3);
    cyanPath.close();
    paint.color = cyan;
    canvas.drawPath(cyanPath, paint);

    Path redPath = Path();
    redPath.moveTo(size.width * 0.9, 0.0);
    redPath.quadraticBezierTo(
        size.width * .5, size.height * 0.1, 0, size.height * 0.85);
    redPath.lineTo(0, size.height);
    redPath.lineTo(size.width * 0.25, size.height);
    redPath.quadraticBezierTo(
        size.width * .5, size.height * 0.7, size.width, size.height * 0.6);
    redPath.lineTo(size.width, 0.0);
    redPath.close();
    paint.color = redColor;
    canvas.drawPath(redPath, paint);

    Path orangePath = Path();
    orangePath.moveTo(0, size.height * 0.75);
    orangePath.quadraticBezierTo(
        size.width * .25, size.height * 0.85, size.width * .40, size.height);
    orangePath.lineTo(0, size.height);
    orangePath.close();
    paint.color = orange;
    canvas.drawPath(orangePath, paint);

    Path trianglePath = Path();
    trianglePath.lineTo(size.width * .25, 0);
    trianglePath.lineTo(0, size.height * .25);
    trianglePath.close();
    paint.color = cyan;
    canvas.drawPath(trianglePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

import 'package:flutter/material.dart';
import 'dart:math';

class DashLineSamplePage extends StatefulWidget {
  @override
  _DashLineSamplePageState createState() => _DashLineSamplePageState();
}

class _DashLineSamplePageState extends State<DashLineSamplePage> {
  double percentage;
  @override
  void initState() {
    super.initState();
    setState(() {
      percentage = 0.0;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Container(
          height: 200.0,
          width: 200.0,
          child: new CustomPaint(
            foregroundPainter: new MyPainter(
                lineColor: Colors.amber,
                completeColor: Colors.blueAccent,
                completePercent: percentage,
                width: 8.0
            ),
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                  color: Colors.purple,
                  splashColor: Colors.blueAccent,
                  shape: new CircleBorder(),
                  child: new Text("Click"),
                  onPressed: (){
                    setState(() {
                      percentage += 10.0;
                      if(percentage>100.0){
                        percentage=0.0;
                      }
                    });
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter{
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  MyPainter({this.lineColor,this.completeColor,this.completePercent,this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center  = new Offset(size.width/2, size.height/2);
    double radius  = min(size.width/2,size.height/2);
    canvas.drawCircle(
        center,
        radius,
        line
    );
    double arcAngle = 2*pi* (completePercent/100);
    canvas.drawArc(
        new Rect.fromCircle(center: center,radius: radius),
        -pi/2,
        arcAngle,
        false,
        complete
    );
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DashLinePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void paintZigZag(Canvas canvas, Paint paint, Offset start, Offset end, int zigs, double width) {
    assert(zigs.isFinite);
    assert(zigs > 0);
    canvas.save();
    canvas.translate(start.dx, start.dy);
    end = end - start;
    canvas.rotate(atan2(end.dy, end.dx));
    final double length = end.distance;
    final double spacing = length / (zigs * 2.0);
    final Path path = Path()
      ..moveTo(0.0, 0.0);
    for (int index = 0; index < zigs; index += 1) {
      final double x = (index * 2.0 + 1.0) * spacing;
      final double y = width * ((index % 2.0) * 2.0 - 1.0);
      path.lineTo(x, y);
    }
    path.lineTo(length, 0.0);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

}
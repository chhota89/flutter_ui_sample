import 'package:flutter/material.dart';

class CustomShapePathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();
    path.lineTo(0.0, size.height);
    var firstEndPoint = Offset(size.width * 0.5, size.height - 30);
    var firstControlPoints = Offset(size.width * 0.25, size.height - 50);
    path.quadraticBezierTo(firstControlPoints.dx, firstControlPoints.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondEndPoint = Offset(size.width, size.height - 80);
    var secondControlPoints = Offset(size.width * 0.75, size.height - 10);
    path.quadraticBezierTo(secondControlPoints.dx, secondControlPoints.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgressWidget extends StatefulWidget {
  final porcentaje;

  RadialProgressWidget({this.porcentaje});

  @override
  _RadialProgressWidgetState createState() => _RadialProgressWidgetState();
}

class _RadialProgressWidgetState extends State<RadialProgressWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _MiRadialProgress(widget.porcentaje)
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter{
  final porcentaje;
  _MiRadialProgress(this.porcentaje);
  @override
  void paint(Canvas canvas, Size size) {
      final paint = new Paint()
      ..strokeWidth = 5
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

      Offset centro = Offset(size.width * 0.5, size.height/2);
      double radio = min(size.width * 0.5, size.height*0.5);
      canvas.drawCircle(centro, radio, paint);

      //arco
      final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke;

      double arcAngulo = 2*pi*(porcentaje /100);

      canvas.drawArc(
        Rect.fromCircle(center: centro,radius: radio),
        -pi/2, 
        arcAngulo, 
        false, 
        paintArco
      );
    }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}
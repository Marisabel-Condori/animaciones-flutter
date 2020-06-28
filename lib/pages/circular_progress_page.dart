import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  int porcentaje = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.blueGrey,
        onPressed: (){
          porcentaje +=10;
          if (porcentaje == 100) {
            porcentaje =0;
          }
          setState(() {  });
        }
      ),
      body: Center(
        child: Container(
          height: 300.0,
          width: 300.0,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentaje)
          ),
        ),
      )
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
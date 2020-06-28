import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgressWidget extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;

  RadialProgressWidget({this.porcentaje, this.colorPrimario= Colors.orangeAccent, this.colorSecundario = Colors.grey});

  @override
  _RadialProgressWidgetState createState() => _RadialProgressWidgetState();
}

class _RadialProgressWidgetState extends State<RadialProgressWidget> with SingleTickerProviderStateMixin{
  AnimationController controller;
  double porcentajeAnterior;
  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from:0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
            (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar*controller.value),
            widget.colorPrimario, widget.colorSecundario)
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter{
  final porcentaje;
  final colorPrimario;
  final colorSecundario;
  _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecundario );
  @override
  void paint(Canvas canvas, Size size) {
      final paint = new Paint()
      ..strokeWidth = 5
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

      Offset centro = Offset(size.width * 0.5, size.height/2);
      double radio = min(size.width * 0.5, size.height*0.5);
      canvas.drawCircle(centro, radio, paint);

      //arco
      final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = colorPrimario
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
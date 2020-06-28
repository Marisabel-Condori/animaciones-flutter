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
       child: Text('${widget.porcentaje}'),
    );
  }
}
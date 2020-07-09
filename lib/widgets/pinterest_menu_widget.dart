import 'package:flutter/material.dart';

class PinterestBoton{
  @required final Function onPressed;
  @required final Icon icon;

  PinterestBoton({  this.onPressed, this.icon });
}

class PinterestMenuWidget extends StatelessWidget {
  final List<PinterestBoton> items = [
    PinterestBoton(icon: Icon(Icons.pie_chart), onPressed: (){print('icono pie_chart');}),
    PinterestBoton(icon: Icon(Icons.search), onPressed: (){print('icono search');}),
    PinterestBoton(icon: Icon(Icons.notifications), onPressed: (){print('icono notificaciones');}),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('menuuuuuuuuuuu')),
    );
  }
}
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('$porcentaje', style: TextStyle(fontSize: 30.0),)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh, color: Colors.lightGreenAccent,),
        onPressed: (){
          setState(() {
            porcentaje +=10.0;
            if (porcentaje >100.0) {
              porcentaje = 0.0;
            }
          });
        }),
    );
  }
}
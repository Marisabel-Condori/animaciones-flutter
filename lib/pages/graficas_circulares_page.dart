import 'package:custom_painter/widgets/radial_progress_widget.dart';
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
       body: Center(
         child: Container(
           width: 300.0,
           height: 300.0,
           color: Colors.blue,
           child: RadialProgressWidget(porcentaje: porcentaje,),
         ),
       ),
      //Center(child: Text('$porcentaje', style: TextStyle(fontSize: 30.0),)),

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
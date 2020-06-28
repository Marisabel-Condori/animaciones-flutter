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
       floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh, color: Colors.lightGreenAccent,),
        onPressed: (){
          setState(() {
            porcentaje +=10.0;
            if (porcentaje >100.0) {
              porcentaje = 0.0;
            }
         //   print('$porcentaje');
          });
        }
      ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue,),
               CustomRadialProgress(porcentaje: porcentaje, color: Colors.deepOrange)
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               CustomRadialProgress(porcentaje: porcentaje, color: Colors.yellow),
               CustomRadialProgress(porcentaje: porcentaje, color: Colors.red)
             ],
           )
         ],
       )
      //Center(child: Text('$porcentaje', style: TextStyle(fontSize: 30.0),)),

      
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final color;
  const CustomRadialProgress({ @required this.porcentaje, @required this.color  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 150.0,
     // color: Colors.blue,
      child: RadialProgressWidget(porcentaje: porcentaje, colorPrimario: this.color,),
    );
  }
}
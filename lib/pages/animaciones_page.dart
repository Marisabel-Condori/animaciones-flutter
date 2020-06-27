import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      )
    );
  }
}

class CuadradoAnimado extends StatefulWidget {

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  @override
  void initState() {
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 4000));
    rotacion= Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn)
    );
    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.0, 0.3, curve: Curves.easeIn))
    );
    moverDerecha = Tween(begin: 0.1, end: 300.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn)
    );
    agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn)
    );
    

    controller.addListener(() {
      // print('status: ${controller.status}');
      if(controller.status == AnimationStatus.completed){
        controller.reverse();
       }//else if (controller.status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
    });


    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    
    return AnimatedBuilder(
       animation: controller,
        child: _Cuadrado(),
      builder: (BuildContext context, Widget childCuadrado) {
        // print(rotacion.value);
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: childCuadrado
              ),
            )
            
          ),
        );
      },
    );
  }
}

class _Cuadrado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: 70.0,
      color: Colors.greenAccent,
    );
  }
}
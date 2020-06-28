import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      )
    );
  }
}
//**********************************************************************************//
class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> moverDerecha;
  Animation<double> moverArriba;
  Animation<double> moverIzquierda;
  Animation<double> moverAbajo;

  @override
  void initState() {
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 4000));
    moverDerecha = Tween(begin: 0.0, end: 150.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.0, 0.25, curve: Curves.bounceOut))
    );
    moverArriba = Tween(begin: 0.0, end: -150.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.25, 0.5, curve: Curves.bounceOut))
    );
    moverIzquierda = Tween(begin: 0.0, end: 150.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.5, 0.75, curve: Curves.bounceOut))
    );
    moverAbajo = Tween(begin: 0.0, end: -150.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.bounceOut))
    );
    

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
        builder: (BuildContext context, Widget child) {
        //  print(moverDerecha.value);
          return Transform.translate(  
            child: child,
            offset: Offset(moverDerecha.value - moverIzquierda.value, moverArriba.value - moverAbajo.value )
          );
        }, 
    );
  }
}

//*****************************WIDGET CUADRADO**********************************//
class _Cuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: 70.0,
      color: Colors.teal,
    );
  }
}
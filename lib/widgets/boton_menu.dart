import 'package:flutter/material.dart';

class BotonMenuWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _BotonBackground(),
      ),
    );
  }
}

class _BotonBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      width: double.infinity,
      height: 70.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black.withOpacity(0.3), offset: Offset(10, 15), blurRadius: 10.0)
        ],
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xff6989F5),
            Color(0xff906EF5)
          ])
      ),
    );
  }
}
import 'package:flutter/material.dart';

class HeaderCuadradoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Colors.greenAccent,
    );
  }
}

class HeaderCircularWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
    //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0)),
        color: Colors.greenAccent,
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonMenuWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _BotonBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.0,width: 40.0,),
            FaIcon(FontAwesomeIcons.carCrash, color:Colors.white, size: 40.0),
            SizedBox(width: 20.0,),
            Expanded(child: Text('Motor Accident', style: TextStyle(color: Colors.white),)),  
            FaIcon(FontAwesomeIcons.chevronRight,  color:Colors.white),
            SizedBox(width: 40.0,),
          ],
        )
      ],
    );
  }
}

class _BotonBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: [
            Positioned(
              top: -20.0,
              right: -20.0,
              child: FaIcon(FontAwesomeIcons.carCrash, color: Colors.white.withOpacity(0.2),size: 100.0,)
            )
          ],
        ),
      ),
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
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonMenuWidget extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;

  const BotonMenuWidget({
    @required this.icon, 
    @required this.texto, 
    this.color1 = Colors.purple, 
    this.color2 = Colors.orange, 
    @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: [
          _BotonBackground(colorA: this.color1, colorB: this.color2,icon: this.icon,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100.0,width: 40.0,),
              FaIcon(this.icon, color:Colors.white, size: 40.0),
              SizedBox(width: 20.0,),
              Expanded(child: Text(this.texto, style: TextStyle(color: Colors.white),)),  
              FaIcon(FontAwesomeIcons.chevronRight,  color:Colors.white),
              SizedBox(width: 40.0,),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonBackground extends StatelessWidget {
  final Color colorA;
  final Color colorB;
  final IconData icon;

  const _BotonBackground({
    @required this.colorA, @required this.colorB, @required this.icon});

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
              child: FaIcon(this.icon, color: Colors.white.withOpacity(0.2),size: 100.0,)
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
            this.colorA,
            this.colorB
          ])
      ),
    );
  }
}
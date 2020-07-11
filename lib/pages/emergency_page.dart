import 'package:custom_painter/widgets/boton_menu.dart';
import 'package:flutter/material.dart';

import 'package:custom_painter/widgets/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 150.0),
            child: ListView(
              children: [
                SizedBox(height: 80.0,),
                _BotonMenuWidgetTemp(),
              ]
            ),
          ),
          _IconHeaderBackground()
        ],
      )
    );
  }
}

class _BotonMenuWidgetTemp extends StatelessWidget {
  const _BotonMenuWidgetTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonMenuWidget(
      icon: FontAwesomeIcons.carBattery,
      onPress: (){print('click');},
      texto: 'holaaaaaaaaaaaaaaa',
     // color1: Color(0xff6989F5),
     // color2: Color(0xff906EF5),

    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      titulo: 'Asistencia medica',
      subtitulo: 'Haz solicitado',
      colorA: Color(0xFF526BF6),
       colorB: Color(0xFF67ACF2),
    );
  }
}
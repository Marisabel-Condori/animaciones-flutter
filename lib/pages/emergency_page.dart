import 'package:flutter/material.dart';

import 'package:custom_painter/widgets/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconHeader(
        icon: FontAwesomeIcons.plus,
        titulo: 'Asistencia medica',
        subtitulo: 'Haz solicitado',
        colorA: Color(0xFF526BF6),
         colorB: Color(0xFF67ACF2),
      ),
    );
  }
}
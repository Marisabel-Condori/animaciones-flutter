import 'package:custom_painter/labs/slideShow_page.dart';
import 'package:custom_painter/pages/animaciones_page.dart';
import 'package:custom_painter/pages/cuadrado_animado_page.dart';
import 'package:custom_painter/pages/emergency_page.dart';
import 'package:custom_painter/pages/graficas_circulares_page.dart';
import 'package:custom_painter/pages/header_page.dart';
import 'package:custom_painter/pages/launcher_page.dart';
import 'package:custom_painter/pages/pinterest_page.dart';
import 'package:custom_painter/pages/slide_show_optimizado_page.dart';
import 'package:custom_painter/pages/sliver_list_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.ambulance, 'emergencia', EmergencyPage()),
  _Route(FontAwesomeIcons.ambulance, 'animacion', AnimacionesPage()),
  _Route(FontAwesomeIcons.ambulance, 'cuadrado animado', CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.ambulance, 'grafica circular', GraficasCircularesPage()),
  _Route(FontAwesomeIcons.ambulance, 'pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.ambulance, 'slides', SlideShowOptimiPage()),
  _Route(FontAwesomeIcons.ambulance, 'sliver', SliverListPage()),

];

class _Route{
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
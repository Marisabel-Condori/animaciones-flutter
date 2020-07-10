// import 'package:custom_painter/pages/animaciones_page.dart';
// import 'package:custom_painter/pages/cuadrado_animado_page.dart';
// import 'package:custom_painter/pages/header_page.dart';
// import 'package:custom_painter/pages/circular_progress_page.dart';
// import 'package:custom_painter/pages/graficas_circulares_page.dart';
//import 'package:custom_painter/labs/slideShow_page.dart';
// import 'package:custom_painter/pages/pinterest_page.dart';
// import 'package:custom_painter/pages/slide_show_optimizado_page.dart';

import 'package:custom_painter/pages/emergency_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: EmergencyPage()
    );
  }
}
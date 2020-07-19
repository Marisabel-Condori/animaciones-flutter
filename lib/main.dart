// import 'package:custom_painter/pages/animaciones_page.dart';
// import 'package:custom_painter/pages/cuadrado_animado_page.dart';
// import 'package:custom_painter/pages/header_page.dart';
// import 'package:custom_painter/pages/circular_progress_page.dart';
// import 'package:custom_painter/pages/graficas_circulares_page.dart';
//import 'package:custom_painter/labs/slideShow_page.dart';
// import 'package:custom_painter/pages/pinterest_page.dart';
// import 'package:custom_painter/pages/slide_show_optimizado_page.dart';
//import 'package:custom_painter/pages/emergency_page.dart';

import 'package:custom_painter/pages/launcher_page.dart';
import 'package:custom_painter/pages/launcher_tablet_page.dart';
import 'package:custom_painter/pages/sliver_list_page.dart';
import 'package:custom_painter/theme/themeChanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => ThemeChanger(2),
    child: MyApp()
  )
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation){
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500.0) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        })
    );
  }
}
import 'package:custom_painter/theme/themeChanger.dart';
import 'package:custom_painter/widgets/slide_show_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowOptimiPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bool isLarge;
    if(MediaQuery.of(context).size.height > 500){
      isLarge = true;
    }else{
      isLarge = false;
    }
    final _children = [
      Expanded(child: MiSlideshow()),
      Expanded(child: MiSlideshow()),
    ];
    return Scaffold(
      body: (isLarge) 
        ? Column(children: _children)
        : Row(children: _children,) 
    );
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final acentColor = appTheme.currentTheme.accentColor;
    return SlideShowWidget(
      puntosArriba: false,
      colorGeneral: Colors.grey,
      colorSecundario: (appTheme.getDarkTheme)? acentColor:Colors.purpleAccent,
      tamanioPrin: 20.0,
      tamanioSec: 10.0,
      slides: [
        SvgPicture.asset('assets/svg/s1.svg'),
        Center(child: Text('holaaaaaaaaaaaaa')),
        Center(child: Text('hfsdfsfdsfaaaa')),
        
      ],
    );
  }
}


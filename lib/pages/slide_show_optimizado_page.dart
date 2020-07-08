import 'package:custom_painter/widgets/slide_show_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowOptimiPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Expanded(child: MiSlideshow()),
          Expanded(child: MiSlideshow()),
        ],
      ),
    );
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideShowWidget(
      puntosArriba: false,
      colorGeneral: Colors.grey,
      colorSecundario: Colors.purpleAccent,
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


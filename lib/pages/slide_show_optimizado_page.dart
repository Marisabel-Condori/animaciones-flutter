import 'package:custom_painter/widgets/slide_show_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowOptimiPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideShowWidget(
        slides: [
          SvgPicture.asset('assets/svg/s1.svg')
        ],
      ),
    );
  }
}


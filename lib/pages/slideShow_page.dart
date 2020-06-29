import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Slides()
      //SvgPicture.asset('assets/svg/s1.svg'),
    );
  }
}

class _Slides extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: [
          _Slide(svg: 'assets/svg/s1.svg'),
          _Slide(svg: 'assets/svg/s2.svg',),
          _Slide(svg: 'assets/svg/s3.svg',)
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  const _Slide({this.svg});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: SvgPicture.asset(svg),
    );
  }
}
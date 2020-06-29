import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: _Slides()),
            _Dots()
          ],
        ),
      )
      //SvgPicture.asset('assets/svg/s1.svg'),
    );
  }
}
//*****************DOTS********************************//
class _Dots extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        _Dot(),
        _Dot(),
        _Dot()
      ],),
    );
  }
}

class _Dot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 10.0, width: 10.0,
      decoration: BoxDecoration(
        color: Colors.blue, shape: BoxShape.circle
      ),);
  }
}

//*****************SLIDES********************************//
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
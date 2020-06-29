import 'package:custom_painter/models/slide_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SlideModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(child: _Slides()),
              _Dots()
            ],
          ),
        )
        //SvgPicture.asset('assets/svg/s1.svg'),
      ),
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
        _Dot(0),
        _Dot(1),
        _Dot(2)
      ],),
    );
  }
}

class _Dot extends StatelessWidget {
  final double index;

  _Dot(this.index);
  @override
  Widget build(BuildContext context) {
    final nroP = Provider.of<SlideModel>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 10.0, width: 10.0,
      decoration: BoxDecoration(
        color: (index == nroP.getNumPag)? Colors.blue: Colors.grey, 
        shape: BoxShape.circle
      ),);
  }
}

//*****************SLIDES********************************//
class _Slides extends StatefulWidget {

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener((){
      print('numero de pagina ${pageViewController.page}');
      Provider.of<SlideModel>(context, listen: false).setNumPag = pageViewController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
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
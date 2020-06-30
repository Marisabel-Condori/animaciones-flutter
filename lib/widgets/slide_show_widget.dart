import 'package:custom_painter/models/slide_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/********************* */
import 'package:flutter_svg/svg.dart';

class SlideShowWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SlideModel(),
      child: Center(
          child: Column(
            children: [
              Expanded(child: _Slides()),
              _Dots()
            ],
          ),
        )
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
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 10.0, width: 10.0,
      decoration: BoxDecoration(
        color: (nroP.getNumPag >= index-0.5  && nroP.getNumPag < index+0.5 )? Colors.blue: Colors.grey, 
        shape: BoxShape.circle
      ),
    );
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
    //  print('numero de pagina ${pageViewController.page}');
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
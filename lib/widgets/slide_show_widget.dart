import 'package:custom_painter/models/slide_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_svg/svg.dart';

class SlideShowWidget extends StatelessWidget {
  
  final List<Widget> slides;
  final bool puntosArriba;

  SlideShowWidget({
    @required this.slides,
    this.puntosArriba = true
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SlideModel(),
      child: Center(
          child: Column(
            children: [
              if (puntosArriba) _Dots(this.slides.length) ,
              Expanded(child: _Slides(this.slides)),
              if (!puntosArriba) _Dots(this.slides.length) ,
            ],
          ),
        )
    );
  }
}

//*****************DOTS********************************//
class _Dots extends StatelessWidget {
  final int i;

  _Dots(this.i);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(i, (index) => _Dot(index)),),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

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
  final List<Widget> slides;
  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener((){
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
        children: widget.slides.map((slideOp) => _Slide(slideOp)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: slide
    );
  }
}
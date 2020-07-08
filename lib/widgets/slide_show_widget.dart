
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShowWidget extends StatelessWidget {
  
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorGeneral;
  final Color colorSecundario;
  final double tamanioPrin;
  final double tamanioSec;

  SlideShowWidget({
    @required this.slides,
    this.puntosArriba = true,
    this.colorGeneral = Colors.grey,
    this.colorSecundario = Colors.blue,
    this.tamanioPrin = 20.0,
    this.tamanioSec = 15.0
  });

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (_) => _SlideShowModel(),
      
      child: Center(
          child: Builder(
            builder: (BuildContext context){
              Provider.of<_SlideShowModel>(context).setColorGeneral = this.colorGeneral;
              Provider.of<_SlideShowModel>(context).setColorSecundario = this.colorSecundario;

              Provider.of<_SlideShowModel>(context).setTamPrin = this.tamanioPrin;
              Provider.of<_SlideShowModel>(context).setTamSec = this.tamanioSec;
              return _EstructuraPuntos(puntosArriba: puntosArriba, slides: slides);
            }
          )
        //  child: _EstructuraPuntos(puntosArriba: puntosArriba, slides: slides),
        )
    );
  }
}

class _EstructuraPuntos extends StatelessWidget {
  const _EstructuraPuntos({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (puntosArriba) _Dots(this.slides.length) ,
        Expanded(child: _Slides(this.slides)),
        if (!puntosArriba) _Dots(this.slides.length) ,
      ],
    );
  }
}

//**************************DOTS********************************//
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
    final nroP = Provider.of<_SlideShowModel>(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: (nroP.getNumPag >= index-0.5  && nroP.getNumPag < index+0.5 )
            ? nroP.getTamPrin: nroP.getTamSec, 
      width: (nroP.getNumPag >= index-0.5  && nroP.getNumPag < index+0.5 )
            ? nroP.getTamPrin: nroP.getTamSec,
      decoration: BoxDecoration(
        color: (nroP.getNumPag >= index-0.5  && nroP.getNumPag < index+0.5 )
            ? nroP.getColorSecundario: nroP.getColorGeneral, 
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
      Provider.of<_SlideShowModel>(context, listen: false).setNumPag = pageViewController.page;
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
//********************* MODEL *******************************/
class _SlideShowModel with ChangeNotifier{
  double _numPag = 0.0;
  Color _colorGeneral = Colors.grey;
  Color _colorSecundario = Colors.purple;
  double _tamanioPrincipal = 20.0;
  double _tamanioSecundaio  = 15.0;

  double get getNumPag => this._numPag;
  set setNumPag(double nro){
    this._numPag = nro;
    notifyListeners();
  }

  Color get getColorGeneral => this._colorGeneral;
  set setColorGeneral(Color colorGen){
    this._colorGeneral = colorGen;
  }

  Color get getColorSecundario => this._colorSecundario;
  set setColorSecundario(Color colorSec){
    this._colorSecundario = colorSec;
  }

  double get getTamPrin => this._tamanioPrincipal;
  set setTamPrin(double nro){
    this._tamanioPrincipal = nro;
  }

  double get getTamSec => this._tamanioSecundaio;
  set setTamSec(double nro){
    this._tamanioSecundaio = nro;
  }
}
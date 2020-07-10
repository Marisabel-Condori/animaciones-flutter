import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadradoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Colors.greenAccent,
    );
  }
}

class HeaderCircularWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
    //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0)),
        color: Colors.greenAccent,
      )
    );
  }
}

class HeaderDiagonalWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      )
    );
  }
}
class _HeaderDiagonalPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();
    // propiedades
    lapiz.color = Colors.blueGrey;
    lapiz.strokeWidth = 20.0;
    lapiz.style = PaintingStyle.fill;

    final path = new Path();
    //dibujar con el lapiz y el path
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }
  @override
  bool shouldRepaint(_HeaderDiagonalPainter oldDelegate) => true;
}

class HeaderTrianguloWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTrianguloPainter(),
      )
    );
  }
}
class _HeaderTrianguloPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();
    // propiedades
    lapiz.color = Colors.orangeAccent;
    lapiz.strokeWidth = 20.0;
    lapiz.style = PaintingStyle.fill;

    final path = new Path();
    //dibujar con el lapiz y el path
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }
  @override
  bool shouldRepaint(_HeaderTrianguloPainter oldDelegate) => true;
}

class HeaderTrianguloIzWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTrianguloIzPainter(),
      )
    );
  }
}
class _HeaderTrianguloIzPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();
    // propiedades
    lapiz.color = Colors.orangeAccent;
    lapiz.strokeWidth = 20.0;
    lapiz.style = PaintingStyle.fill;

    final path = new Path();
    //dibujar con el lapiz y el path
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }
  @override
  bool shouldRepaint(_HeaderTrianguloIzPainter oldDelegate) => true;
}
//*************************************************** */
class HeaderPicoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      )
    );
  }
}
class _HeaderPicoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();
    // propiedades
    lapiz.color = Colors.orangeAccent;
    lapiz.strokeWidth = 20.0;
    lapiz.style = PaintingStyle.fill;

    final path = new Path();
    //dibujar con el lapiz y el path
    path.lineTo(0, size.height * 0.2);
    path.lineTo(size.width * 0.5, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }
  @override
  bool shouldRepaint(_HeaderPicoPainter oldDelegate) => true;
}

//*************************************************** */
class HeaderCurvaWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvaPainter(),
      )
    );
  }
}
class _HeaderCurvaPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();
    // propiedades
    lapiz.color = Colors.orangeAccent;
    lapiz.strokeWidth = 20.0;
    lapiz.style = PaintingStyle.fill;

    final path = new Path();
    //dibujar con el lapiz y el path
    path.lineTo(0, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.4, size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    
    canvas.drawPath(path, lapiz);
  }
  @override
  bool shouldRepaint(_HeaderCurvaPainter oldDelegate) => true;
}

//*************************************************** */
class HeaderWaveWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      )
    );
  }
}
class _HeaderWavePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();
    // propiedades
    lapiz.color = Colors.orangeAccent;
    lapiz.strokeWidth = 20.0;
    lapiz.style = PaintingStyle.fill;

    final path = new Path();
    //dibujar con el lapiz y el path
    path.lineTo(0, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.28, size.width * 0.5, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.15, size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    
    canvas.drawPath(path, lapiz);
  }
  @override
  bool shouldRepaint(_HeaderWavePainter oldDelegate) => true;
}

//******************** ICON HEADER  *********************/
//************************* lo usamos en emergency page ****************************** */
class IconHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(0.5);
    return Stack(
      children: [
        _IconHeaderBackgroud(),
        Positioned(
          top: -60,
          left: -40,
          child: FaIcon(FontAwesomeIcons.plus, color: Colors.white.withOpacity(0.2), size: 200.0 ),  
        ),
        Column(
          children: [
            SizedBox(width: double.infinity,height: 100.0,),
            Text('Haz solicitado', style: TextStyle(color:colorBlanco),),
            SizedBox(height: 30.0,),
            Text('Asistencia medica', style: TextStyle(color:colorBlanco, fontWeight: FontWeight.bold)),
            SizedBox(height: 20.0,),
            FaIcon(FontAwesomeIcons.plus, color: Colors.white, size: 50.0 ),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackgroud extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70.0)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xff526BF6),
            Color(0xff62ACF2),
          ])
      ),
    );
  }
}

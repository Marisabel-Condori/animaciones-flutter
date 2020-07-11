import 'package:custom_painter/widgets/boton_menu.dart';
import 'package:flutter/material.dart';

import 'package:custom_painter/widgets/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final items = <ItemBoton>[
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ];

    List<Widget> listaItem = items.map(
      (item) => BotonMenuWidget(
        icon: item.icon,
        onPress: (){print('click');},
        texto: item.texto,
        color1: item.color1,
        color2: item.color2,
      )
    ).toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 150.0),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 80.0,),
                ...listaItem,
              ]
            ),
          ),
          _IconHeaderBackground()
        ],
      )
    );
  }
}

class _BotonMenuWidgetTemp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BotonMenuWidget(
      icon: FontAwesomeIcons.carBattery,
      onPress: (){print('click');},
      texto: 'holaaaaaaaaaaaaaaa',
     // color1: Color(0xff6989F5),
     // color2: Color(0xff906EF5),

    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _Encabezado();
  }
}

class _Encabezado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia medica',
          subtitulo: 'Haz solicitado',
          colorA: Color(0xFF526BF6),
           colorB: Color(0xFF67ACF2),
        ),
        Positioned(
          right: 0.0,
          top: 40.0,
          child: RawMaterialButton(
            onPressed: (){},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15.0),
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white,)
          )
        )
      ],
    );
  }
}
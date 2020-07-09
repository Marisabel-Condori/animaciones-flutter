import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestBoton{
  @required final Function onPressed;
  @required final IconData icon;

  PinterestBoton({  this.onPressed, this.icon });
}

class PinterestMenuWidget extends StatelessWidget {
  final List<PinterestBoton> items = [
    PinterestBoton(icon: Icons.pie_chart, onPressed: (){print('icono pie_chart');}),
    PinterestBoton(icon: Icons.search, onPressed: (){print('icono search');}),
    PinterestBoton(icon: Icons.notifications, onPressed: (){print('icono notificaciones');}),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider(
        create: (_) => _MenuModel(),
        child: _PinterestMenuBackgroung(child: _MenuItems(items))
      ),
    );
  }
}

class _PinterestMenuBackgroung extends StatelessWidget {
  final Widget child;
  _PinterestMenuBackgroung({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinterestBoton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _PinterestMenuBoton(i, menuItems[i]))
    );
  }
}

class _PinterestMenuBoton extends StatelessWidget {
  final int index;
  final PinterestBoton item;

  _PinterestMenuBoton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).getItemSelec;
    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).setItemSelec = index;
        item.onPressed();
      },
      child: Container(
        child: Icon(
          item.icon, 
          size: (itemSeleccionado == index)? 30: 20,
          color: (itemSeleccionado == index)? Colors.black: Colors.cyan),
        )
    );
  }
}

class _MenuModel with ChangeNotifier{
  int _itemSeleccionado=0;

  int get getItemSelec => this._itemSeleccionado;
  set setItemSelec(int nro){
    this._itemSeleccionado = nro;
    notifyListeners();
  }
}
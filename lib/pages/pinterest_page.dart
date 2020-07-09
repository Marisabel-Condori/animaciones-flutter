import 'package:custom_painter/widgets/pinterest_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          PinterestP(),
          _PosicionMenu()
        ],
      )
      //  PinterestMenuWidget()
      //  PinterestP()
    );
  }
}

class _PosicionMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final widthPantalla = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 30.0,
      child: Container(
        height: 50.0,
        width: widthPantalla,
        child: Center(
          child: PinterestMenuWidget(),
        ),
      )
    );
  }
}

class PinterestP extends StatefulWidget {
  @override
  _PinterestPState createState() => _PinterestPState();
}

class _PinterestPState extends State<PinterestP> {
  final List<int> items = List.generate(200, (i) => i);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() { 
    
    controller.addListener(() {
    //  print(controller.offset);
      if (controller.offset > scrollAnterior) {
        print('ocultar menu');
      }else{
        print('mostrar menu');
      }
      scrollAnterior = controller.offset;
     });
    
    super.initState();
    
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 4),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  _PinterestItem( this.index );

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15.0)
      ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        )
      );
  }
}

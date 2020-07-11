import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: 0,
            right: -10,
            child: _BotonCrearNuevo()
          )
        ],
      )
      //_ItemListView()
      //_ItemListView(),
    );
  }
}

class _BotonCrearNuevo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width*0.9,
      height: 100.0,
      child: RaisedButton(
        onPressed: (){},
        color: Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0))
        ),
        child: Text('CREA NUEVA LISTA', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 3)),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {

  final items = [
      _ItemPersonalizado( 'Orange', Color(0xffF08F66) ),
      _ItemPersonalizado( 'Family', Color(0xffF2A38A) ),
      _ItemPersonalizado( 'Orange', Color(0xffF08F66) ),
      _ItemPersonalizado( 'Family', Color(0xffF2A38A) ),
      _ItemPersonalizado( 'Orange', Color(0xffF08F66) ),
      _ItemPersonalizado( 'Family', Color(0xffF2A38A) ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomDelegate(
            minHeight: 150,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: _Titulo()
            )
          )
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 150.0,)
          ])
        )
      ],
    );
  }
}

class _SliverCustomDelegate extends SliverPersistentHeaderDelegate{
    final double minHeight;
    final double maxHeight;
    final Widget child;

    _SliverCustomDelegate({@required this.minHeight, @required this.maxHeight, @required this.child});

    @override
    Widget build(BuildContext context , double shrinkOffset, bool overlapsContent) {
        return SizedBox.expand(child: child);
      }
  
    @override
    double get maxExtent => maxHeight;
  
    @override
    double get minExtent => minHeight;

    @override
    bool shouldRebuild(_SliverCustomDelegate oldDelegate) {
      return maxHeight != oldDelegate.maxHeight||
              minHeight != oldDelegate.minHeight ||
              child != oldDelegate.child;
    }

}

class _Titulo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.0,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text('New', style: TextStyle(color: Color(0xff532128), fontSize: 50.0),),
        ),
        Stack(
          children: [
            Positioned(
              bottom: 5,
              child: Container(
                width: 120, height: 8,
                color: Color(0xffF7CDD5),
              ),
            ),
            Text('List', style: TextStyle(color: Color(0xffD93A30), fontSize: 50.0),),
          ],
        )
      ],
    );
  }
}

class _ItemListView extends StatelessWidget {

  final items = [
      _ItemPersonalizado( 'Orange', Color(0xffF08F66) ),
      _ItemPersonalizado( 'Family', Color(0xffF2A38A) ),
      _ItemPersonalizado( 'Orange', Color(0xffF08F66) ),
      _ItemPersonalizado( 'Family', Color(0xffF2A38A) ),
      _ItemPersonalizado( 'Orange', Color(0xffF08F66) ),
      _ItemPersonalizado( 'Family', Color(0xffF2A38A) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => items[index]
      

    );
  }
}

class _ItemPersonalizado extends StatelessWidget {
  final String texto;
  final Color color;

  _ItemPersonalizado(
    this.texto, this.color
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.texto, style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.centerLeft,
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}
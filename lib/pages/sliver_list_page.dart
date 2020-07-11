import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _MainScroll()
      //_ItemListView()
      //_ItemListView(),
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
        SliverAppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('tituloooooooo'),
          elevation: 0,
          floating: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            items 
          )
        )
      ],
    );
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
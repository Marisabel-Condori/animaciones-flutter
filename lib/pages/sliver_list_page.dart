import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Titulo()
      //_ItemListView(),
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          child: Text('green', style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),),
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.centerLeft,
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10.0)
          ),
        );
      },

    );
  }
}
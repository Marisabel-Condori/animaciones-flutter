import 'package:custom_painter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LauncherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('launcher page'),
      ),
      body: _ListaOpciones(),
      drawer: _Menu(),
    );
  }
}
class _ListaOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: Colors.blue,),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(Icons.chevron_right, color: Colors.blue,),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>pageRoutes[i].page));
        },
      ), 
      separatorBuilder: (context, i) => Divider(
        color: Colors.blue
        
      ), 
    );
  }
}

class _Menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                height: 200.0,
                child: CircleAvatar(child: Text('MA', style: TextStyle(fontSize: 80.0),) )
              ),
            ),
            Expanded(child: _ListaOpciones()),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: Colors.blue,),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: true, 
                onChanged: (value){}
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_to_home_screen, color: Colors.blue,),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: true, 
                onChanged: (value){}
              ),
            )
          ],
        ),
      ),
    );
  }
}
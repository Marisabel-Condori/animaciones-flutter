import 'package:custom_painter/routes/routes.dart';
import 'package:custom_painter/theme/themeChanger.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('launcher tablet page'),
      ),
      body: _ListaOpciones(),
      drawer: _Menu(),
    );
  }
}
class _ListaOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: appTheme.accentColor,),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>pageRoutes[i].page));
        },
      ), 
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight
        
      ), 
    );
  }
}

class _Menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final acentColor = appTheme.currentTheme.accentColor;
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                height: 200.0,
                child: CircleAvatar(child: Text('MA', style: TextStyle(fontSize: 80.0),),
                backgroundColor: acentColor )
              ),
            ),
            Expanded(child: _ListaOpciones()),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: acentColor,),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.getDarkTheme, 
                onChanged: (value) =>  appTheme.setDarkTheme = value
              ),
            ),
            SafeArea(
              bottom: true,
              top: false, left: false, right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: acentColor,),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.getCustomTheme, 
                  onChanged: (value) => appTheme.setCustomTheme = value  
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
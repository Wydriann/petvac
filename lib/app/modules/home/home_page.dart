import 'package:flutter/material.dart';
import 'package:petvac/app/utils/routes.dart';

class HomePage extends StatefulWidget {
  final String title;

  static const String route = '/home';

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
         children: <Widget>[
           // Icones do Menu (Drawer);
           _addDrawerItem(
             Icons.home,
            "home", 
            () => Navigator.pushReplacementNamed(context, Routes.home)
            ),

            _addDrawerItem(
             Icons.mouse,
            "Tipos de Pet", 
            () => Navigator.pushReplacementNamed(context, Routes.petTipos)
            ),

            _addDrawerItem(
             Icons.pets,
            "Pets", 
            null),

         ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}

  @override
  Widget _addDrawerItem (_icon, _text, _onTap) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(_icon),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(_text),
            ),
        ],
        ),
        onTap: null,
    );
  }


import 'package:flutter/material.dart';
import 'routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
        onTap: _onTap,
    );
  }

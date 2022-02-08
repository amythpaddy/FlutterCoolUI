import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Center(
                  child: Text(
            'Awesome Flutter Widgets',
            style: TextStyle(fontFamily: 'AlexBrush', fontSize: 32),
            textAlign: TextAlign.center,
          ))),
          ListTile(
            title: Text('Home'),
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          ListTile(
            title: Text('Neumorphic Button'),
            onTap: () => Navigator.pushNamed(context, '/neumorphismBtn'),
          )
        ],
      ),
    );
  }
}

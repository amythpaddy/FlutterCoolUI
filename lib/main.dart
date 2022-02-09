import 'package:cool_flutter_ui/buttons/neumorphismButton.dart';
import 'package:cool_flutter_ui/sidebar/animatedSidebar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: {
        '/': (_) => AnimatedSidebarScaffold(),
        '/neumorphismBtn': (_) => NeumorphismButton()
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/welcome.json'),
    );
  }
}

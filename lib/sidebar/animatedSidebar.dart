import 'package:cool_flutter_ui/buttons/neumorphismButton.dart';
import 'package:cool_flutter_ui/sidebar/components.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class AnimatedSidebarScaffold extends StatefulWidget {
  final Color backgroundColor;

  AnimatedSidebarScaffold({Key key, this.backgroundColor}) : super(key: key);
  @override
  _AnimatedSidebarScaffoldState createState() =>
      _AnimatedSidebarScaffoldState();
}

class _AnimatedSidebarScaffoldState extends State<AnimatedSidebarScaffold>
    with SingleTickerProviderStateMixin {
  bool _openSidebar = false;
  AnimationController _animationController;
  Widget _body;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    _body = HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepPurpleAccent, Colors.deepPurple],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          AnimatedContainer(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20),
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
                color: widget.backgroundColor ?? Colors.white,
                borderRadius: _openSidebar ? BorderRadius.circular(15) : null),
            transform: _openSidebar
                ? Matrix4.identity()
                : (Matrix4.identity()..translate(-300.0)),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.grey)),
                  padding: EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/profile_image.jpeg',
                      height: 100,
                      width: 100,
                      fit: BoxFit.fitHeight,
                      scale: 2.0,
                    ),
                  ),
                ),
                Text(
                  "Amit Shekhar Pandey",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                PersonalDetails(
                  icon: Icons.email_outlined,
                  text: 'amythshekhar@gmail.com',
                ),
                PersonalDetails(
                  icon: Icons.phone_outlined,
                  text: '+91-9690741231',
                ),
                PersonalDetails(
                  icon: Icons.code_outlined,
                  text: 'github.com/amythpaddy',
                ),
                Container(width: 150, child: Divider()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SideBarMenuItem(
                      icon: Icons.home,
                      text: 'Home',
                      onPressed: () {
                        setState(() {
                          _body = HomePage();
                        });
                      },
                    ),
                    SideBarMenuItem(
                      icon: Icons.smart_button,
                      text: 'Neumorphic Button',
                      onPressed: () {
                        setState(() {
                          _body = NeumorphismButton();
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
                color: widget.backgroundColor ?? Colors.white,
                borderRadius: _openSidebar ? BorderRadius.circular(15) : null),
            transform: _openSidebar
                ? (Matrix4.identity()
                  ..scale(.9, .8)
                  ..translate(300.0, 90.0))
                : Matrix4.identity(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 30,
                  color: Colors.deepPurpleAccent,
                ),
                Container(
                  height: 50,
                  color: Colors.deepPurpleAccent,
                  child: Row(
                    children: [
                      IconButton(
                        icon: AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          progress: _animationController,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _openSidebar
                              ? _animationController.reverse()
                              : _animationController.forward();
                          setState(() {
                            _openSidebar = !_openSidebar;
                          });
                        },
                      )
                    ],
                  ),
                ),
                Expanded(child: _body)
              ],
            ),
          )
        ],
      ),
    );
  }
}

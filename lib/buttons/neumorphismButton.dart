import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NeumorphismButton extends StatefulWidget {
  @override
  NeumorphismButtonState createState() => NeumorphismButtonState();
}

class NeumorphismButtonState extends State<NeumorphismButton> {
  bool _isElevated = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isElevated = !_isElevated;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(50),
                boxShadow: _isElevated
                    ? [
                        BoxShadow(
                            color: Colors.grey[500],
                            offset: Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1)
                      ]
                    : null,
                border: Border.all(
                    color:
                        _isElevated ? Colors.transparent : Colors.grey[400])),
            child: Icon(
              Icons.power_settings_new_outlined,
              size: 40,
              color: _isElevated ? Colors.green[300] : Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}

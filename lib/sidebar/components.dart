import 'package:flutter/material.dart';

class SideBarMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;

  const SideBarMenuItem({Key key, this.icon, this.text, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon),
            SizedBox(
              width: 10,
            ),
            Text(text)
          ]),
    );
  }
}

class PersonalDetails extends StatelessWidget {
  final IconData icon;
  final String text;

  const PersonalDetails({Key key, this.icon, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 14),
        )
      ],
    );
  }
}

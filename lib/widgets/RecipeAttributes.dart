import 'package:flutter/material.dart';

class MenuItemAttribute extends StatelessWidget {
  const MenuItemAttribute({
    Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  final dynamic text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 6,
        ),
        Text('$text')
      ],
    );
  }
}

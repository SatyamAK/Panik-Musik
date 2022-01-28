import 'package:flutter/material.dart';

ElevatedButton button(Color color, String string, IconData icon,
    void Function() onPressed, BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color
    ),
    onPressed: onPressed,
    child: Container(   
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(  
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon),
          Text(string, style: Theme.of(context).textTheme.button)
        ],
      ),
    )
  );
}

IconButton mediabutton(IconData iconData, VoidCallback onPressed, BuildContext context) => IconButton(
  icon: Icon(iconData, color: Theme.of(context).primaryColor,),
  iconSize: 64.0,
  onPressed: onPressed,
);
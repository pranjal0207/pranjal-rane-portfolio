import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onPress;

  const NavigationBarItem({ 
    required this.title,
    required this.isActive,
    required this.onPress,
    Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(
          title,
          style: TextStyle(
            color: (isActive)? Colors.blue : Colors.black,
            fontSize: 18
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
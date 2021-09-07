import 'package:flutter/material.dart';

class MobileDrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool isActive;

  const MobileDrawerItem({ 
    required this.title,
    required this.onPress,
    required this.isActive,
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress, 
      child: Text(
        title,
        style: TextStyle(
          color: (isActive)? Color(0xff805ad5) : Colors.black,
          fontSize: 22
        ),
      )
    );
  }
}
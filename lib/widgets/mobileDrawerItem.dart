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
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: (isActive)? Colors.blue : Colors.black,
          fontSize: 18
        ),
      ),
      onTap: onPress,
      hoverColor: Colors.blue.shade100,
    );
  }
}
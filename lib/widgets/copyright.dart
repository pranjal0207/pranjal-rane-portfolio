import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  const Copyright({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        color: Color(0XFF242830)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
          "Copyright ",
            style: TextStyle(
              color: Colors.white
            ),
          ),

          Icon(
            Icons.copyright_sharp,
            color: Colors.white,
            size: 15,
          ),

          Text(
          " 2021 Pranjal Rane. All Rights Reserved.",
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}
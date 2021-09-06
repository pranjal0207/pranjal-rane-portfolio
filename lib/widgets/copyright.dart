import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  const Copyright({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0XFF242830)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 20,
            child : SelectableText(
              "Designed & Built by Pranjal Rane",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
}
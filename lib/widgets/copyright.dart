import 'package:flutter/material.dart';
import 'dart:js' as js;

class Copyright extends StatefulWidget {
  const Copyright({ Key? key }) : super(key: key);

  @override
  _CopyrightState createState() => _CopyrightState();
}

class _CopyrightState extends State<Copyright> {
  bool hover = false;

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
            child : MouseRegion(
              onHover: (_){
                setState(() {
                  hover = true;
                });
              },
              onExit: (_){
                setState(() {
                  hover = false;
                });
              },
              child: TextButton(
                onPressed: (){
                  js.context.callMethod('open', ["https://github.com/pranjal0207/pranjal-rane-portfolio"]);
                }, 
                child: Text(
                  "Designed & Built by Pranjal Rane",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: (hover)? TextDecoration.underline : null
                  ),
                ),
              )
            )
          ),
        ],
      ),
    );
  }
}
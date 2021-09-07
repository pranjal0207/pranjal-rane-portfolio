import 'package:flutter/material.dart';
import 'dart:js' as js;

class ResumeButton extends StatefulWidget {
  final String resumeLink;
  const ResumeButton({
    required this.resumeLink,
    Key? key 
  }) : super(key: key);

  @override
  _ResumeButtonState createState() => _ResumeButtonState();
}

class _ResumeButtonState extends State<ResumeButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
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
        child: ElevatedButton(
          child: Text(
            "Resume",
            style: TextStyle(
              color: (hover)? Colors.white : Color(0xff805ad5),
              fontWeight: FontWeight.w200,
              fontSize: 17
            ),
          ),
          onPressed: () {
            js.context.callMethod('open', [widget.resumeLink]);
          },
          style: ElevatedButton.styleFrom(
            side: BorderSide(color: Color(0xff805ad5)),
            primary: (hover)? Color(0xff805ad5) : Colors.white,
            fixedSize: Size(100, 40),
            shadowColor: Colors.white
          ),
        ),
      ),
    );
  }
}
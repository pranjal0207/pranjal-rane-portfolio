import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class GetInTouch extends StatefulWidget {
  final String email;
  const GetInTouch({ 
    required this.email,
    Key? key 
  }) : super(key: key);

  @override
  _GetInTouchState createState() => _GetInTouchState();
}

class _GetInTouchState extends State<GetInTouch> {
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
            "Get in Touch",
            style: TextStyle(
              color: (hover)? Colors.white : Color(0xff805ad5),
              fontWeight: FontWeight.w200,
              fontSize: 17
            ),
          ),
          onPressed: () async{
            final mail = Mailto(
              to: [widget.email],
            );

            await launch('$mail');
          },
          style: ElevatedButton.styleFrom(
            side: BorderSide(color: Color(0xff805ad5)),
            primary: (hover)? Color(0xff805ad5) : Colors.white,
            fixedSize: Size(300, 50),
            shadowColor: Colors.white
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:js' as js;

import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left : 10, right: 10),
      width: screenWidth - 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children : <Widget>[
          Container(
            child: SelectableText(
              "Contact Me",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(
            height: 25,
          ),

          Container(
            child: SelectableText(
              "Need anything built, want to work together or simply want to have a chat?",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Container(
            child: SelectableText(
              "Drop me a mail at pranjal020700@gmail.com, or click one of the icons below :",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () async{
                    final mail = Mailto(
                      to: ['pranjal020700@gmail.com'],
                    );

                    await launch('$mail');
                  }, 
                  icon: Icon(Icons.mail_outline),
                  tooltip : "Email"
                ),

                IconButton(
                  onPressed: (){
                    js.context.callMethod('open', ["https://github.com/pranjal0207"]);
                  }, 
                  icon: Image.asset("assets/icons/githubIcon.png"),
                  splashColor: Colors.transparent,
                  splashRadius: 0.1,
                  tooltip : "GitHub"
                ),

                IconButton(
                  onPressed: () {
                  }, 
                  icon: Image.asset(
                    "assets/icons/linkedinIcon.png",
                    height: 48,
                    width: 48,
                  ),
                  tooltip : "LinkedIn"
                ),
              ],
            ),
          ),

          SizedBox(
            height: 30,
          )
        ]
      ),
    );
  }
}
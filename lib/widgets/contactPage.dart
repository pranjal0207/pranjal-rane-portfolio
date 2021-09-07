import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:pranjal_rane_portfolio/widgets/socialNetworks.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(left : 10, right: 10),
      width: screenWidth - 20,
      height: (screenHeight < 780)? screenHeight : screenHeight * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children : <Widget>[
          Container(
            child: SelectableText(
              "Contact",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(
            height: 25,
          ),

          LayoutBuilder(builder: (context, constraints){
          if (constraints.maxWidth > 780)
            return desktopView();
          
            else
              return mobileView(screenWidth);
          }),

          SizedBox(
            height: 25,
          ),

          GetInTouch(email: "pranjal020700@gmail.com"),

          SizedBox(
            height: 35,
          ),

          SocialNetworks(
            socialNetworks: ['github', 'linkedin', 'twitter'],
            socialNetworkLinks: ["https://github.com/pranjal0207", "https://www.linkedin.com/in/pranjal-rane/", "https://twitter.com/pranjal_rane"],
          ),
        ]
      ),
    );
  }

  Widget desktopView(){
    return Container(
      constraints: BoxConstraints(maxWidth: 800),
      child: Column(
        children: <Widget>[
          Container(
            child: SelectableText(
              "I'm currently open to collaborating and actively looking for full-time job opportunties, so if you like what you've seen please don't hesitate to get in touch!",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Container(
            child: SelectableText(
              "If you have any questions or would just like to say hi, my inbox is always open and I'll endeavour to get back to you as soon as I can.",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileView(double screenWidth){
    return Container(
      width: screenWidth * 0.9,
      child: Column(
        children: <Widget>[
          Container(
            child: SelectableText(
              "I'm currently open to collaborating and actively looking for full-time job opportunties, so if you like what you've seen please don't hesitate to get in touch!",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Container(
            child: SelectableText(
              "If you have any questions or would just like to say hi, my inbox is always open and I'll endeavour to get back to you as soon as I can.",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

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
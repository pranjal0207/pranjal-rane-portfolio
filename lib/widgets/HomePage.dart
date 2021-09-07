import 'package:flutter/material.dart';
import 'package:pranjal_rane_portfolio/widgets/getInTouch.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: LayoutBuilder(builder: (context, constraints){
      if (constraints.maxWidth > 780)
        return desktopView();
      
        else
          return mobileView(screenWidth);
      }),
    );
  }

  Widget desktopView(){
    return Container(
      padding: EdgeInsets.only(top: 90, bottom: 90, left: 40),
      constraints: BoxConstraints(maxWidth: 1200),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 45,
                child: SelectableText(
                  "Hello, I'm",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
                  
              Container(
                height: 150,
                child: SelectableText(
                  "Pranjal Rane",
                  style: TextStyle(
                    fontSize: 96,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),   

              Container(
                height: 70,
                child: SelectableText(
                  "Computer Science Student",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff805ad5)
                  ),
                ),
              ),

              Container(
                constraints: BoxConstraints(maxWidth: 700),
                child: SelectableText(
                  "A curiousity-driven coder with a passion for designing and building softwares, along with a keen interest in Machine Learning",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ), 

              SizedBox(
                height: 30,
              ),

              Container(
                child: GetInTouch(
                  email: "pranjal020700@gmail.com"
                ),
              )    
            ],
          ),
        ],
      )
    );
  }

  Widget mobileView(double screenWidth) {
    return Container(
      padding: EdgeInsets.only(top: 50, bottom: 50, left: 20),
      width: screenWidth * 0.95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(maxWidth: 700),
            child: SelectableText(
              "Hello, I'm",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.start,
            ),
          ),

          SizedBox(
            height: 15,
          ),
                  
          Container(
            constraints: BoxConstraints(maxWidth: 700),
            child: SelectableText(
              "Pranjal Rane",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w700
              ),
              textAlign: TextAlign.start,
            ),
          ),

          SizedBox(
            height: 15,
          ),

          Container(
            constraints: BoxConstraints(maxWidth: 700),
            child: SelectableText(
              "Computer Science Student",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Color(0xff805ad5)
              ),
              textAlign: TextAlign.start,
            ),
          ),

          SizedBox(
            height: 15,
          ),

          Container(
            constraints: BoxConstraints(maxWidth: 700),
            child: SelectableText(
              "A curiousity-driven coder with a passion for designing and building softwares, along with a keen interest in Machine Learning",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ), 

          SizedBox(
            height: 30,
          ),

          Container(
            child: GetInTouch(
              email: "pranjal020700@gmail.com"
            ),
          )    
        ],
      ),
    );
  }
}
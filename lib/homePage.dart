import 'package:flutter/material.dart';
import 'package:pranjal_rane_portfolio/widgets/aboutPage.dart';
import 'package:pranjal_rane_portfolio/widgets/contactPage.dart';
import 'package:pranjal_rane_portfolio/widgets/navigationBarItem.dart';
import 'package:pranjal_rane_portfolio/widgets/projectsPage.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final aboutKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  bool aboutPageActive = true;
  bool projectPageActive = false;
  bool contactPageActive = false;

  final double maxWidth = 1400;

  Future scrollPage(key) async{
    final context = key.currentContext!;

    await Scrollable.ensureVisible(
      context,
      alignment: 0.5,
      duration: Duration(milliseconds: 500)
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints){
          if (constraints.maxWidth > 715)
            return desktopView();
          
          else
           return mobileView();
        })
      ),
    );
  }

  Widget desktopView() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top : 25, bottom: 25, left: 15, right: 15),
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(
                  "PRANJAL RANE",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    //color: Colors.white
                  ),
                ),
              ),

              Row(
                children: <Widget>[
                  NavigationBarItem(
                    title: "ABOUT",
                    isActive: aboutPageActive, 
                    onPress: (){
                      setState(() {
                        aboutPageActive = true;
                        projectPageActive = false;
                        contactPageActive = false;
                      });
                      scrollPage(aboutKey);
                    }
                  ),
                  
                  SizedBox(
                    width: 20,
                  ),

                  NavigationBarItem(
                    title: "PROJECTS", 
                    isActive: projectPageActive, 
                    onPress: (){
                      setState(() {
                        aboutPageActive = false;
                        projectPageActive = true;
                        contactPageActive = false;
                      });
                      scrollPage(projectKey);
                    }
                  ),

                  SizedBox(
                    width: 20,
                  ),
                    
                  NavigationBarItem(
                    title: "CONTACT",
                    isActive: contactPageActive,  
                    onPress: (){
                      setState(() {
                        aboutPageActive = false;
                        projectPageActive = false;
                        contactPageActive = true;
                      });
                      scrollPage(contactKey);
                    }
                  ),
                ],
              ),
            ],
          )
        ),
        
        Expanded(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    key: aboutKey,
                    child: AboutPage(),
                  ),

                  Container(
                    key: projectKey,
                    child: ProjectPage(),
                  ),

                  Container(
                    key: contactKey,
                    child: ContactPage(),
                  ),
                ],
              ),
            )
          )
        )
      ]
    );
  }

  Widget mobileView() {
    return Container(
      child: Center(
        child: Text(
          "Mobile"
        ),
      ),
    );
  }
}


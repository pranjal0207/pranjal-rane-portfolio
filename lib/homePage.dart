import 'package:flutter/material.dart';
import 'package:pranjal_rane_portfolio/widgets/NavigationBar.dart';
import 'package:pranjal_rane_portfolio/widgets/aboutPage.dart';
import 'package:pranjal_rane_portfolio/widgets/contactPage.dart';
import 'package:pranjal_rane_portfolio/widgets/copyright.dart';
import 'package:pranjal_rane_portfolio/widgets/mobileDrawer.dart';
import 'package:pranjal_rane_portfolio/widgets/mobileNavigationBar.dart';
import 'package:pranjal_rane_portfolio/widgets/projectsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final aboutKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool aboutPageActive = true;
  bool projectPageActive = false;
  bool contactPageActive = false;

  List<String> navigationItems = ['About', 'Projects', 'Contact'];
  List<dynamic> navigationItemsKeys = [];
  List<bool> navigationItemActiveState = [];

  @override
  void initState() {
    super.initState();
    navigationItemsKeys = [aboutKey, projectKey, contactKey];
    navigationItemActiveState = List<bool>.filled(navigationItems.length, false);
    navigationItemActiveState[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MobileDrawer(
        drawerItems: navigationItems,
        drawerItemsKey: navigationItemsKeys,
        mobileDrawerActiveState: navigationItemActiveState,
      ),
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
        NavigationBar(
          navigationItems: navigationItems, 
          navigationItemsKeys: navigationItemsKeys,
          navigationItemActiveState : navigationItemActiveState
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

                  Copyright()
                ],
              ),
            )
          )
        )
      ]
    );
  }

  Widget mobileView() {
    return Column(
      children: <Widget>[
        MobileNavigationBar(scaffoldKey: _scaffoldKey),

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

                  Copyright()
                ],
              ),
            )
          )
        )
      ],
    );
  }
}


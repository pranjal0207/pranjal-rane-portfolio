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

  List<String> navigationBarItems = ['About', 'Projects', 'Contact'];
  List<dynamic> navigationItemsKeys = [];

  List<bool> mobileDrawerActiveState = [];


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
    navigationItemsKeys = [aboutKey, projectKey, contactKey];
    mobileDrawerActiveState = List<bool>.filled(navigationBarItems.length, false);
    mobileDrawerActiveState[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MobileDrawer(
        drawerItems: navigationBarItems,
        drawerItemsKey: navigationItemsKeys,
        mobileDrawerActiveState: mobileDrawerActiveState,
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
          navigationItems: navigationBarItems, 
          navigationItemsKeys: navigationItemsKeys
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


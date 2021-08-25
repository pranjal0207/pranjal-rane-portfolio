import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints){
          if (constraints.maxWidth > 715){
            return desktopView();
          }
          else{
            return mobileView();
          }
        })
      ),
    );
  }

  Widget desktopView() {
    return Container(
      child: Center(
        child: Text(
          "Desktop"
        ),
      ),
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


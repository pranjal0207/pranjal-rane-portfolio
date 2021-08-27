import 'package:flutter/material.dart';
import 'package:pranjal_rane_portfolio/widgets/titleName.dart';

class MobileNavigationBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const MobileNavigationBar({ 
    required this.scaffoldKey,
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        children: <Widget>[
          Container(
            child: IconButton(
              onPressed: (){
                scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(Icons.menu),
              iconSize: 30,
            ),
          ),

          SizedBox(
            width: 10,
          ),

          TitleName()
        ],
      ),
    );
  }
}
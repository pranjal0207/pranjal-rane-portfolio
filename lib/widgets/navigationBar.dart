import 'package:flutter/material.dart';
import 'package:pranjal_rane_portfolio/widgets/navigationBarItem.dart';
import 'package:pranjal_rane_portfolio/widgets/titleName.dart';
import 'dart:js' as js;

class NavigationBar extends StatefulWidget {
  final List<String> navigationItems;
  final List<dynamic> navigationItemsKeys;
  final List<bool> navigationItemActiveState;
  final String resume;
  
  const NavigationBar({  
    required this.navigationItems,
    required this.navigationItemsKeys,
    required this.navigationItemActiveState,
    required this.resume,
    Key? key 
  }) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  Future scrollPage(key) async{
    final context = key.currentContext!;

    await Scrollable.ensureVisible(
      context,
      duration: Duration(milliseconds: 500)
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double maxWidth = 1400;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top : 25, bottom: 25, left : 20, right: 20),
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TitleName(),

          Container(
            width: screenWidth * 0.4,
            child: Row(
              children: <Widget>[
                for(int i = 0; i < widget.navigationItems.length + 1; i++)
                Container(
                  height: 30,
                  width: screenWidth * 0.4 / (widget.navigationItems.length + 1),
                  child: (i < widget.navigationItems.length)? NavigationBarItem(
                    title: widget.navigationItems[i], 
                    isActive: widget.navigationItemActiveState[i], 
                    onPress: (){
                      scrollPage(widget.navigationItemsKeys[i]);
                      setState(() {
                        for (int j = 0; j < widget.navigationItems.length; j++){
                          if(j == i)
                            widget.navigationItemActiveState[j] = true;
                          else 
                            widget.navigationItemActiveState[j] = false;
                        }
                      });
                    }
                  ): 
                  ElevatedButton(
                    onPressed: (){
                      js.context.callMethod('open', [widget.resume]);
                    }, 
                    child: Text("Resume"),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(30, 30)
                    ),
                  ),
                )
              ]
            ),
          )
          
        ],
      ),
    );
  }
}


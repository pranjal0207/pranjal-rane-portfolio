import 'package:flutter/material.dart';
import 'package:pranjal_rane_portfolio/widgets/navigationBarItem.dart';
import 'package:pranjal_rane_portfolio/widgets/titleName.dart';

class NavigationBar extends StatefulWidget {
  final List<String> navigationItems;
  final List<dynamic> navigationItemsKeys;
  
  const NavigationBar({  
    required this.navigationItems,
    required this.navigationItemsKeys,
    Key? key 
  }) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  List<bool> navigationItemActiveState = [];

  Future scrollPage(key) async{
    final context = key.currentContext!;

    await Scrollable.ensureVisible(
      context,
      alignment: 0.5,
      duration: Duration(milliseconds: 500)
    );
  }

  void initActiveStateController(){
    navigationItemActiveState[0] = true;
    for (int i = 1; i < widget.navigationItems.length; i++){
      setState(() {
        navigationItemActiveState[i] = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    navigationItemActiveState = List<bool>.filled(widget.navigationItems.length, false);
    navigationItemActiveState[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    final double maxWidth = 1400;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top : 25, bottom: 25, left: 15, right: 15),
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TitleName(),

          Container(
            height: 50,
            width: screenWidth * 0.25,
            child: ListView.builder(
              itemCount: widget.navigationItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return Container(
                  height: 50,
                  width: screenWidth * 0.25 / widget.navigationItems.length,
                  child: NavigationBarItem(
                    title: widget.navigationItems[index], 
                    isActive: navigationItemActiveState[index], 
                    onPress: (){
                      scrollPage(widget.navigationItemsKeys[index]);
                      setState(() {
                        for (int i = 0; i < widget.navigationItems.length; i++){
                          if(i == index)
                            navigationItemActiveState[i] = true;
                          else 
                            navigationItemActiveState[i] = false;
                        }
                      });
                    }
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}


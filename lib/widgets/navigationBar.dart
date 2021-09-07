import 'package:flutter/material.dart';
import 'package:pranjal_rane_portfolio/widgets/navigationBarItem.dart';
import 'package:pranjal_rane_portfolio/widgets/resumeButton.dart';
import 'package:pranjal_rane_portfolio/widgets/titleName.dart';

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
  bool hover = false;

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
    final double maxWidth = 1200;
    //final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top : 25, bottom: 25, left : 20, right: 20),
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TitleName(),

          Container(
            width: maxWidth * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                for(int i = 0; i < widget.navigationItems.length; i++)
                Container(
                  height: 30,
                  child:  NavigationBarItem(
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
                  )
                )
              ]
            ),
          ),

          ResumeButton(
            resumeLink: "https://drive.google.com/file/d/1eAk6Wt60WtcaGnzjhLGJWxCSg_iB3IgZ/view?usp=sharing"
          )        
        ],
      ),
    );
  }
}


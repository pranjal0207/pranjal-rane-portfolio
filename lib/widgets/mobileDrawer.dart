import 'package:flutter/material.dart';
import 'package:pranjal_rane_portfolio/widgets/resumeButton.dart';
import 'dart:js' as js;
import 'mobileDrawerItem.dart';

class MobileDrawer extends StatefulWidget {
  final List<String> drawerItems;
  final List<dynamic> drawerItemsKey;
  final List<bool> mobileDrawerActiveState;

  const MobileDrawer({ 
    required this.drawerItems,
    required this.drawerItemsKey,
    required this.mobileDrawerActiveState,
    Key? key 
  }) : super(key: key);

  @override
  _MobileDrawerState createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  Future scrollPage(key) async{
    final context = key.currentContext!;

    await Scrollable.ensureVisible(
      context,
      duration: Duration(milliseconds: 800)
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white
      ), 
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top : 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    icon: Icon(Icons.close),
                    iconSize: 35,
                  )
                ],
              ),
            ),

            Container(
              height: 200,
              child: ListView.builder(
                itemCount: widget.drawerItems.length,
                itemBuilder: (context, index){
                  return Container(
                    height: 200 / widget.drawerItems.length,
                    child: MobileDrawerItem(
                      title: widget.drawerItems[index], 
                      isActive: widget.mobileDrawerActiveState[index],
                      onPress: (){
                        scrollPage(widget.drawerItemsKey[index]);
                        setState(() {
                          for (int i = 0; i < widget.drawerItems.length; i++){
                            if(i == index){
                              widget.mobileDrawerActiveState[i] = true;}
                            else 
                              widget.mobileDrawerActiveState[i] = false;
                          }
                          
                        });
                        Navigator.pop(context);
                      }
                    ),
                  );
                }
              )
            ),

            Expanded(
              child : Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ResumeButton(
                      resumeLink: "https://drive.google.com/file/d/1eAk6Wt60WtcaGnzjhLGJWxCSg_iB3IgZ/view?usp=sharing"
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          onPressed: (){
                            js.context.callMethod('open', ["https://github.com/pranjal0207"]);
                          }, 
                          icon: Image.asset(
                            "assets/icons/githubIcon.png",
                            height: 48,
                            width: 48,
                          ),
                          splashColor: Colors.transparent,
                          splashRadius: 0.1,
                          iconSize: 15,
                          tooltip : "GitHub"
                        ),

                        SizedBox(
                          width: 10,
                        ),

                        IconButton(
                          onPressed: () {
                            js.context.callMethod('open', ["https://www.linkedin.com/in/pranjal-rane/"]);
                          }, 
                          icon: Image.asset(
                            "assets/icons/linkedinIcon.png",
                            height: 48,
                            width: 48,
                          ),
                          splashColor: Colors.transparent,
                          splashRadius: 0.1,
                          iconSize: 15,
                          tooltip : "LinkedIn"
                        ),

                        SizedBox(
                          width: 10,
                        ),

                        IconButton(
                          onPressed: () {
                            js.context.callMethod('open', ["https://twitter.com/pranjal_rane"]);
                          }, 
                          icon: Image.asset(
                            "assets/icons/twitterIcon.png",
                            height: 48,
                            width: 48,
                          ),
                          splashColor: Colors.transparent,
                          splashRadius: 0.1,
                          iconSize: 15,
                          tooltip : "Twitter"
                        ),
                      ],
                    ),
                  ]
                )
              )
            )
          ],
        ),
      )
    );
  }
}
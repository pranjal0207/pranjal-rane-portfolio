import 'package:flutter/material.dart';
import 'package:pranjal_rane_portfolio/widgets/titleName.dart';

import 'mobileDrawerItem.dart';

class MobileDrawer extends StatefulWidget {
  final List<String> drawerItems;
  final List<dynamic> drawerItemsKey;

  const MobileDrawer({ 
    required this.drawerItems,
    required this.drawerItemsKey,
    Key? key 
  }) : super(key: key);

  @override
  _MobileDrawerState createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  List<bool> mobileDrawerActiveState = [];

  Future scrollPage(key) async{
    final context = key.currentContext!;

    await Scrollable.ensureVisible(
      context,
      alignment: 0.5,
      duration: Duration(milliseconds: 500)
    );
  }

  void initActiveStateController(){
    mobileDrawerActiveState[0] = true;
    for (int i = 1; i < widget.drawerItems.length; i++){
      setState(() {
        mobileDrawerActiveState[i] = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    mobileDrawerActiveState = List<bool>.filled(widget.drawerItems.length, false);
    mobileDrawerActiveState[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 20),
            child: TitleName(),
          ),

          Container(
            margin: EdgeInsets.only(left : 10, right: 10),
            child : Divider(
              thickness: 1,
              color: Colors.black,
            )
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
                    isActive: mobileDrawerActiveState[index],
                    onPress: (){
                      setState(() {
                        for (int i = 0; i < widget.drawerItems.length; i++){
                          if(i == index)
                            mobileDrawerActiveState[i] = true;
                          else 
                            mobileDrawerActiveState[i] = false;
                        }
                      });
                      scrollPage(widget.drawerItemsKey[index]);
                      Navigator.pop(context);
                    }
                  ),
                );
              }
            )
          )
        ],
      ),
    );
  }
}
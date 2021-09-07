import 'package:flutter/material.dart';
import 'dart:js' as js;

class SocialNetworks extends StatelessWidget {
  final List<String> socialNetworks;
  final List<String> socialNetworkLinks;

  const SocialNetworks({ 
    required this.socialNetworks,
    required this.socialNetworkLinks,
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for(int i = 0; i < socialNetworks.length; i++)
          Container(
            child: IconButton(
              icon: Image.asset(
                "assets/icons/" + socialNetworks[i].toLowerCase() + "Icon.png",
                height: 48,
                width: 48,
              ),
              onPressed: (){
                js.context.callMethod('open', [socialNetworkLinks[i]]);
              },
              tooltip: socialNetworks[i][0].toUpperCase() + socialNetworks[i].substring(1),
              splashColor: Colors.transparent,
              splashRadius: 0.1,
            ),
          )
        ]
      ),
    );
  }
}
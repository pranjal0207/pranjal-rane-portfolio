import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 40),
      constraints: BoxConstraints(maxWidth: 1400),
      child: Column(
        children: <Widget>[
          Container(
            child: SelectableText(
              "About Me",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          SizedBox(
            height: 40,
          ),

          LayoutBuilder(builder: (context, constraints){
          if (constraints.maxWidth > 780)
            return desktopView();
          
          else
            return mobileView();
        })
        ]
      ),
    );
  }

  Widget desktopView() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PersonalIamge(),
          AboutText()            
        ],
      )
    );
  }

  Widget mobileView(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PersonalIamge(),
          SizedBox(
            height: 20,
          ),
          AboutText()            
        ],
      )
    );
  }
}

class PersonalIamge extends StatelessWidget {
  const PersonalIamge({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 450,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/personalImage/pranjal.jpg'),
          fit: BoxFit.fill
        )
      ),
    );
  }
}

class AboutText extends StatelessWidget {
  const AboutText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: (screenWidth > 780)? screenWidth * 0.4 : screenWidth * 0.8,
      child: SelectableText(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec purus erat, scelerisque vitae metus at, porttitor semper magna. Praesent commodo nisl fermentum nulla convallis aliquam. Sed non consectetur urna, varius fermentum risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus eget tempus quam, vel gravida nisi. Etiam quis sollicitudin odio, vitae pulvinar purus. Pellentesque bibendum pulvinar nibh sed efficitur. Cras id dictum ex, quis tempor nisl. Aenean sodales porttitor pulvinar.\n \nPraesent suscipit pulvinar consequat. Morbi risus tortor, venenatis at accumsan id, lobortis eget orci. Donec et est et eros volutpat accumsan. Nulla ut malesuada libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam et lorem condimentum, tempor dui auctor, auctor dui. Aenean posuere nisi vitae nibh tempor, eget aliquet sem molestie. Donec dictum lorem sed enim suscipit, sit amet mollis libero vulputate. Fusce faucibus porttitor ornare. Sed tristique urna lacus, nec aliquam orci rutrum vitae. Suspendisse gravida turpis nunc. Duis turpis erat, auctor faucibus leo vitae, tempor ullamcorper orci. Sed sapien metus, egestas non libero ac, maximus egestas turpis. Integer scelerisque nisi justo, in fermentum lacus gravida vitae. Aenean id rhoncus ante, sit amet auctor nibh. Suspendisse potenti. ",
        style: TextStyle(
          fontSize: 16,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
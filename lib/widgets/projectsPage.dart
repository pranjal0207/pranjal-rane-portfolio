import 'package:flutter/material.dart';
import 'package:pranjal_rane_portfolio/widgets/projectCard.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Center(
            child: SelectableText(
              "MY PROJECTS",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),

        LayoutBuilder(
          builder: (context, constraints){
            if (constraints.maxWidth > 715)
              return desktopView();
            
            else
              return mobileView();
          }
        )
      ],
    );
  }

  Widget desktopView() {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      margin: EdgeInsets.only(top: 40, bottom: 40, left: 15, right: 15),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ProjectCard(
                title: "Web Based System for Face Mask Detection & Face Recognition", 
                description: "This system detects face masks in real-time videostreams. If no mask is found then a photograph is captured and given as an input to the face recognition system and the data is updated. The administrator is informed about this and can later take necessary actions against the defaulter, like reprimanding by sending an email or issuing a fine using the web based system. The administrator can also manage the database of the people using the web based system. The web based system also gives adetailed overview about the demography (pertaining to maskwearing) of the campus by giving comprehensive information using visual methods like bar graphs and pie charts.", 
                image: "assets/projectImages/projectStock.jpg",
                githubRepo: "https://github.com/pranjal0207", 
                paperAvailable: true, 
                paperLink: "https://www.ijariit.com/manuscripts/v7i4/V7I4-1684.pdf",
                technologies: ["python", "tensorflow", "flutter"],
                longDescription: "",
              ),

              ProjectCard(
                title: "Project Name", 
                description: "Project Description", 
                image: "assets/projectImages/projectStock.jpg",
                githubRepo: "https://github.com/pranjal0207",
                paperAvailable: false, 
                paperLink: "",
                technologies: [],
                longDescription: "",
              ),

              ProjectCard(
                title: "Project Name", 
                description: "Project Description", 
                image: "assets/projectImages/projectStock.jpg",
                githubRepo: "https://github.com/pranjal0207",
                paperAvailable: false, 
                paperLink: "",
                technologies: [],
                longDescription: "",
              ),
            ],
          )
        ],
      )
    );
  }

  Widget mobileView() {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 40),
      child: Column(
        children: <Widget>[
          ProjectCard(
            title: "Web Based System for Face Mask Detection & Face Recognition", 
            description: "This system detects face masks in real-time videostreams. If no mask is found then a photograph is captured and given as an input to the facerecognition system abd the data is updated. Thea dministrator is informed about this and can later take necessary actions against the defaulter, like reprimanding by sending an email or issuing a fine using the web based system. The administrator can also manage the database of the people using the web based system. The web based system also gives adetailed overview about the demography (pertaining to maskwearing) of the campus by giving comprehensive informationusing visual methods like bar graphs and pie charts.", 
            image: "assets/projectImages/projectStock.jpg",
            githubRepo: "https://github.com/pranjal0207", 
            paperAvailable: true, 
            paperLink: "https://www.ijariit.com/manuscripts/v7i4/V7I4-1684.pdf",
            technologies: ["python", "tensorflow", "flutter"],
            longDescription: "",
          ),

          SizedBox(
            height: 30,
          ),

          ProjectCard(
            title: "Project Name", 
            description: "Project Description", 
            image: "assets/projectImages/projectStock.jpg",
            githubRepo: "https://github.com/pranjal0207",
            paperAvailable: false, 
            paperLink: "",
            technologies: [],
            longDescription: "",
          ),

          SizedBox(
            height: 30,
          ),

          ProjectCard(
            title: "Project Name", 
            description: "Project Description", 
            image: "assets/projectImages/projectStock.jpg",
            githubRepo: "https://github.com/pranjal0207",
            paperAvailable: false, 
            paperLink: "",
            technologies: [],
            longDescription: "",
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:pranjal_rane_portfolio/widgets/projectCard.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double maxWidth = 1200;
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      margin: EdgeInsets.only(top: 40, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProjectCard(
            title: "Web Based System for Face Mask Detection & Face Recognition", 
            description: "This system detects face masks in real-time videostreams. If no mask is found then a photograph is captured and given as an input to the facerecognition system abd the data is updated. Thea dministrator is informed about this and can later take necessary actions against the defaulter, like reprimanding by sending an email or issuing a fine using the web based system. The administrator can also manage the database of the people using the web based system. The web based system also gives adetailed overview about the demography (pertaining to maskwearing) of the campus by giving comprehensive informationusing visual methods like bar graphs and pie charts.", 
            image: "assets/projectImages/projectStock.jpg",
            githubRepo: "https://github.com/pranjal0207", 
            paperAvailable: true, 
            paperLink: "https://www.ijariit.com/manuscripts/v7i4/V7I4-1684.pdf",
            technologies: ["python", "tensorflow", "flutter"],
          ),

          ProjectCard(
            title: "Project Name", 
            description: "Project Description", 
            image: "assets/projectImages/projectStock.jpg",
            githubRepo: "https://github.com/pranjal0207",
            paperAvailable: false, 
            paperLink: "",
            technologies: [],
          ),

          ProjectCard(
            title: "Project Name", 
            description: "Project Description", 
            image: "assets/projectImages/projectStock.jpg",
            githubRepo: "https://github.com/pranjal0207",
            paperAvailable: false, 
            paperLink: "",
            technologies: [],
          ),
        ],
      )
    );
  }
}
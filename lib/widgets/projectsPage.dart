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
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc varius nec felis quis interdum. Duis vel metus sed lacus iaculis condimentum id ut ante. Praesent gravida mauris vitae ante egestas, eget vestibulum mauris pulvinar. Quisque tellus elit, mollis et enim vitae, lobortis scelerisque tortor. Etiam non arcu sem. Vivamus consectetur.", 
            image: "assets/projectImages/projectStock.jpg",
            githubRepo: "https://github.com/pranjal0207", 
            paperAvailable: true, 
            paperLink: "https://www.ijariit.com/manuscripts/v7i4/V7I4-1684.pdf",
          ),

          ProjectCard(
            title: "Project Name", 
            description: "Project Description", 
            image: "assets/projectImages/projectStock.jpg",
            githubRepo: "https://github.com/pranjal0207",
            paperAvailable: false, 
            paperLink: "",
          ),

          ProjectCard(
            title: "Project Name", 
            description: "Project Description", 
            image: "assets/projectImages/projectStock.jpg",
            githubRepo: "https://github.com/pranjal0207",
            paperAvailable: false, 
            paperLink: "",
          ),
        ],
      )
    );
  }
}
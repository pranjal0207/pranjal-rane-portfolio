import 'package:flutter/material.dart';
import 'package:pranjal_rane_portfolio/widgets/projectCard.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double maxWidth = 1400;
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      margin: EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProjectCard(
            title: "Project Name", 
            description: "Project Description", 
            image: "assets/projectImages/projectStock.jpg"
          ),

          ProjectCard(
            title: "Project Name", 
            description: "Project Description", 
            image: "assets/projectImages/projectStock.jpg"
          ),

          ProjectCard(
            title: "Project Name", 
            description: "Project Description", 
            image: "assets/projectImages/projectStock.jpg"
          ),
        ],
      )
    );
  }
}
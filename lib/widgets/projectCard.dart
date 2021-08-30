import 'package:flutter/material.dart';
import 'dart:js' as js;

final double maxWidth = 1200;

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String githubRepo;
  final bool paperAvailable;
  final String paperLink;
  final List<String> technologies;
  final String longDescription;

  const ProjectCard({ 
    required this.title,
    required this.description,
    required this.longDescription,
    required this.image,
    required this.githubRepo,
    required this.paperAvailable,
    required this.paperLink,
    required this.technologies,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 700,
        width: (maxWidth - 80) /3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProjectImage(
              image: image
            ),

            ProjectTitle(
              title: title, 
              githubRepo: githubRepo,
              paperAvailable: paperAvailable,
              paperLink: paperLink,
            ),

            if(technologies.length > 0)
            ProjectTechnologies(
              technologies: technologies
            ),

            ProjectDescription(
              description: description
            )
          ],
        ),
      ),
    );
  }
}

class ProjectImage extends StatelessWidget {
  final String image;
  const ProjectImage({ 
    required this.image,
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: Image.asset(
          image,
          height: 200,
          width: (maxWidth - 80) /3,
          fit: BoxFit.fill,
        ),
      )
    );
  }
}

class ProjectTitle extends StatelessWidget {
  final String title;
  final String githubRepo;
  final bool paperAvailable;
  final String paperLink;

  const ProjectTitle({ 
    required this.title,
    required this.githubRepo,
    required this.paperAvailable,
    required this.paperLink,
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: ((maxWidth - 80) / 3) * 0.73,
            child: SelectableText(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Container(
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  if(paperAvailable)
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      js.context.callMethod('open', [paperLink]);
                    }, 
                    icon: Image.asset("assets/icons/pdfIcon.png"),
                    splashColor: Colors.transparent,
                    splashRadius: 0.1,
                    tooltip : "View Research Paper"
                  ),

                  IconButton(
                    onPressed: (){
                      js.context.callMethod('open', [githubRepo]);
                    }, 
                    icon: Image.asset("assets/icons/githubIcon.png"),
                    splashColor: Colors.transparent,
                    splashRadius: 0.1,
                    tooltip : "View Code Repository"
                  ),
                ],
              ),
            )
          )
        ],
      )
    );
  }
}

class ProjectDescription extends StatelessWidget {
  final String description;
  const ProjectDescription({ 
    required this.description,
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : <Widget>[
          Container(
            child: SelectableText(
              description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 17
              ),
            ),
          ),

          TextButton(
            onPressed: (){}, 
            child: Text("Show more"),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              textStyle: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline
              )
            ),
          )
        ]
      ),
    );
  }
}

class ProjectTechnologies extends StatelessWidget {
  final List<String> technologies;
  const ProjectTechnologies({ 
    required this.technologies,
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left : 10, right: 20, top: 15),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              "Tecnologies : ",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Container(
            height: 21,
            width: 40.0 * technologies.length,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: technologies.length,
              itemBuilder: (context, index){
                String technologyIcon = technologies[index];
                String asset = "assets/icons/" + technologyIcon + "Icon.png";
                return Container(
                  margin: EdgeInsets.only(right: 3),
                  child: Image.asset(
                    asset,
                    height: 30,
                    width: 30,
                  )
                );
              }
            ),
          )
        ]
      ),
    );
  }
}
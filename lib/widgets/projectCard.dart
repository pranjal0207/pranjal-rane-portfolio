import 'package:flutter/material.dart';
import 'dart:js' as js;

final double maxWidth = 1200;

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String coverImage;
  final String githubRepo;
  final bool paperAvailable;
  final String paperLink;
  final List<String> technologies;
  final String longDescription;
  final List<String> projectScreenshots;

  const ProjectCard({ 
    required this.title,
    required this.description,
    required this.longDescription,
    required this.coverImage,
    required this.githubRepo,
    required this.paperAvailable,
    required this.paperLink,
    required this.technologies,
    required this.projectScreenshots,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 6,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 700,
        width: (maxWidth - 80) /3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProjectImage(
              coverImage: coverImage
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
              title: title,
              description: description,
              longDescription: longDescription,
              technologies: technologies,
              projectScreenshots: projectScreenshots,
            )
          ],
        ),
      ),
    );
  }
}

class ProjectImage extends StatelessWidget {
  final String coverImage;
  const ProjectImage({ 
    required this.coverImage,
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
          coverImage,
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
                    icon: Image.asset(
                      "assets/icons/pdfIcon.png",
                      height: 30,
                      width: 30,
                    ),
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
  final String title;
  final List<String> technologies;
  final String description;
  final String longDescription;
  final List<String> projectScreenshots;
  
  const ProjectDescription({ 
    required this.title,
    required this.technologies,
    required this.longDescription,
    required this.description,
    required this.projectScreenshots,
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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

          if(screenWidth > 715)
          TextButton(
            onPressed: (){
              showProjectDialog(context, title, technologies, longDescription, projectScreenshots);
            }, 
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
                    height: 35,
                    width: 35,
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

showProjectDialog(BuildContext context, String title, List<String> technologies, String longDescription, List<String> projectScreenshots){
  int i, j;
  double screenWidth = MediaQuery.of(context).size.width;
  return showDialog(
    context: context, 
    builder: (context){
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          width: maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width : maxWidth * 0.8,
                      child: SelectableText(
                        title,
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    Container(
                      child: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close),
                        tooltip: "Close",
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: (maxWidth - 40) * 0.2,
                      child: Text(
                        (screenWidth > 715)? "Technologies Used : " : "Technologies:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Expanded(
                      child: Column(
                        children: <Widget>[
                          for(i = 0; i < technologies.length; i = i + 5)
                          Container(
                            margin: (technologies.length > 5)? EdgeInsets.only(bottom: 20) : EdgeInsets.zero,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                for (j = i; j < i + 5 && j < technologies.length; j ++)
                                Container(
                                  width: ((maxWidth - 40) * 0.8) / 5,
                                  child : Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(right: 3),
                                        child: Image.asset(
                                          "assets/icons/" + technologies[j] + "Icon.png",
                                          height: 40,
                                          width: 40,
                                        )
                                      ),

                                      if((screenWidth > 715))
                                      Container(
                                        child: SelectableText(
                                          technologies[j][0].toUpperCase() + technologies[j].substring(1),
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                child: SelectableText(
                  "Description : ",
                  style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Expanded(
                child: Scrollbar(
                  isAlwaysShown: true,
                  child: SingleChildScrollView(
                    child : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: SelectableText(
                            longDescription,
                            style: TextStyle(
                              fontSize: 15
                            ),
                          ),
                        ),

                        if(projectScreenshots.length > 0)
                        Container(
                          child: Text(
                            "Project Screenshots : ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              for (i = 0; i < projectScreenshots.length; i= i + 3)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  for (j = i; j < i + 3 && j < projectScreenshots.length; j++)
                                  Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    width: (maxWidth - 100)/3,
                                    child: Image.asset(projectScreenshots[j]),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                )
              )
            ],
          ),
        )
      );
    }
  );
}
import 'package:flutter/material.dart';
import 'dart:js' as js;

final double maxWidthDesktop = 1200;
final double maxWidthTablet = 790;

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
        height: 550,
        width: (maxWidthDesktop - 80) /3,
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
              githubRepo: githubRepo,
              researchPaper: paperLink,
              isResearch: paperAvailable,
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
          width: (maxWidthDesktop - 80) /3,
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
            width: ((maxWidthDesktop - 80) / 3) * 0.73,
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
  final String githubRepo;
  final String researchPaper;
  final bool isResearch;
  
  const ProjectDescription({ 
    required this.title,
    required this.technologies,
    required this.longDescription,
    required this.description,
    required this.projectScreenshots,
    required this.githubRepo,
    required this.researchPaper,
    required this.isResearch,
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

          if(screenWidth > 800)
          TextButton(
            onPressed: (){
              showProjectDialog(context, title, technologies, longDescription, projectScreenshots, githubRepo, researchPaper, isResearch);
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

showProjectDialog(BuildContext context, String title, List<String> technologies, String longDescription, List<String> projectScreenshots, String githubRepo, String researchPaper, bool isResearch){
  int i, j;
  double screenWidth = MediaQuery.of(context).size.width;

  print(screenWidth);

  bool desktop;
  int techScreenItems;
  int pictureScreenItems;
  double selectedWidth;

  if(screenWidth > 1200)
    desktop = true;
  else 
    desktop = false;

  if(desktop){
    techScreenItems = 5;
    pictureScreenItems = 3;
    selectedWidth = maxWidthDesktop;
  }

  else{
    techScreenItems = 3;
    pictureScreenItems = 2;
    selectedWidth = maxWidthTablet;
  }

  return showDialog(
    context: context, 
    builder: (context){
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          width: selectedWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width : selectedWidth * 0.75,
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
                      width: (selectedWidth - 40) * 0.25,
                      child: Text(
                        (screenWidth > 715)? "Technologies Used : " : "Technologies:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 20,
                    ),

                    Expanded(
                      child: Column(
                        children: <Widget>[
                          for(i = 0; i < technologies.length; i = i + techScreenItems)
                          Container(
                            margin: (technologies.length > techScreenItems)? EdgeInsets.only(bottom: 20) : EdgeInsets.zero,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                for (j = i; j < i + techScreenItems && j < technologies.length; j ++)
                                Container(
                                  width: ((selectedWidth - 190) * 0.75) / techScreenItems,
                                  child : Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(right: 3),
                                        child: Image.asset(
                                          "assets/icons/" + technologies[j] + "Icon.png",
                                          height: (desktop)? 40 : 30,
                                          width: (desktop)? 40 : 30,
                                        )
                                      ),

                                      Container(
                                        child: SelectableText(
                                          technologies[j][0].toUpperCase() + technologies[j].substring(1),
                                          style: TextStyle(
                                            fontSize: (desktop)? 18:16,
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

              Row(
                children: <Widget>[
                  Container(
                    child: TextButton.icon(
                      onPressed: (){
                        js.context.callMethod('open', [githubRepo]);
                      }, 
                      icon: Image.asset("assets/icons/sourceCodeIcon.png"), 
                      label: Text(
                        "View Source Code",
                        style: TextStyle(
                          fontSize: 16
                        ),
                      )
                    ),
                  ),

                  SizedBox(
                    width: 20,
                  ),

                  if(isResearch)
                  Container(
                    child: TextButton.icon(
                      onPressed: (){
                        js.context.callMethod('open', [researchPaper]);
                      }, 
                      icon: Image.asset(
                        "assets/icons/pdfIcon.png",
                        height: 40,
                        width: 40,
                      ), 
                      label: Text(
                        "View Research Paper",
                        style: TextStyle(
                          fontSize: 16
                        ),
                      )
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
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
                              for (i = 0; i < projectScreenshots.length; i= i + pictureScreenItems)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  for (j = i; j < i + pictureScreenItems && j < projectScreenshots.length; j++)
                                  Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    width: (selectedWidth - 150)/pictureScreenItems,
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
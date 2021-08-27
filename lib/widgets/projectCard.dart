import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const ProjectCard({ 
    required this.title,
    required this.description,
    required this.image,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double maxWidth = 1400;
    return PhysicalModel(
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: (maxWidth - 80) /3,
        child: Column(
          children: <Widget>[
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              )
            ),

            Container(
              child: SelectableText(
                title
              ),
            ),

            Container(
              child: SelectableText(
                description
              ),
            ),
          ],
        ),
      ),
    );
  }
}
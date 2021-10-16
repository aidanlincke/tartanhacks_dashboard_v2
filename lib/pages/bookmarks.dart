import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_widgets.dart';

class Bookmarks extends StatelessWidget {
  List bookmarks = ["[Student A]", "[Student B]", "[Student C]", "[Student D]",
                    "[Student E]", "[Student F]", "[Student G]", "[Student F]"];

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final screenHeight = mqData.size.height;
    final screenWidth = mqData.size.width;

    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: screenHeight
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TopBar(),
                        Stack(
                            children: [
                              Column(
                                children:[
                                  SizedBox(height:screenHeight * 0.05),
                                  CustomPaint(
                                      size: Size(screenWidth, screenHeight * 0.75),
                                      painter: CurvedTop(
                                          color1: Theme.of(context).colorScheme.secondaryVariant,
                                          color2: Theme.of(context).colorScheme.primary,
                                          reverse: true)
                                  ),
                                ] // children
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                        height: screenHeight * 0.80,
                                        child: Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.topLeft,
                                                padding: EdgeInsets.fromLTRB(screenWidth * 0.08, 0, screenWidth * 0.08, 0),
                                                child: Text("BOOKMARKS", style: Theme.of(context).textTheme.headline2),
                                              ),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                padding: EdgeInsets.fromLTRB(screenWidth * 0.08, 0, screenWidth * 0.08, 0),
                                                child: Text("Scroll to see the full list.", style: TextStyle(fontSize: screenHeight * 0.02)),
                                              ),
                                              Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.fromLTRB(screenWidth * 0.05, 0, screenWidth * 0.05, 0),
                                                    alignment: Alignment.topCenter,
                                                    child: ListView.builder(
                                                      itemCount: bookmarks.length,
                                                      itemBuilder: (BuildContext context, int index){
                                                        return BookmarkInfo(
                                                            name: bookmarks[index],
                                                            team: "ScottyLabs",
                                                            bio: "[Bio]"
                                                        );
                                                      },
                                                    ),
                                                  )
                                              )
                                            ]
                                        )
                                    )
                                  ], // children
                                ),
                              )
                            ]
                        ),
                  ]
                ),
            )
        )
    )
    );
  }
}

class BookmarkInfo extends StatelessWidget {
  String name;
  String team;
  String bio;

  BookmarkInfo({this.name, this.team, this.bio});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: GradBox(
        alignment: Alignment.topLeft,
        width: 200,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headline4
            ),
            Text(
                team,
                style: Theme.of(context).textTheme.bodyText2
            ),
            Text(
                bio,
                style: Theme.of(context).textTheme.bodyText2
            )
          ]
        )
      ),
    );
  }
}
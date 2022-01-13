import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_widgets.dart';
import 'home.dart';
import 'login.dart';
import '../api.dart';

class Forgot extends StatefulWidget{
  @override
  _ForgotState createState() => new _ForgotState();
}

class _ForgotState extends State<Forgot>{

  var _emailcontroller;

  @override
  void initState() {
    super.initState();
    _emailcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }

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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                              children:[
                                CustomPaint(
                                  size: Size(screenWidth, screenHeight*0.45),
                                  painter: CurvedBottom(color1: Theme.of(context).colorScheme.primary,
                                      color2: Theme.of(context).colorScheme.secondaryVariant),
                                ),
                                Container(
                                    height: screenHeight*0.3,
                                    width: screenWidth,
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: Image.asset("lib/logos/thLogoLight.png")
                                )
                              ]
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: GradText(
                                  text: "Let's Reset",
                                  size: 40,
                                  color1: Theme.of(context).colorScheme.primary,
                                  color2: Theme.of(context).colorScheme.secondary
                              )
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: TextField(
                              controller: _emailcontroller,
                              decoration: InputDecoration(
                                labelText: "Email",
                              ),
                              style: Theme.of(context).textTheme.bodyText2,
                              enableSuggestions: false,
                            ),
                          ),
                          SizedBox(height:10),
                          GradBox(
                              width: 200,
                              height: 45,
                              onTap: () {
                                resetPassword(context, _emailcontroller.text);
                              },
                              child: Text("Recover Password",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              )
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).colorScheme.onBackground
                                  )
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          Login()),
                                    );
                                  },
                                  child: Text("Try Logging In",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).colorScheme.secondary
                                      )
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height:5)
                        ]
                    )
                )
            )
        )
    );
  }
}
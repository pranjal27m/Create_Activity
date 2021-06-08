import 'package:create_activity/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'nextscreen.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  final _formKey = GlobalKey<FormState>();
  final activityController = TextEditingController();
  final activitytypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 15, left: 16),
        child: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                leading: new SizedBox(
                    height: 22.0,
                    width: 22.0,
                    child: new IconButton(
                      padding: new EdgeInsets.all(0.0),
                      color: Color(0xff000000),
                      icon: new Icon(Icons.clear, size: 22.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                    )),
                largeTitle: Text(
                  'Create an activity',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 32,
                      letterSpacing: 0.37,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Container(
                        margin: EdgeInsets.only(top: 60, left: 19, right: 19),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Activity name",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.37,
                              ),
                            ),
                            TextFormField(
                              controller: activityController,
                              decoration: InputDecoration(
                                hintText: "Ex: Cooking Class",
                                hintStyle: TextStyle(
                                  fontSize: 22,
                                  letterSpacing: 0.37,
                                ),
                                helperText:
                                    "*Name should be max 120 characters",
                                helperStyle: TextStyle(fontSize: 14),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                if (value.length > 120) {
                                  return 'Name should be max 120 character';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Text(
                              "Activity Type",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.37,
                              ),
                            ),
                            TextFormField(
                              controller: activitytypeController,
                              decoration: InputDecoration(
                                hintText: "Ex: Cooking Class",
                                hintStyle: TextStyle(
                                  fontSize: 22,
                                  letterSpacing: 0.37,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 210, left: 180),
                              child: SizedBox(
                                width: 132,
                                height: 32,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.of(context, rootNavigator: true)
                                          .push(
                                        new CupertinoPageRoute<bool>(
                                          fullscreenDialog: true,
                                          builder: (BuildContext context) =>
                                              new NextScreen(),
                                        ),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xff000000),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(8.0),
                                      ),
                                      textStyle: TextStyle(
                                          fontSize: 12,
                                          letterSpacing: -0.41,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "SFPro")),
                                  child: Text('Next'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

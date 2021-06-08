import 'package:create_activity/activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({ Key? key }) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  final _formKey = GlobalKey<FormState>();
  final startController = TextEditingController();
  final endController = TextEditingController();
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
                      icon: new Icon(Icons.arrow_back_ios_new, size: 22.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Activity()),
                        );
                      },
                    )),
                largeTitle: Text(
                  'Date of activity',
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
                              "Start date",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.37,
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Dec 02, 2020",
                                hintStyle: TextStyle(
                                  fontSize: 22,
                                  letterSpacing: 0.37,
                                ),
                              ),
                              controller: startController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Text(
                              "End date",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.37,
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Dec 20, 2020",
                                hintStyle: TextStyle(
                                  fontSize: 22,
                                  letterSpacing: 0.37,
                                ),
                                helperText:
                                    "*End Date should be greater than Start Date",
                                helperStyle: TextStyle(fontSize: 14),
                              ),
                              controller: endController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                             Container(
                               margin: EdgeInsets.only(top:210,left:180),
                               child: SizedBox(
                                  width: 132,
                                  height: 32,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xff000000),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(8.0),
                                        ),
                                        textStyle: TextStyle(
                                          fontSize: 12,
                                          letterSpacing: -0.41,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "SFPro")),
                                    child: Text('Ok'),
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
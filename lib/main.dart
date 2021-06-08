import 'package:create_activity/activity.dart';
import 'package:create_activity/nextscreen.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'activity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          child: Text(
            'Create',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Demo()),
            );
          },
          style: ElevatedButton.styleFrom(
              primary: Color(0xffE5E5E5),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  letterSpacing: 0.37,
                  fontWeight: FontWeight.w100)),
        ),
      ),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final List<Widget> introWidgetsList = <Widget>[
    Activity(),
    NextScreen(),
  ];
  late int currentPageValue = 0;
  PageController controller = PageController();
  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
        body: Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: <Widget>[
        PageView.builder(
          itemCount: introWidgetsList.length,
          onPageChanged: (int page) {
            getChangedPageAndMoveBar(page);
          },
          controller: controller,
          itemBuilder: (context, index) {
            return introWidgetsList[index];
          },
        ),
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 19, bottom: 50),
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                    expansionFactor: 3,
                    dotWidth: 9.0,
                    spacing: 4.0,
                    dotHeight: 9.0,
                    activeDotColor: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

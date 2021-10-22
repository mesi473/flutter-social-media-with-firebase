import 'package:social_media/AppbarWidget.dart';
import 'package:social_media/DashBoardHome.dart';
import 'package:social_media/DrawerWidget.dart';
import 'package:social_media/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DashBoard extends StatefulWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: DashBoardHome(),
      ),
    );
  }
}

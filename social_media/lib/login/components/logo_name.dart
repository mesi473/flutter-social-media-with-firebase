import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/HomePage.dart';

class CompanyName extends StatelessWidget {
  const CompanyName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.white,), 
            onPressed: () { 
              print('is clicked');
              Get.to(HomePage());
             },
          ),
          Center(
              child: Text(
                        "Me Chat",
                        style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'LogoFont',
                fontSize: 60,
                color: Colors.white),
                      )),
        ],
      ),
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:social_media/DashBoardHome.dart';
import 'package:social_media/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:social_media/login/login_screen.dart';
import 'package:social_media/register/register_screen.dart';
import 'package:social_media/provider/google_sign_in.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>GoogleSignInProvider(),
      child: GetMaterialApp(
        initialRoute: '/home',
        getPages: [
          GetPage(name: "/home", page: ()=>HomePage()),
          GetPage(name: "/dashboardhome", page: ()=>DashBoardHome()),
          GetPage(name: "/login", page: ()=>LoginScreen()),
          GetPage(name: "/register", page: ()=>RegisterScreen())
        ],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.cyan,
          accentColor: Colors.blueGrey,
          primarySwatch: Colors.blue,
        ),
        // home: HomePage(),
      ),
    );
  }
}


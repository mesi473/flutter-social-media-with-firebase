import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/DashBoardHome.dart';
import 'package:social_media/login/login_screen.dart';
import 'package:social_media/provider/google_sign_in.dart';
import 'package:social_media/register/register_screen.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Icon(Icons.chat),
      //       SizedBox(width: 20,),
      //       Text(
      //         'Me Chat'
      //       ),
      //     ],
      //   ),
      // ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        // initialData: initialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('something wents wrong'),
            );
          } else if (snapshot.hasData) {
            return DashBoardHome();
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Me Chat",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LogoFont',
                      fontSize: 60,
                      color: Colors.white),
                ),
                Center(
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 50,
                        child: Card(
                          elevation: 10,
                          color: Colors.cyan,
                          child: InkWell(
                            onTap: () {
                              Get.to(LoginScreen());
                            },
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 50,
                        child: Card(
                          elevation: 10,
                          color: Colors.cyan,
                          child: Hero(
                            tag: IndexedSemantics,
                            child: InkWell(
                              onTap: () {
                                Get.to(() => RegisterScreen());
                              },
                              child: Center(
                                child: Text(
                                  'Register',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'sign up with',
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            color: Colors.white,
                            iconSize: 40,
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.facebook,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                              iconSize: 40,
                              onPressed: () {
                                final provider =
                                    Provider.of<GoogleSignInProvider>(context,
                                        listen: false);
                                provider.googleLogin();
                              },
                              icon: Icon(
                                FontAwesomeIcons.google,
                                color: Colors.orange[900],
                              )),
                        ],
                      )
                    ],
                  )),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

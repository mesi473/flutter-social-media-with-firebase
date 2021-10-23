import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:social_media/AddFriend.dart';
import 'package:social_media/ChatWidget.dart';
import 'package:social_media/DashBoardHome.dart';
import 'package:social_media/Friends.dart';
import 'package:social_media/HomePage.dart';
import 'package:social_media/profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:social_media/provider/google_sign_in.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      elevation: 5,
      child: Container(
        color: Colors.grey[200],
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: user.photoURL!=null?NetworkImage(user.photoURL!):null,
                        radius: 50,
                      ),
                      Text(
                        user.displayName!,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        user.email!,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 0,
                        child: InkWell(
                          onTap: () {
                            // Get.toNamed('/dashboardhome');
                            Get.to(() => DashBoardHome());
                          },
                          child: ListTile(
                            title: Text(
                              'Home',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            leading: Icon(
                              FontAwesomeIcons.home,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: InkWell(
                          onTap: () {
                            Get.to(() => ChatWidget());
                          },
                          child: ListTile(
                            title: Text('Chat',
                                style: TextStyle(color: Colors.blueAccent)),
                            leading: Icon(Icons.chat, color: Colors.blueAccent),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: InkWell(
                          onTap: () {
                            Get.to(() => Profile());
                          },
                          child: ListTile(
                            title: Text('Profile',
                                style: TextStyle(color: Colors.blueAccent)),
                            leading: Icon(FontAwesomeIcons.idCard,
                                color: Colors.blueAccent),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: InkWell(
                          onTap: () {
                            Get.to(() => Friends());
                          },
                          child: ListTile(
                            title: Text('Friends',
                                style: TextStyle(color: Colors.blueAccent)),
                            leading: Icon(FontAwesomeIcons.userFriends,
                                color: Colors.blueAccent),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: InkWell(
                          onTap: () {
                            Get.to(AddFriends());
                          },
                          child: ListTile(
                            title: Text('Add Friend',
                                style: TextStyle(color: Colors.blueAccent)),
                            leading: Icon(FontAwesomeIcons.userFriends,
                                color: Colors.blueAccent),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  tileColor: Colors.blueGrey,
                  title: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 200,
                          height: 50,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150),
                            ),
                            color: Colors.redAccent,
                            child: InkWell(
                              onTap: () async {
                                final provider =
                                    Provider.of<GoogleSignInProvider>(context,
                                        listen: false);
                                await provider.googleLogOut();
                                Get.to(HomePage());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Icon(
                                      Icons.login,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Logout',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

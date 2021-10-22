import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:social_media/HomePage.dart';
import 'package:social_media/provider/google_sign_in.dart';

class AppbarWidget extends StatelessWidget {
  final String name;

  const AppbarWidget({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return AppBar(
      // automaticallyImplyLeading: false,
      title: Text(name),
      actions: [
        Center(
            child: Text(
          user.displayName!,
          style: TextStyle(color: Colors.white),
        )),
        SizedBox(
          width: 5,
        ),
        CircleAvatar(
            child: InkWell(
          onTap: () {
            showMenu(
                elevation: 8.0,
                context: context,
                position: RelativeRect.fromLTRB(100, 70, 0, 10),
                items: [
                  PopupMenuItem(child: Text('Settings')),
                  PopupMenuItem(child: Text('About us')),
                  PopupMenuItem(
                      child: InkWell(
                          onTap: () async {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            await provider.googleLogOut();
                            Get.to(HomePage());
                          },
                          child: Text('logout')))
                ]);
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image(
                image: NetworkImage(user.photoURL!),
              )),
        )),
      ],
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:social_media/HomePage.dart';

class MainInputFieldArea extends StatefulWidget {
  const MainInputFieldArea({
    Key? key,
  }) : super(key: key);

  @override
  _MainInputFieldAreaState createState() => _MainInputFieldAreaState();
}

class _MainInputFieldAreaState extends State<MainInputFieldArea> {
  late String _email, _password;
  bool show = false;
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.08, left: 20, right: 20),
      // height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Text(
            'Login',
            style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 50,
                fontFamily: 'LogoFont'),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Stack(
                      alignment: const Alignment(0, 0),
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                            child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _email = value.trim();
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'email is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.blueAccent,
                                ),
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.blueAccent),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: Colors.blue),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.lightBlue),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        )),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    alignment: const Alignment(0, 0),
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _password = value.trim();
                                });
                              },
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'password is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: Colors.blueAccent,
                                  ),
                                  labelText: 'password',
                                  labelStyle:
                                      TextStyle(color: Colors.blueAccent),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.lightBlue),
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                            ),
                          )),
                      Positioned(
                          right: 15,
                          child: IconButton(
                              onPressed: () {
                                // _controller.clear();
                                setState(() {
                                  show = !show;
                                });
                              },
                              icon: Icon(
                                show ? Icons.visibility : Icons.visibility_off,
                                color: Colors.blueAccent,
                              )))
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: Card(
                      elevation: 20,
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150),
                      ),
                      child: InkWell(
                        radius: 20,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(content: Text('Processing Data')),
                            // );
                            await auth.signInWithEmailAndPassword(email: _email, password: _password);
                            Navigator.pushNamed(context, '/dashboardhome');
                          }

                          
                        },
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

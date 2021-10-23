import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:social_media/HomePage.dart';

class MainInputFieldArea extends StatefulWidget {
  const MainInputFieldArea({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  _MainInputFieldAreaState createState() => _MainInputFieldAreaState();
}

class _MainInputFieldAreaState extends State<MainInputFieldArea> {
  late String _fullname, _email, _password, con_password;
  bool show = false;
  final auth = FirebaseAuth.instance;
  final database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.to(HomePage());
          },
        ),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.08,
              left: 20,
              right: 20),
          // height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              Text(
                'Register',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    fontFamily: 'LogoFont'),
              ),
              Form(
                key: widget._formKey,
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
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    _fullname = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'full name is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.business,
                                      color: Colors.blueAccent,
                                    ),
                                    labelText: 'full name',
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
                          ],
                        )),
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
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    _email = value;
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
                          ],
                        )),
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
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    _password = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'password is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
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
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 5),
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      con_password = value;
                                    });
                                  },
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'confirm password is required';
                                    }
                                    if (_password != con_password) {
                                      return 'password and conpassword must be the same';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.password,
                                        color: Colors.blueAccent,
                                      ),
                                      labelText: 'confirm password',
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
                                  },
                                  icon: Icon(
                                    Icons.visibility_off,
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
                              if (widget._formKey.currentState!.validate()) {
                                // ScaffoldMessenger.of(context)
                                //     .showSnackBar(
                                //   const SnackBar(
                                //       content:
                                //           Text('Processing Data')),
                                // );
                                try{
                                  await auth.createUserWithEmailAndPassword(
                                    email: _email, password: _password);
                                  
                                }catch(e){
                                  print(e.toString());
                                  if(e is PlatformException){
                                    if(e.code == 'ERROR_EMAIL_ALREADY_IN_USE'){
                                      print(e.code)
                                  }
                                  }
                                  
                                }
                                   
                                insertData(_fullname, _password, _email);
                                Navigator.pushNamed(context, '/dashboardhome');
                              }
                            },
                            child: Center(
                              child: Text(
                                'Register',
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
        ),
      ],
    );
  }

  insertData(String fullname, String password, String email) async {
    
    return database.child('/user').set(
      {
        'fullname': fullname,
        'password': password,
        'email': email,
        'imageurl':''
      },
    );
  }
}

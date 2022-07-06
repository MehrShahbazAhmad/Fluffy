// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluffy/Components/MyButton.dart';
import 'package:fluffy/Components/MyIconButton.dart';
import 'package:fluffy/Components/MyTextInput.dart';
import 'package:fluffy/screens/DashBoard.dart';
import 'package:fluffy/screens/SignUp.dart';
import 'package:fluffy/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginSrc extends StatefulWidget {
  const LoginSrc({Key? key}) : super(key: key);

  @override
  State<LoginSrc> createState() => _LoginSrcState();
}

class _LoginSrcState extends State<LoginSrc> {
  final _auth = FirebaseAuth.instance;
  String _email = "";
  String _password = "";
  String _emailError = "";
  String _passwordError = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void logInUser() async {
      if (_email.isEmpty || _password.isEmpty) {
        return;
      }
      setState(() {
        isLoading = true;
      });
      _auth
          .signInWithEmailAndPassword(
              email: _email.trim(), password: _password.trim())
          .then((uid) => {
                setState(() {
                  isLoading = false;
                }),
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const DashboardSrc(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                  ),
                )
              })
          .catchError((e) {
        setState(() {
          isLoading = false;
          if (e?.code == 'weak-password') {
            _passwordError = 'The password provided is too weak.';
          } else if (e?.code == 'email-already-in-use') {
            _emailError = 'The account already exists for that email';
          } else if (e.code == 'invalid-email') {
            _emailError = e.message;
          } else {
            _passwordError = e.message;
            print(e.message);
          }
        });
      });
    }

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/signUpCover.png'),
                fit: BoxFit.cover)),
        child: Stack(children: [
          Positioned(
            left: 80,
            top: 30,
            child: Container(
                width: 180, child: SvgPicture.asset('assets/images/logo.svg')),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
                height: size.height,
                width: size.width / 2.4,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  color: Primary_Color,
                ),
                child: Center(
                  child: Container(
                    width: 370,
                    child: Stack(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Primary_Color_Text,
                                  fontSize: 40,
                                  fontFamily: 'Cocogoose',
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 80)),
                              MyTextInput(
                                  hint: 'xyz@email.com',
                                  keyboardType: TextInputType.emailAddress,
                                  icon: Icon(Icons.email),
                                  onChange: (v) {
                                    setState(() {
                                      _email = v;
                                      if (!_emailError.isEmpty) {
                                        _emailError = "";
                                      }
                                    });
                                  },
                                  obscureText: false),
                              if (_emailError != "") ...[
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    _emailError,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              ],
                              MyTextInput(
                                  hint: "password",
                                  icon: Icon(Icons.lock),
                                  onChange: (v) {
                                    setState(() {
                                      _password = v;
                                      if (!_passwordError.isEmpty) {
                                        _passwordError = "";
                                      }
                                    });
                                  },
                                  obscureText: true),
                              if (_passwordError != "") ...[
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    _passwordError,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              ],
                              Container(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    child: Text(
                                      'Forget Password?',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Primary_Color_Text,
                                        fontSize: 16,
                                      ),
                                    ),
                                    onPressed: () {}),
                              ),
                              MyButton(
                                label: 'Login',
                                isLoading: isLoading,
                                onPressed: () {
                                  logInUser();
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "If you do'nt have an account? ",
                                    style: TextStyle(
                                      color: Primary_Color_Light,
                                      fontSize: 16,
                                      fontFamily: 'Helvetica',
                                    ),
                                  ),
                                  TextButton(
                                      child: Text(
                                        'SignUp',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Primary_Color_Text,
                                          fontSize: 16,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                    secondaryAnimation) =>
                                                const SignUpSrc(),
                                            transitionsBuilder: (context,
                                                animation,
                                                secondaryAnimation,
                                                child) {
                                              return child;
                                            },
                                          ),
                                        );
                                      }),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 30)),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   // ignore: prefer_const_literals_to_create_immutables
                              //   children: [
                              //     MyIconButton(
                              //       icon:
                              //           '''<svg xmlns="http://www.w3.org/2000/svg" width="34.313" height="34.875" viewBox="0 0 34.313 34.875">
                              //               <path id="Icon_awesome-google" data-name="Icon awesome-google" d="M34.313,18.408c0,9.949-6.813,17.03-16.875,17.03a17.438,17.438,0,0,1,0-34.875A16.769,16.769,0,0,1,29.13,5.126L24.384,9.689C18.176,3.7,6.63,8.2,6.63,18A10.923,10.923,0,0,0,17.438,29.011c6.9,0,9.492-4.95,9.9-7.516h-9.9v-6h16.6A15.287,15.287,0,0,1,34.313,18.408Z" transform="translate(0 -0.563)" fill="#fff"/>
                              //             </svg>
                              //           ''',
                              //       bgColor: Color.fromARGB(255, 229, 0, 0),
                              //       onPressed: () {},
                              //     ),
                              //     Padding(
                              //         padding:
                              //             EdgeInsets.symmetric(horizontal: 20),
                              //         child: Text(
                              //           "or",
                              //           style: TextStyle(
                              //             color: Primary_Color_Light,
                              //             fontSize: 16,
                              //           ),
                              //         )),
                              //     MyIconButton(
                              //       icon:
                              //           '''<svg xmlns="http://www.w3.org/2000/svg" width="19.281" height="36" viewBox="0 0 19.281 36">
                              //               <path id="Icon_awesome-facebook-f" data-name="Icon awesome-facebook-f" d="M19.627,20.25l1-6.515H14.375V9.507c0-1.782.873-3.52,3.673-3.52h2.842V.44A34.658,34.658,0,0,0,15.846,0C10.7,0,7.332,3.12,7.332,8.769v4.965H1.609V20.25H7.332V36h7.043V20.25Z" transform="translate(-1.609)" fill="#fff"/>
                              //             </svg>
                              //           ''',
                              //       bgColor: Primary_Color,
                              //       onPressed: () {},
                              //     )
                              //   ],
                              // )
                            ]),
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: 20,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Terms & Conditions",
                                      style: TextStyle(
                                        color: Primary_Color_Light,
                                        fontSize: 16,
                                      ),
                                    )),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30)),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Privacy Policies",
                                      style: TextStyle(
                                        color: Primary_Color_Light,
                                        fontSize: 16,
                                      ),
                                    )),
                              ]),
                        )
                      ],
                    ),
                  ),
                )),
          )
        ]),
      ),
    );
  }
}

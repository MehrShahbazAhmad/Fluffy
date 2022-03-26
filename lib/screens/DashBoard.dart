import 'package:fluffy/Components/ProjectBTN.dart';
import 'package:fluffy/Components/SearchBar.dart';
import 'package:fluffy/screens/Login.dart';
import 'package:fluffy/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardSrc extends StatelessWidget {
  const DashboardSrc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Stack(children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
                height: size.height,
                width: size.width,
                child: Container(
                  width: 370,
                  padding: const EdgeInsets.only(top: 110),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 20),
                    children: [
                      Text("Projects".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 32,
                            fontFamily: 'Cocogoose',
                          )),
                      Container(
                        height: 330,
                        child: Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return index == 0
                                    ? ProjectBTN(
                                        label: const Text(
                                          "Start a new project",
                                          style: TextStyle(
                                              color: Primary_Color_Dark,
                                              fontFamily: "Helvetica",
                                              fontSize: 20),
                                        ),
                                        widget: Center(
                                          child: Container(
                                              width: 70,
                                              height: 70,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border(
                                                    top: BorderSide(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                    left: BorderSide(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                    right: BorderSide(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                    bottom: BorderSide(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                  )),
                                              child: const Center(
                                                child: Icon(Icons.add,
                                                    size: 30,
                                                    color: Colors.black),
                                              )),
                                        ),
                                        onPressed: () {},
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 0.7),
                                      )
                                    : ProjectBTN(
                                        label: const Text(
                                          "Start a new project",
                                          style: TextStyle(
                                              fontFamily: "Helvetica",
                                              fontSize: 20),
                                        ),
                                        widget: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "images/image_${index}.jpeg"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                      );
                              }),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Templates".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 32,
                                fontFamily: 'Cocogoose',
                              )),
                          const SearchBar(
                            hint: "Search Template",
                            icon: Icon(Icons.search),
                            width: 400,
                            height: 45,
                          ),
                        ],
                      ),
                      Container(
                        height: 550,
                        child: Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) => ProjectBTN(
                                    height: 500,
                                    islabel: false,
                                    widget: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "images/temp_${index + 1}.jpeg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                  )),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Positioned(
            left: 80,
            right: 80,
            top: 30,
            child: Container(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 180,
                      child: SvgPicture.asset('images/logo.svg'),
                    ),
                    // ignore: prefer_const_constructors
                    SearchBar(hint: "Search Project", icon: Icon(Icons.search)),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const LoginSrc(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(0.0, 1.0);
                              const end = Offset.zero;
                              final tween = Tween(begin: begin, end: end);
                              final offsetAnimation = animation.drive(tween);
                              return child;
                            },
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Primary_Color_Light,
                          minimumSize: Size(55, 55),
                          maximumSize: Size(55, 55),
                          padding: EdgeInsets.all(0),
                          primary: Primary_Color_Light,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          )),
                      child: Image.asset('images/user.png'),
                    ),
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:todo_app/screen/drawer/about/about.dart';
import 'package:todo_app/screen/drawer/privacy_policy/privacy_policy.dart';
import 'package:todo_app/screen/drawer/terms/term.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Drawer(
        backgroundColor: const Color.fromARGB(255, 22, 21, 21),
        elevation: 10,
        width: 280,
        child: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: Text(
                                  'Todo App',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 203, 200, 200),
                                      fontSize: 25,
                                      fontFamily: 'SLASHI',
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Row(
                                children: [
                                  Builder(builder: (BuildContext context) {
                                    return IconButton(
                                        onPressed: () {
                                          Scaffold.of(context).closeDrawer();
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Color.fromARGB(
                                              255, 203, 200, 200),
                                        ));
                                  }),
                                ],
                              ),
                            ],
                          ),
                          Ink(
                            height: 60,
                            width: 300,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const Privacy(),
                                ));
                              },
                              child: const Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'Privacy and Policy',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 203, 200, 200),
                                        fontSize: 17,
                                        fontFamily: 'SLASHI',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Ink(
                            height: 60,
                            width: 300,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const Terms(),
                                ));
                              },
                              child: const Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'Terms and Conditions ',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 203, 200, 200),
                                        fontFamily: 'SLASHI',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Ink(
                            height: 60,
                            width: 300,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const About(),
                                ));
                              },
                              child: const Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'About',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 203, 200, 200),
                                        fontFamily: 'SLASHI',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Ink(
                            height: 60,
                            width: 300,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'Share',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 203, 200, 200),
                                        fontSize: 17,
                                        fontFamily: 'SLASHI',
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: Color.fromARGB(255, 203, 200, 200),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  const Flexible(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Version 1.0v',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

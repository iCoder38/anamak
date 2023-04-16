import 'package:anamak_two/classes/headers/utils/utils.dart';
import 'package:anamak_two/classes/set_name/online_chat_entry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  var arrHomeList = [];
  //
  @override
  void initState() {
    super.initState();

    arrHomeList = [
      {
        'id': '1',
        'title': 'Chat',
        'image': 'assets/images/chat.png',
      },
      {
        'id': '2',
        'title': 'Stories',
        'image': 'assets/images/stories.png',
      },
      {
        'id': '3',
        'title': 'Settings',
        'image': 'assets/gif/settings.png',
      },
    ];
    if (kDebugMode) {
      print('length ===> ${arrHomeList.length}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('data'),
      // ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 60.0,
              bottom: 0,
            ),
            color: Colors.transparent,
            // width: 48.0,
            height: 48.0,
            child: Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: textWithSemiBoldStyle(
                      'Home',
                      14.0,
                      Colors.pink,
                      // 'left',
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const SettingsScreen(),
                      //   ),
                      // );
                    },
                    icon: const Icon(
                      Icons.settings,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 40, top: 40.0),
                color: Colors.transparent,
                width: 24.0,
                height: 24.0,
                child: Image.asset(
                  'assets/images/music.png',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 40, left: 40, top: 40.0),
                color: Colors.transparent,
                width: 24,
                height: 24,
                child: Image.asset(
                  'assets/images/link.png',
                ),
              ),
            ],
          ),
          //
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                // height: 48.0,
                child: Image.asset(
                  'assets/images/logo_3.png',
                ),
              ),
            ),
          ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 40, top: 40.0, bottom: 40),
                color: Colors.transparent,
                width: 38.0,
                height: 38.0,
                child: Image.asset(
                  'assets/images/ice-cream.png',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 40, left: 40, top: 40.0, bottom: 40),
                color: Colors.transparent,
                width: 38.0,
                height: 38.0,
                child: Image.asset(
                  'assets/images/chat.png',
                ),
              ),
            ],
          ),
          //
          Container(
            height: 240,
            margin: const EdgeInsets.only(
              bottom: 0,
            ),
            decoration: BoxDecoration(
              color: app_blue_color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  52,
                ),
                topRight: Radius.circular(
                  52,
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                            top: 40,
                            right: 5,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              // 14,
                              topLeft: Radius.circular(
                                14,
                              ),
                              topRight: Radius.circular(
                                14,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                  0,
                                  3,
                                ), // changes position of shadow
                              ),
                            ],
                          ),
                          // width: 48.0,
                          height: 110.0,
                          child: Align(
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              color: Colors.transparent,
                              width: 66.0,
                              height: 66.0,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const OnlineChatEntryScreen(),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  'assets/images/chat.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            //
                            if (kDebugMode) {
                              print('====> PUSH RIVIEW VIA ICONS');
                            }
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const ReviewCategoryScreen(),
                            //   ),
                            // );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                              top: 40.0,
                              right: 20,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(
                                  14,
                                ),
                                topRight: Radius.circular(
                                  14,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                    0,
                                    3,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            // width: 48.0,
                            height: 110.0,
                            child: Align(
                              child: Container(
                                margin: const EdgeInsets.all(10.0),
                                color: Colors.transparent,
                                width: 66.0,
                                height: 66.0,
                                child: Image.asset(
                                  'assets/images/stories.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //
                    ],
                  ),
                  // 2
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                            top: 0.0,
                            right: 5,
                          ),

                          decoration: BoxDecoration(
                            // color: const Color.fromRGBO(96, 190, 248, 1),
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(
                                14,
                              ),
                              bottomRight: Radius.circular(
                                14,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                  0,
                                  3,
                                ), // changes position of shadow
                              ),
                            ],
                          ),
                          // width: 48.0,
                          height: 40,
                          child: Align(
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         const SetProfileNameScreen(),
                                //   ),
                                // );
                              },
                              child: text_with_regular_style(
                                'Chat',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (kDebugMode) {
                              print('object 1');
                            }
                            // func_image_alert_popup();
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const ReviewCategoryScreen(),
                            //   ),
                            // );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                              top: 0.0,
                              right: 20,
                            ),

                            decoration: BoxDecoration(
                              // color: Colors.brown,
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(
                                  14,
                                ),
                                bottomRight: Radius.circular(
                                  14,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                    0,
                                    3,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            // width: 48.0,
                            height: 40,
                            child: Align(
                              child: text_with_regular_style(
                                'Stories',
                              ),
                            ),
                          ),
                        ),
                      ),
                      //
                    ],
                  ),

                  //
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

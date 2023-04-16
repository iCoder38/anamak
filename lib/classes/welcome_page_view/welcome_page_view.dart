import 'package:anamak_two/classes/home/home.dart';
import 'package:anamak_two/classes/phone_number_verification/phone_number.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  late int selectedPage;
  late final PageController _pageController;

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    //
    funcCheckUserIsAlreadySignedIn();
    //
    super.initState();
  }

  //
  // final pageCount = 5;
  var pageCount = [
    {
      'title':
          'Anamak is an innovative platform that allows you to chat and express yourself anonymously, providing a safe and secure space to connect with others from all over the world without revealing your identity.',
      'image': 'assets/images/PV_chat_anonymously.jpg',
    },
    {
      'title':
          'Your trust is of utmost importance to us, and we are committed to providing a secure and reliable service that you can rely on.',
      'image': 'assets/images/PV_data_security.jpg',
    },
    {
      'title':
          'Anamak takes the security and privacy of its users very seriously. All user data on Anamak is encrypted using industry-standard encryption algorithms, which means that your conversations and personal information are kept safe from prying eyes.',
      'image': 'assets/images/PV_data_encrypted.jpg',
    }

    // 'assets/images/chat.jpg',
    // 'assets/images/data.jpg'
  ];
  //

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  funcCheckUserIsAlreadySignedIn() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        if (kDebugMode) {
          print('User is currently signed out!');
        }
      } else {
        if (kDebugMode) {
          print('User is signed in!');
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      selectedPage = page;
                    });
                  },
                  children: List.generate(
                    pageCount.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PhoneNumberValidationScreen(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  // image: DecorationImage(
                                  //   image: AssetImage(pageCount[index]),
                                  //   // fit: BoxFit.fill,
                                  // ),
                                  // shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    //
                                    pageCount[index]['image'].toString(),
                                    //
                                  ),
                                ),
                              ),
                            ),
                            //
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                //
                                pageCount[index]['title'].toString(),
                                //
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            //
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: PageViewDotIndicator(
                  currentItem: selectedPage,
                  count: pageCount.length,
                  unselectedColor: Colors.grey,
                  selectedColor: Colors.blue,
                  duration: const Duration(milliseconds: 200),
                  boxShape: BoxShape.rectangle,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

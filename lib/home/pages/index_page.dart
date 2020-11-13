import 'dart:async';

import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_flutter/core/design/colors.dart';
import 'package:yoga_flutter/home/pages/journey_page.dart';
import 'package:yoga_flutter/home/pages/today_page.dart';
import 'package:yoga_flutter/home/pages/you_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage();
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<int> pageNumberNotifier = ValueNotifier<int>(0);
  DateTime currentBackPressTime;
  bool showBNB = true;
  final ScrollController scrollController = ScrollController();
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scrollController
      ..addListener(() {
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          setState(() {
            _animationController.forward();
            showBNB = false;
          });
        } else if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          setState(() {
            _animationController.reverse().whenComplete(() => showBNB = true);
          });
        } else {
          setState(() {
            _animationController.forward();
            showBNB = false;
          });
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageNumberNotifier.dispose();
  }

  void _selectedTab(int index) {
    if (pageNumberNotifier.value == index) {
      scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    } else {
      pageNumberNotifier.value = index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pageNumberNotifier,
        builder: (BuildContext context, int value, Widget child) {
          return WillPopScope(
            onWillPop: () async {
              if (pageNumberNotifier.value != 0) {
                pageNumberNotifier.value = 0;
                return false;
              } else {
                setState(() {
                  showBNB = true;
                });
                scrollController.animateTo(
                  0.0,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                );

                DateTime now = DateTime.now();
                if (currentBackPressTime == null ||
                    now.difference(currentBackPressTime) >
                        Duration(seconds: 2)) {
                  currentBackPressTime = now;
                  showFlash(
                      onWillPop: () async {
                        return true;
                      },
                      duration: Duration(seconds: 2),
                      context: context,
                      builder: (context, controller) => Flash(
                            controller: controller,
                            backgroundColor: Colors.black87,
                            borderRadius: BorderRadius.circular(8.0),
                            style: null,
                            position: null,
                            alignment: Alignment.center,
                            enableDrag: false,
                            onTap: () => controller.dismiss(),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Press again to exit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ));
                  return Future.value(false);
                }
                return Future.value(true);
              }
            },
            child: SafeArea(
              child: Scaffold(
                body: IndexedStack(
                  index: pageNumberNotifier.value,
                  children: [
                    JourneyPage(
                      scrollController: scrollController,
                    ),
                    TodayPage(),
                    YouPage(),
                  ],
                ),
                bottomNavigationBar: SlideTransition(
                  position:
                      Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 2))
                          .animate(_animationController),
                  child: AnimatedCrossFade(
                      firstChild: SizedBox.shrink(),
                      secondChild: BottomNavigationBar(
                        showUnselectedLabels: true,
                        type: BottomNavigationBarType.fixed,
                        backgroundColor: Colors.white,
                        currentIndex: pageNumberNotifier.value,
                        onTap: _selectedTab,
                        unselectedIconTheme:
                            IconThemeData(color: Colors.black12),
                        selectedLabelStyle:
                            TextStyle(fontSize: 12, fontFamily: 'Gilroy'),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Gilroy',
                            color: Colors.black12),
                        unselectedItemColor: Colors.black87,
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              'assets/journey.svg',
                              height: 20,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Journey',
                                style: TextStyle(
                                    color: pageNumberNotifier.value == 0
                                        ? kBlack
                                        : Colors.black54,
                                    fontFamily: 'Medium'),
                              ),
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              'assets/today.svg',
                              height: 20,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Today',
                                style: TextStyle(
                                    color: pageNumberNotifier.value == 1
                                        ? kBlack
                                        : Colors.black54,
                                    fontFamily: 'Medium'),
                              ),
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              'assets/you.svg',
                              height: 20,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'You',
                                style: TextStyle(
                                    color: pageNumberNotifier.value == 2
                                        ? kBlack
                                        : Colors.black54,
                                    fontFamily: 'Medium'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      crossFadeState: showBNB
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 200)),
                ),
              ),
            ),
          );
        });
  }
}

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
import 'package:yoga_flutter/home/utils/value_notifiers.dart';

class IndexPage extends StatefulWidget {
  const IndexPage();
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  DateTime _currentBackPressTime;
  final ScrollController scrollController = ScrollController();
  AnimationController _animationController;

  void _scrollListener() {
    Function hideBNB = () {
      _animationController.forward();
      if (showBNBNotifier.value) {
        showBNBNotifier.value = false;
      }
    };
    Function showBNB = () {
      _animationController.reverse();
      if (!showBNBNotifier.value) {
        showBNBNotifier.value = true;
      }
    };
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      hideBNB();
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      showBNB();
    }
    setState(() {});
  }

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scrollController..addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    pageNumberNotifier.dispose();
    showBNBNotifier.dispose();
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
    return AnimatedBuilder(
      animation: Listenable.merge([pageNumberNotifier, showBNBNotifier]),
      builder: (context, child) {
        return WillPopScope(
          onWillPop: () async {
            if (pageNumberNotifier.value != 0) {
              pageNumberNotifier.value = 0;
              return false;
            } else {
              showBNBNotifier.value = true;
              scrollController.animateTo(
                0.0,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 300),
              );

              DateTime now = DateTime.now();
              if (_currentBackPressTime == null ||
                  now.difference(_currentBackPressTime) >
                      Duration(seconds: 2)) {
                _currentBackPressTime = now;
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
              backgroundColor: kWhite,
              bottomNavigationBar: SlideTransition(
                position:
                    Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0.5))
                        .animate(_animationController),
                child: AnimatedCrossFade(
                    firstChild: SizedBox.shrink(),
                    secondChild: BottomNavigationBar(
                      showUnselectedLabels: true,
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Colors.white,
                      currentIndex: pageNumberNotifier.value,
                      onTap: _selectedTab,
                      unselectedIconTheme: IconThemeData(color: Colors.black12),
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
                    crossFadeState: showBNBNotifier.value
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 200)),
              ),
            ),
          ),
        );
      },
    );
  }
}

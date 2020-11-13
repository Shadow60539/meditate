import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_flutter/core/design/colors.dart';
import 'package:yoga_flutter/home/pages/routines_page.dart';

class RoutineBuilder extends StatefulWidget {
  @override
  _RoutineBuilderState createState() => _RoutineBuilderState();
}

class _RoutineBuilderState extends State<RoutineBuilder> {
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 195,
      child: ListView.builder(
        padding: EdgeInsets.only(right: 20),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return RoutinesPage();
                    },
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return SlideTransition(
                        position: new Tween<Offset>(
                          begin: const Offset(0.5, 0.0),
                          end: Offset.zero,
                        ).animate(CurvedAnimation(
                            parent: animation, curve: Curves.linearToEaseOut)),
                        child: child,
                      );
                    },
                  ));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: index == 0
                      ? EdgeInsets.only(right: 20, left: 20)
                      : EdgeInsets.all(0),
                  height: 195,
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  width: 203,
                  child: Image.asset(
                    'assets/routine${index + 1}.png',
                    height: 195,
                    width: 203,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  child: Text(
                    index == 0 ? 'Why routines?' : 'Success in habits',
                    style: TextStyle(
                        fontFamily: 'Regular', color: kWhite, fontSize: 20),
                  ),
                ),
                Positioned(
                  top: 18,
                  right: 35,
                  child: Text(
                    '2 MINS',
                    style: TextStyle(
                        fontFamily: 'Medium',
                        color: Color(0xff424242),
                        fontSize: 10),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_flutter/core/design/colors.dart';

class HabitBuilder extends StatefulWidget {
  @override
  _HabitBuilderState createState() => _HabitBuilderState();
}

class _HabitBuilderState extends State<HabitBuilder> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 195,
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff96FFF2), Color(0xffB6D955)],
            ),
          ),
          width: 315,
          child: Image.asset(
            'assets/habit.png',
            alignment: Alignment.bottomCenter,
            height: 195,
            width: 315,
          ),
        ),
        Positioned(
          bottom: 18,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '7 Habits',
                style:
                    TextStyle(fontFamily: 'Bold', color: kWhite, fontSize: 34),
              ),
              Text(
                'of a successful mornig',
                style: TextStyle(
                    fontFamily: 'Medium', color: kWhite, fontSize: 20),
              ),
            ],
          ),
        ),
        Positioned(
          top: 18,
          right: 35,
          child: Text(
            '2 MINS',
            style: TextStyle(
                fontFamily: 'Medium', color: Color(0xff424242), fontSize: 10),
          ),
        ),
      ],
    );
  }
}

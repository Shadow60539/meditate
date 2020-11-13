import 'package:flutter/material.dart';
import 'package:yoga_flutter/core/design/colors.dart';
import 'package:yoga_flutter/home/utils/white_circle_painter.dart';
import 'package:yoga_flutter/home/widgets/habit_builder.dart';
import 'package:yoga_flutter/home/widgets/routine_builder.dart';
import 'package:yoga_flutter/home/widgets/stage_builder.dart';

class JourneyPage extends StatefulWidget {
  final ScrollController scrollController;

  const JourneyPage({Key key, this.scrollController}) : super(key: key);
  @override
  _JourneyPageState createState() => _JourneyPageState();
}

class _JourneyPageState extends State<JourneyPage> {
  @override
  Widget build(BuildContext context) {
    Widget journeyHeading() => CustomPaint(
          painter: WhiteCirclePainter(),
          child: Container(
            height: 565 * 0.4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey Sanjeev',
                    style: TextStyle(
                        color: kGrey, fontFamily: 'Medium', fontSize: 24),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Your journey',
                    style: TextStyle(
                        color: kBlack, fontFamily: 'Bold', fontSize: 34),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Build your routine through a stage by stage progression',
                    style: TextStyle(
                        color: Color(0xff2e3238),
                        fontFamily: 'Medium',
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        );
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.4, 1.0],
          colors: [
            Color(0xffBCFBFF),
            Color(0xffF7FCC4),
          ],
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        controller: widget.scrollController,
        padding: EdgeInsets.only(bottom: 25,top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            journeyHeading(),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                '7 stage process to build routine',
                style: TextStyle(fontFamily: 'Medium', fontSize: 20),
              ),
            ),
            StageBuilder(),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Learn about Morning routines',
                style: TextStyle(fontFamily: 'Medium', fontSize: 20),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            RoutineBuilder(),
            SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Explore the habits',
                style: TextStyle(fontFamily: 'Medium', fontSize: 20),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(child: HabitBuilder()),
          ],
        ),
      ),
    );
  }
}

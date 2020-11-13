import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yoga_flutter/core/design/colors.dart';

class StageBuilder extends StatefulWidget {
  @override
  _StageBuilderState createState() => _StageBuilderState();
}

class _StageBuilderState extends State<StageBuilder> {
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
        maxHeight: 340,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(right: 20),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              stageHolder(stageTitle: 'Activator', stageNumber: 1),
              Container(
                margin: EdgeInsets.only(bottom: 100),
                width: MediaQuery.of(context).size.width * 0.4,
                height: 20,
                color: kWhite,
              ),
              stageHolder(stageTitle: 'Hustler', stageNumber: 2),
              Container(
                margin: EdgeInsets.only(bottom: 100),
                width: MediaQuery.of(context).size.width * 0.4,
                height: 20,
                color: kWhite,
              ),
              stageHolder(stageTitle: 'Fighter', stageNumber: 3),
            ],
          ),
        ));
  }

  Widget stageHolder({String stageTitle, int stageNumber}) {
    return Padding(
      padding: EdgeInsets.only(
          left:
              stageNumber == 1 ? MediaQuery.of(context).size.width * 0.18 : 0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 195,
                width: 195,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffBCFBFF),
                        blurRadius: 0,
                        spreadRadius: 0,
                        offset: Offset(0, 0)),
                  ],
                ),
              ),
              Container(
                height: 145,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kWhite,
                  boxShadow: [
                    BoxShadow(
                        color: kBlack.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 1)
                  ],
                ),
                width: 145,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Lottie.asset(
                    'assets/peace.json',
                    height: 145,
                    width: 145,
                    frameRate: FrameRate.max,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 28,
          ),
          Text(
            'STAGE $stageNumber',
            style: TextStyle(fontFamily: 'Medium', fontSize: 10),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            stageTitle,
            style: TextStyle(fontFamily: 'Bold', fontSize: 34),
          ),
        ],
      ),
    );
  }
}

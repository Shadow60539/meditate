import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yoga_flutter/core/design/colors.dart';

class StageBuilder extends StatefulWidget {
  final ScrollController scrollController;

  const StageBuilder({Key key, this.scrollController}) : super(key: key);
  @override
  _StageBuilderState createState() => _StageBuilderState();
}

class _StageBuilderState extends State<StageBuilder> {
  @override
  Widget build(BuildContext context) {
    bool isWhite = widget.scrollController.position.pixels > 147 ? true : false;
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
              stageHolder(
                  stageTitle: 'Activator', stageNumber: 1, color: isWhite),
              Transform.translate(
                offset: Offset(isWhite ? -10 : 0, 0),
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                    color: isWhite ? Color(0xffBCFBFF) : kWhite,
                  ),
                  margin: EdgeInsets.only(bottom: 100),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 20,
                  duration: const Duration(milliseconds: 100),
                ),
              ),
              stageHolder(
                  stageTitle: 'Hustler', stageNumber: 2, color: isWhite),
              Transform.translate(
                offset: Offset(isWhite ? 10 : 0, 0),
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                    ),
                    color: isWhite ? Color(0xffBCFBFF) : kWhite,
                  ),
                  margin: EdgeInsets.only(bottom: 100),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 20,
                  duration: const Duration(milliseconds: 100),
                ),
              ),
              stageHolder(
                  stageTitle: 'Fighter', stageNumber: 3, color: isWhite),
            ],
          ),
        ));
  }

  Widget stageHolder({String stageTitle, int stageNumber, bool color}) {
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
                        color: color ? Color(0xffBCFBFF) : kWhite,
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
            style: TextStyle(
              fontFamily: 'Medium',
              fontSize: 10,
            ),
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

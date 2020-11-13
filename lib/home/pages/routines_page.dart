import 'package:flutter/material.dart';
import 'package:yoga_flutter/core/design/colors.dart';
import 'package:yoga_flutter/home/widgets/fade_animations.dart';

class RoutinesPage extends StatefulWidget {
  @override
  _RoutinesPageState createState() => _RoutinesPageState();
}

class _RoutinesPageState extends State<RoutinesPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xffFFCAA3),
                kWhite,
              ],
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedContainer(
                    height: 5,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        color: index == 0 ? kBlack : kGrey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(100)),
                    duration: const Duration(milliseconds: 400),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: 5,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        color: index == 1 ? kBlack : kGrey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: 5,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        color: index == 2 ? kBlack : kGrey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 3,
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeFromUpAnimation(
                          begin: 0.0,
                          end: 1.0,
                          drop: -0.8,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 24,
                            ),
                            child: Text(
                              'Why routines?',
                              style: TextStyle(
                                  color: kBlack,
                                  fontFamily: 'Bold',
                                  fontSize: 34),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.4,
                              left: 24),
                          child: FadeFromUpAnimation(
                            begin: 0.5,
                            end: 0.8,
                            drop: -0.2,
                            child: Text(
                              'Getting a good sleep is the first routine that you will build.',
                              style: TextStyle(
                                  color: kBlack,
                                  fontFamily: 'Regular',
                                  fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FadeFromUpAnimation(
                          begin: 0.7,
                          end: 1.0,
                          drop: 0.0,
                          child: Center(
                            child: Image.asset(
                              'assets/routine_full.png',
                              fit: BoxFit.contain,
                              height: MediaQuery.of(context).size.height * 0.65,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NumberStepper extends StatelessWidget {
  final double width;
  final totalSteps;
  final int curStep;
  final Color stepCompleteColor;
  final Color currentStepColor;
  final Color inactiveColor;
  final double lineWidth;
  final void Function()? onPressed;
  const NumberStepper({
    super.key,
    required this.width,
    required this.curStep,
    required this.stepCompleteColor,
    required this.totalSteps,
    required this.inactiveColor,
    required this.currentStepColor,
    required this.lineWidth,
    required this.onPressed,
  }) : assert(curStep > 0 == true && curStep <= totalSteps + 1);

  @override
  Widget build(BuildContext context) {
    var c_width = MediaQuery.of(context).size.width;
    var rejected = 'this is rejected';
      print('$c_width');
    return
        // Container(
        //     alignment: Alignment.topLeft,
        //     width: width,
        //     margin:
        //         const EdgeInsets.only(left: 0, top: 30, right: 0, bottom: 0),
        //     child: SingleChildScrollView(
        //       child: Column(
        //         children: [
        //           Row(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               children: [
        //                 Column(
        //                   children: _steps(),
        //                 ),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: _stepText(context),
        //                 ),
        //               ]),
        //         ],
        //       ),
        //     ));
        Container(
            alignment: Alignment.topLeft,
            width: width,
            margin:
                const EdgeInsets.only(left: 0, top: 30, right: 0, bottom: 0),
            child: SingleChildScrollView(
                child: Column(children: [
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 18, top: 20),
                        width: 28.0,
                        height: 28.0,
                        child: getInnerElementOfStepper(1),
                        decoration: new BoxDecoration(
                          color: Colors.amber,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(25.0)),
                          border: new Border.all(
                            color: Colors.red,
                            width: 1.0,
                          ),
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Positioned(
                            left: 30,
                            top: 0,
                            bottom: 0,
                            width: 3,
                            child: Container(
                                color:
                                    Colors.orange), // replace with your image
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(100, 0, 16, 0),
                            child: Container(
                              transform:
                                  Matrix4.translationValues(0.0, -20.0, 0.0),
                              child: Wrap(children: [
                                Text(
                                    'First Step'),
                                if (rejected != '') ...[
                                  SizedBox(
                                    width: c_width,
                                    height: 30,
                                  ),
                                  Text(
                                    'Rejected',
                                  ),
                                  const SizedBox(height: 10),
                                ]
                              ]),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 18),
                            width: 28.0,
                            height: 28.0,
                            child: getInnerElementOfStepper(1),
                            decoration: new BoxDecoration(
                              color: Colors.amber,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(25.0)),
                              border: new Border.all(
                                color: Colors.red,
                                width: 1.0,
                              ),
                            ),
                          ),
                          Stack(
                            children: <Widget>[
                              Positioned(
                                left: 30,
                                top: 0,
                                bottom: 5,
                                width: 3,
                                child: Container(
                                    color: Colors
                                        .orange), // replace with your image
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(100, 0, 16, 16),
                                child: Container(
                                  transform: Matrix4.translationValues(
                                      0.0, -20.0, 0.0),
                                  child: Wrap(children: [
                                    Text(
                                        'Second Step')
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 18),
                            width: 28.0,
                            height: 28.0,
                            child: getInnerElementOfStepper(1),
                            decoration: new BoxDecoration(
                              color: Colors.amber,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(25.0)),
                              border: new Border.all(
                                color: Colors.red,
                                width: 1.0,
                              ),
                            ),
                          ),
                          Stack(
                            children: <Widget>[
                              Positioned(
                                left: 30,
                                top: 0,
                                bottom: 5,
                                width: 3,
                                child: Container(
                                    color: Colors
                                        .orange), // replace with your image
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(100, 0, 16, 16),
                                child: Container(
                                  transform: Matrix4.translationValues(
                                      0.0, -20.0, 0.0),
                                  child: Wrap(children: [
                                    Text(
                                        'Third Step'),
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ])));
  }

  getCircleColor(i) {
    var color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep)
      color = currentStepColor;
    else
      color = Color(0xFFD9D9D9);
    return color;
  }

  getBorderColor(i) {
    var color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep)
      color = currentStepColor;
    else
      color = inactiveColor;

    return color;
  }

  getLineColor(i) {
    var color = curStep > i + 1 ? Color(0xFF24C091) : Color(0xFFD9D9D9);
    return color;
  }

  getText(i) {
    var stepText;
    var subStepText;

    switch (i) {
      case 0:
        stepText =
            'Register your business to claim ownership info of your business';
        subStepText = 'Search and claim or Add to claim for sub step text';
        break;
      case 1:
        stepText = 'Add your first product';
        subStepText = 'Create your online store';
        break;
      case 2:
        stepText = 'Manage your product';
        subStepText = 'Start selling';
        break;
    }
    return stepText;
  }

  List<Widget> _stepText(BuildContext context) {
    var listText = <Widget>[];
    double c_width = MediaQuery.of(context).size.width - 125;
    print('$c_width');
    for (int i = 0; i < totalSteps; i++) {
      String? rejected = 'Sorry, this is rejected';
      listText.add(
        Column(
          children: [
            Container(
              width: c_width,
              margin: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText(i).toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                    ),
                  ),
                  if (rejected != '') ...[
                    const SizedBox(height: 15),
                    Text(
                      'Re-submit your ownership info',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                        color: Colors.red,
                      ),
                      softWrap: true,
                    ),
                    const SizedBox(height: 18),
                  ] else ...[
                    const Text(
                      '',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                          color: Colors.white),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      );
    }
    return listText;
  }

  List<Widget> _steps() {
    var list = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      var circleColor = getCircleColor(i);
      var borderColor = getBorderColor(i);
      var lineColor = getLineColor(i);
      String? rejected = 'Sorry, this is rejected';
      list.add(
        Column(children: [
          Container(
            width: 28.0,
            height: 28.0,
            child: getInnerElementOfStepper(i),
            decoration: new BoxDecoration(
              color: circleColor,
              borderRadius: new BorderRadius.all(new Radius.circular(25.0)),
              border: new Border.all(
                color: borderColor,
                width: 1.0,
              ),
            ),
          ),
        ]),
      );
      if (i != totalSteps - 1) {
        list.add(
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (rejected == '') ...[
                  Container(
                    height: 48,
                    width: 2.5,
                    color: lineColor,
                  ),
                ] else ...[
                  Container(
                    height: 83,
                    width: 2.5,
                    color: lineColor,
                  ),
                ]
              ],
            ),
          ),
        );
      }
    }
    return list;
  }

  Widget getInnerElementOfStepper(index) {
    if (index + 1 < curStep) {
      return Icon(
        Icons.check,
        color: Colors.white,
        size: 16.0,
      );
    } else if (index + 1 == curStep) {
      return Center(
        child: Text(
          // '$curStep',
          '',
          style: TextStyle(
            color: Color(0xFF24C091),
            fontWeight: FontWeight.bold,
            fontFamily: 'Avenir',
          ),
        ),
      );
    } else
      return Container();
  }
}

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
    return Container(
        alignment: Alignment.topLeft,
        width: width,
        margin: const EdgeInsets.only(left: 0, top: 30, right: 0, bottom: 0),
        child: SingleChildScrollView(
            child: Column(
          // children: [
          //   _firstStep(context),
          //   _secondStep(context),
          //   _thirdStep(context),
          // ]
          children: <Widget>[
            for (int i = 0; i < totalSteps; i++) _firstStep(context, i)
          ],
        )
        )
        );
  }

  Widget _firstStep(BuildContext context, i) {
    var rejected = 'this is rejected';
    return Column(
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
                borderRadius: new BorderRadius.all(new Radius.circular(25.0)),
                border: new Border.all(
                  color: Colors.red,
                  width: 1.0,
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                if (i < 2) ...[
                  Positioned(
                    left: 30,
                    top: 0,
                    bottom: 0,
                    width: 3,
                    child: Container(
                        color: Colors.orange), // replace with your image
                  ),
                ],
                Padding(
                  padding: EdgeInsets.fromLTRB(100, 0, 16, 16),
                  child: Container(
                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                    child: Wrap(children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(getText(i).toString())),
                      if (rejected != '') ...[
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 25,
                        ),
                        Text(
                          'Re-submit your ownership info',
                        ),
                      ]
                    ]),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
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
        stepText = 'Register your business';
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

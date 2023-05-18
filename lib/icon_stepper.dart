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
    return Container(
        alignment: Alignment.topLeft,
        width: width,
        height: 350,
        margin: const EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 0),
        child: Row(
          children: [
            Column(
              children: _steps(),
            ),
            Column(
              children: _stepText(),
            ),
          ],
        ));
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
        subStepText = 'Search and claim or Add to claim';
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

  List<Widget> _stepText() {
    var listText = <Widget>[];
    padding: const EdgeInsets.only(left: 1, top: 50);
    for (int i = 0; i < totalSteps; i++) {
      var circleColor = getCircleColor(i);
      var borderColor = getBorderColor(i);
      var lineColor = getLineColor(i);
      var title = getText(i);

      listText.add(
        Column(
          children: [
              Container(
              margin: const EdgeInsets.only(left: 15, top: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Header',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    'Sub Header',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                        color: Color(0xFF666666)),
                  ),
                  SizedBox(height: 56),
                ],
              ),
            ),
            
          ],
        ),
      );
    }
    return listText;
  }

  List<Widget> _stepsold() {
    var list = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      var circleColor = getCircleColor(i);
      var borderColor = getBorderColor(i);
      var lineColor = getLineColor(i);
      var title = getText(i);

      list.add(
        Container(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
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
          Container(
            margin: const EdgeInsets.only(left: 15, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  title.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Color(0xFF666666)),
                ),
              ],
            ),
          ),
        ],
      )));
      if (i != totalSteps  - 1) {
        list.add(
          Container(
            margin: const EdgeInsets.only(left: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  width: 2.5,
                  color: lineColor,
                ),
              ],
            ),
          ),
        );
      }
    }
    const SizedBox(height: 50);
    list.add(Container(
      padding: const EdgeInsets.only(top: 50.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
            backgroundColor: Color.fromARGB(255, 8, 147, 221),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0))),
        child: Text(
          '$curStep',
          // getBtnText(curStep).toString(),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    ));
    return list;
  }

  List<Widget> _steps() {
    var list = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      var circleColor = getCircleColor(i);
      var borderColor = getBorderColor(i);
      var lineColor = getLineColor(i);
      var title = getText(i);

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
                Container(
                  height: 70,
                  width: 2.5,
                  color: lineColor,
                ),
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

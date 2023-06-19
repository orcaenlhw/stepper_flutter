import 'package:flutter/material.dart';
import 'package:stepper/modified_stepper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Icon Stepper Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentStep = 1;
  int stepLength = 3;
  bool complete = false;
  var btnStep = 'Start';
  next() {
    if (currentStep <= stepLength) {
      goTo(currentStep + 1);
    }
  }

  back() {
    if (currentStep > 1) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
    if (currentStep > stepLength) {
      setState(() => complete = true);
    }
  }

  step(currentStep) {
    if (currentStep == 1) {
      btnStep = 'Start';
    } else if (currentStep == 2) {
      btnStep = 'Add Product';
    } else if (currentStep == 3) {
      btnStep = 'Manage Product';
    } else if (currentStep == 4) {
      btnStep = 'Complete';
    }
    return btnStep;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Stepper'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 30, top: 50, right: 30),
            foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 184, 184, 184),
                    offset: Offset(0, 0),
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Become a seller:',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  )
                ),
                NumberStepper(
                  totalSteps: stepLength,
                  width: MediaQuery.of(context).size.width,
                  curStep: currentStep,
                  stepCompleteColor: Color(0xFF24C091),
                  currentStepColor: Color(0xFF24C091),
                  inactiveColor: Color(0xFFD9D9D9),
                  lineWidth: 1,
                  onPressed: () { next();}
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
                  child: Center(
                  child: ElevatedButton(
                  onPressed: () {next();},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                      backgroundColor: Color.fromARGB(255, 8, 147, 221),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0))),
                  child: Text(
                    step(currentStep).toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )  ,)
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: ElevatedButton(
            onPressed: currentStep == 1
                ? null
                : () {
                    back();
                  },
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            child: const Text('Back'),
          )),
          Expanded(
              child: ElevatedButton(
            onPressed: () {
              next();
            },
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            child: Text(
              currentStep == stepLength ? 'Finish' : 'Next',
              style: const TextStyle(color: Colors.white),
            ),
          ))
        ],
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Stepper Line Demo'),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           ExampleView(),
//         ],
//       ),
//     ),
//   );
// }

Widget getInnerElementOfStepper(index) {
  if (index + 1 < 2) {
    return Icon(
      Icons.check,
      color: Colors.white,
      size: 16.0,
    );
  } else if (index + 1 == 2) {
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

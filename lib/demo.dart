import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';

class Demo extends StatefulWidget {
  Demo({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Stepper Demo'),
      ),
      body: Container(
        child: Stepper(
          physics: const ClampingScrollPhysics(),
          type: StepperType.vertical,
          controlsBuilder: (context, details) {
            return Row(
              children: <Widget>[
                TextButton(
                  onPressed: details.onStepContinue,
                  child: const Text('NEXT'),
                ),
                TextButton(
                  onPressed: details.onStepCancel,
                  child: const Text('BACK'),
                ),
              ],
            );
          },
          currentStep: _currentStep,
          onStepTapped: (step) => setState(() => _currentStep = step),
          onStepContinue: () {
            if (_currentStep < 3) {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          steps: <Step>[
            Step(
              title: const Text('Personal Information'),
              content: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'User Name'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Gender'),
                  ),
                ],
              ),
              isActive: _currentStep >= 0,
              state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: const Text('Contact Details'),
              content: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Address'),
                  ),
                ],
              ),
              isActive: _currentStep >= 1,
              state: _currentStep > 1 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: Text('Complain'),
              content: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'What to Say?'),
                  ),
                ],
              ),
              isActive: _currentStep >= 2,
              state: _currentStep > 2 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: const Text('Submit Form'),
              content: const Text(''),
              isActive: _currentStep >= 3,
              state: _currentStep > 3 ? StepState.complete : StepState.indexed,
            ),
          ],
        ),
      ),
    );
  }
}
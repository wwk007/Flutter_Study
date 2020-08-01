import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: Colors.black,
                ),
                child: Stepper(
                  currentStep: _currentStep,//当前打开的步骤
                  //onStepTapped: 点按步骤事件
                  onStepTapped: (int value) {//value:当前被按的步骤的索引值
                    setState(() {
                      _currentStep = value;
                    });
                  },
                  onStepContinue: () {//Continue按钮点击事件
                    setState(() {
                      _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                    });
                  },
                  onStepCancel: () {//Cancel按钮点击事件
                    setState(() {
                      _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                    });
                  },
                  steps: [
                    Step(
                      title: Text('Login'),
                      subtitle: Text('Login first.'),
                      content: Text('Conguratulations ! Login Success.'),
                      isActive: _currentStep == 0,//步骤的激活状态
                    ),
                    Step(
                      title: Text('Choose Plan'),
                      subtitle: Text('Choose your plan.'),
                      content: Text('Conguratulations ! Login Success.'),
                      isActive: _currentStep == 1,
                    ),
                    Step(
                      title: Text('Confirm payment'),
                      subtitle: Text('Confirm your payment method.'),
                      content: Text('Conguratulations ! Login Success.'),
                      isActive: _currentStep == 2,
                    ),
                  ],
                ),
              ),
            ],
        ),
      ),
    );
  }
}

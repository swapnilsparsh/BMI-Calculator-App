import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'container_box.dart';
import 'data_container.dart';
import 'package:url_launcher/url_launcher.dart';

const activeColor = Color(0xff0073dd);
const inActiveColor = Color(0xFF212121);

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;
  int height = 180;
  int weight = 20;
  int age = 25;
  String result = "";
  String resultDetail = "Result here";
  double bmi = 0;

  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        maleBoxColor = inActiveColor;
      } else {
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  String calculateBmi(int weight, int height) {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  /* String getInterpretation(double bmi) {
    if (bmi >= 25.0) {
      return 'You have higher than normal body weight. Try to excersie more.';
    } 
    else if (bmi > 18.5) {
      return 'You have a normal body weight. Good Job!';
    } 
    else {
      return 'You have lower than normal body weight. You can eat a bit more.';
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBoxColor(1);
                    });
                  },
                  child: ContainerBox(
                    boxColor: maleBoxColor,
                    childwidget: DataContainer(
                        icon: FontAwesomeIcons.male, title: 'MALE'),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBoxColor(2);
                    });
                  },
                  child: ContainerBox(
                    boxColor: femaleBoxColor,
                    childwidget: DataContainer(
                        icon: FontAwesomeIcons.female, title: 'FEMALE'),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ContainerBox(
              boxColor: inActiveColor,
              childwidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: textStyle1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: textStyle2,
                      ),
                      Text(
                        'cm',
                        style: textStyle1,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: activeColor,
                    inactiveColor: inActiveColor,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ContainerBox(
                  boxColor: inActiveColor,
                  childwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: textStyle1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            weight.toString(),
                            style: textStyle2,
                          ),
                          Text(
                            'kg',
                            style: textStyle1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            backgroundColor: activeColor,
                            child: Icon(FontAwesomeIcons.plus,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight > 0) {
                                  weight--;
                                }
                              });
                            },
                            backgroundColor: activeColor,
                            child: Icon(FontAwesomeIcons.minus,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ContainerBox(
                  boxColor: inActiveColor,
                  childwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: textStyle1,
                      ),
                      Text(
                        age.toString(),
                        style: textStyle2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (age < 100) {
                                  age++;
                                }
                              });
                            },
                            backgroundColor: activeColor,
                            child: Icon(FontAwesomeIcons.plus,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (age > 0) {
                                  age--;
                                }
                              });
                            },
                            backgroundColor: activeColor,
                            child: Icon(FontAwesomeIcons.minus,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ContainerBox(
              boxColor: inActiveColor,
              childwidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Developed with ❤ by Swapnil Srivastava',
                    style: textStyle1,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FloatingActionButton(
                        elevation: 0,
                        onPressed: () {
                          launch('https://swapnilsparsh.github.io');
                        },
                        backgroundColor: inActiveColor,
                        child: Icon(FontAwesomeIcons.portrait,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      FloatingActionButton(
                        elevation: 0,
                        onPressed: () {
                          launch('https://github.com/swapnilsparsh');
                        },
                        backgroundColor: inActiveColor,
                        child:
                            Icon(FontAwesomeIcons.github, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      FloatingActionButton(
                        elevation: 0,
                        onPressed: () {
                          launch(
                              'https://www.linkedin.com/in/swapnil-srivastava-sparsh/');
                        },
                        backgroundColor: inActiveColor,
                        child: Icon(FontAwesomeIcons.linkedin,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      FloatingActionButton(
                        elevation: 0,
                        onPressed: () {
                          launch('https://twitter.com/swapnilsparsh');
                        },
                        backgroundColor: inActiveColor,
                        child: Icon(FontAwesomeIcons.twitterSquare,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  result = calculateBmi(weight, height);
                  /*resultDetail = getInterpretation(bmi);*/
                  showDialog(
                      context: context,
                      builder: (BuildContext contest) {
                        return Dialog(
                            backgroundColor: inActiveColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              color: inActiveColor,
                              height: 200.0,
                              margin: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Your BMI',
                                    style: textStyle1,
                                  ),
                                  Text(
                                    result.toString(),
                                    style: textStyle2,
                                  ),
                                  /*Text(
                                    resultDetail,
                                    style: textStyle1,
                                  ),*/
                                ],
                              ),
                            ));
                      });
                });
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Calculate',
                    style: textStyle3,
                  ),
                ),
                width: double.infinity,
                height: 80.0,
                color: activeColor,
                margin: EdgeInsets.only(top: 10.0),
              ))
        ],
      ),
    );
  }
}

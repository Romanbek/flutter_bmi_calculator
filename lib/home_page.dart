import 'package:bmi_densooluk_indeksi/bottom_button.dart';
import 'package:bmi_densooluk_indeksi/calculation_brain.dart';
import 'package:bmi_densooluk_indeksi/constants.dart';
import 'package:bmi_densooluk_indeksi/icon_content.dart';
import 'package:bmi_densooluk_indeksi/result_page.dart';
import 'package:bmi_densooluk_indeksi/reusable_card.dart';

import 'package:bmi_densooluk_indeksi/weight_age_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int height = 120;
  int weight = 50;
  int age = 18;
  Gender gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xff0b0e21),
        elevation: 0,
        title: Text(
          'BMI Calculator'.toUpperCase(),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  bgColor: gender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  child: iconContent(
                    text: 'MALE',
                    icon: FontAwesomeIcons.mars,
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                  bgColor: gender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  child:
                      iconContent(icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                ),
              ),
            ],
          ),
          Expanded(
            child: ReusableCard(
              bgColor: kCardBGColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('height'.toUpperCase()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${height.toString()}',
                        style: kHeightTextStyle,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kRed,
                      inactiveTrackColor: Colors.white,
                      thumbColor: kRed,
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 18.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      // activeColor: Colors.red,
                      // inactiveColor: Colors.white,
                      min: 50.0,
                      max: 250.0,
                      value: height.toDouble(),
                      onChanged: (value) {
                        // print('san: $value');
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  bgColor: kCardBGColor,
                  child: WeightAgeWidget(
                    isCm: true,
                    minus: () {
                      weight--;
                      setState(() {});
                    },
                    plus: () {
                      weight++;
                      setState(() {});
                    },
                    text: 'WEIGHT',
                    number: weight,
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  bgColor: kCardBGColor,
                  child: WeightAgeWidget(
                    minus: () {
                      age--;
                      setState(() {});
                    },
                    plus: () {
                      age++;
                      setState(() {});
                    },
                    text: 'AGE',
                    number: age,
                  ),
                ),
              ),
            ],
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calculatorBrain = CalculatorBrain(
                height: height,
                weight: weight,
              );
              final result = calculatorBrain.calculateBMI();

              print('result: $result');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calculatorBrain.calculateBMI(),
                    resultText: calculatorBrain.getResult(),
                    interpretation: calculatorBrain.getInterpretation(),
                  ),
                ),
              );
            },
            buttonTitle: 'SEE RESULT',
          )
        ],
      ),
    );
  }
}

enum Gender { male, female }

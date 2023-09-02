import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusablecard.dart';
import 'constants.dart';
import 'resultspage.dart';
import 'calculation.dart';

class InputPage extends StatefulWidget{
  @override
  _InputPageState createState()=> _InputPageState();
}

class _InputPageState extends State<InputPage>{
  GenderType gender=GenderType.male;
  int height=180;
  int weight=20;
  int age=10;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF150c25),
        title: Center(child:
        Text('BMI CALCULATOR')),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          gender = GenderType.male;
                        });
                      },
                      child: ReusableWidget(
                          colour: gender == GenderType.male ? activeCardColour : inactiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.mars,
                              size: 80,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF8D8E98),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        gender = GenderType.female;
                      });
                    },
                    child: ReusableWidget(
                      colour: gender == GenderType.female ? activeCardColour : inactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                      ],
                    ),
                ),
                  ),),
              ],
            )),
            Expanded(
                child: ReusableWidget(
                    colour: activeCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'cm',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            ),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape: RoundSliderOverlayShape(overlayRadius:30),
                          overlayColor: Color(0x29EB1555),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                          min: 120.0,
                          max: 300.0,
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue){
                              setState(() {
                                height = newValue.round();
                              });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(
                    colour: activeCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed:(){
                              setState(() {
                                weight--;
                              });
                            },
                            backgroundColor: Color(0xFF8D8E98),
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          FloatingActionButton(
                            onPressed:(){
                              setState(() {
                                weight++;
                              });
                            },
                            backgroundColor: Color(0xFF8D8E98),
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),),
                Expanded(
                  child: ReusableWidget(
                      colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed:(){
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor: Color(0xFF8D8E98),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            FloatingActionButton(
                              onPressed:(){
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: Color(0xFF8D8E98),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),),

              ],
            )),
            GestureDetector(
              onTap: (){
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.interpretation(),
                ),),);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                color: bottomColour,
                padding: EdgeInsets.only(bottom: 20),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomHeight,
              ),
            ),
          ],
        ),
      ),
      );
  }
}
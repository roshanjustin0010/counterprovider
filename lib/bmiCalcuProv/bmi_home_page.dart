import 'package:counter_provider/bmiCalcuProv/Result_pg.dart';
import 'package:counter_provider/bmiCalcuProv/bmi_model.dart';
import 'package:counter_provider/bmiCalcuProv/providerBmi/bmi_provider_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiHome extends StatelessWidget {
  const BmiHome({Key? key}) : super(key: key);

  //result=(_weight/_height/_height)*10000;
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('rebuild bmi inside');
    }
    return Consumer<BmiProvider>(builder: (context, value, child) {
      final bmi = context.read<BmiProvider>();

      return MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            appBar: AppBar(title: const Center(child: Text('BMI Calculator'))),
            body: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),

                //gender
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //male box

                    GestureDetector(
                      child: const Gendercard(),
                    ),

                    //female box
                    Container(
                      height: 150,
                      width: 150,
                      color: const Color(0xFF0A0E35),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.female,
                            size: 75,
                            semanticLabel: 'Female',
                          ),
                          Text(
                            'Female',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                //end of genderbox

                const SizedBox(
                  height: 25,
                ),

                //height slider

                Container(
                  height: 200,
                  width: 350,
                  color: const Color(0xFF0A0E35),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Height',
                          style: TextStyle(fontSize: 30),
                        ),

                        Text(
                          '${value.height.toString()} cm',
                          style: const TextStyle(fontSize: 30),
                        ),

                        //slider

                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.grey.shade600,
                              inactiveTrackColor: Colors.white,
                              thumbColor: const Color(0xFFE88100),
                              overlayColor: const Color(0xFF7a7a7a),
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 18),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 25)),
                          child: Slider(
                            value: value.height.toDouble(),
                            min: 120,
                            max: 220,
                            // activeColor: Color(0xff027b8d),
                            onChanged: (double newVal) {
                              value.setHeight(newVal);
                            },
                          ),
                        ),

                        //end slider
                      ],
                    ),
                  ),
                ),
                //end of height slider

                const SizedBox(
                  height: 25,
                ),

                //weight age box

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //weight box
                    Container(
                      height: 150,
                      width: 150,
                      color: const Color(0xFF0A0E35),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Weight',
                            style: TextStyle(fontSize: 20),
                          ),

                          Text(
                            value.weight.toString(),
                            style: const TextStyle(fontSize: 30),
                          ),

                          //+ - button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  bmi.subweight();
                                },
                                backgroundColor: const Color(0xFFE88100),
                                heroTag: "3",
                                child: const Icon(Icons.minimize),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  bmi.addweight();
                                },
                                backgroundColor: const Color(0xFFE88100),
                                heroTag: "4",
                                child: const Icon(Icons.add),
                              )
                            ],
                          ),

                          //end + - button
                        ],
                      ),
                    ),

                    //age box
                    Container(
                      height: 150,
                      width: 150,
                      color: const Color(0xFF0A0E35),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(fontSize: 20),
                          ),

                          Text(
                            value.age.toString(),
                            style: const TextStyle(fontSize: 30),
                          ),

                          //+ - button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  bmi.subage();
                                },
                                backgroundColor: const Color(0xFFE88100),
                                heroTag: "1",
                                child: const Icon(Icons.minimize),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  bmi.addage();
                                },
                                backgroundColor: const Color(0xFFE88100),
                                heroTag: "2",
                                child: const Icon(Icons.add),
                              )
                            ],
                          ),

                          //end + - button
                        ],
                      ),
                    ),
                  ],
                ),

                //end weight age box

                const SizedBox(
                  height: 25,
                ),

                //calculate button

                GestureDetector(
                  onTap: () {
                    BmiModel bmiCalc = value.getResult();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          getcol: bmiCalc.bgColor,
                          stg: bmiCalc.getResult,
                          gettxt: bmiCalc.contentText,
                          getcal: bmiCalc.bmiCal,
                          txtcol: bmiCalc.textColor,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    color: const Color(0xFFE88100),
                    child: const Center(
                        child: Text(
                      'Calculate',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    )),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}

class Gendercard extends StatelessWidget {
  const Gendercard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      color: const Color(0xFF0A0E35),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.male,
            size: 75,
            semanticLabel: 'male',
          ),
          Text(
            'Male',
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}

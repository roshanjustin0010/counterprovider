import 'package:flutter/material.dart';

import 'bmi_home_page.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({
    super.key,
    required this.getcol,
    required this.stg,
    required this.gettxt,
    required this.getcal,
    required this.txtcol,
  });
  String getcal;
  String stg, gettxt;
  Color txtcol, getcol;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI Calculator Result')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 25,
          ),

          const Center(
              child: Text(
            'YOUR RESULTS',
            style: TextStyle(fontSize: 40),
          )),

          const SizedBox(
            height: 25,
          ),

          //resultbox

          Container(
            height: 500,
            width: 350,
            color: getcol,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  stg,
                  style: TextStyle(fontSize: 50, color: txtcol),
                ),
                Text(
                  getcal.toString(),
                  style: TextStyle(fontSize: 50, color: txtcol),
                ),
                Center(
                  child: Text(gettxt,
                      style: TextStyle(fontSize: 30, color: txtcol)),
                ),
              ],
            ),
          ),

          //end result box

          const SizedBox(
            height: 25,
          ),

          //goback recalcukate

          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const BmiHome()));
            },
            child: Container(
              height: 50,
              width: 300,
              color: Color(0xFFE88100),
              child: const Center(
                  child: Text(
                'Re-Calculate',
                style: TextStyle(fontSize: 30, color: Colors.black),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

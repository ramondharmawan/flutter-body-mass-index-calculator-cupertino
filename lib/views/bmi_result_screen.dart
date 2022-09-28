import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key, required this.bmi});

  final double bmi;

  String determineBmiCategory(double bmiValue) {
    String category = "";
    /*
    if (bmiValue < 16.0) {
      category = underweightSevere;
    } else if (bmiValue <= 16.0 && bmiValue < 17.0) {
      category = underweightModerate;
    } else if (bmiValue <= 17.0 && bmiValue < 18.5) {
      category = underweightMild;
    } else if (bmiValue <= 18.5 && bmiValue < 25.0) {
      category = normal;
    } else if (bmiValue <= 25.0 && bmiValue < 30.0) {
      category = overweight;
    } else if (bmiValue <= 30.0 && bmiValue < 35.0) {
      category = obeseI;
    } else if (bmiValue <= 35.0 && bmiValue < 40.0) {
      category = obeseII;
    } else if (bmiValue >= 40.0) {
      category = obeseIII;
    }
    */

    if (bmiValue < 16.0) {
      category = underweightSevere;
    } else if (bmiValue < 17.0) {
      category = underweightModerate;
    } else if (bmiValue < 18.5) {
      category = underweightMild;
    } else if (bmiValue < 25.0) {
      category = normal;
    } else if (bmiValue < 30.0) {
      category = overweight;
    } else if (bmiValue < 35.0) {
      category = obeseI;
    } else if (bmiValue < 40.0) {
      category = obeseII;
    } else if (bmiValue >= 40.0) {
      category = obeseIII;
    }

    return category;
  }

  String getHealRiskDescription(String categoryName) {
    String desc = "";
    switch (categoryName) {
      case underweightSevere:
        desc = "Posible nutritional deficiency and osteoporosis";
        break;
      case underweightModerate:
        desc = "Posible nutritional deficiency and osteoporosis";
        break;
      case underweightMild:
        desc = "Posible nutritional deficiency and osteoporosis";
        break;
      case normal:
        desc = "Low Risk (healthy range)";
        break;
      case overweight:
        desc =
            "Moderate risk of developing heart disease, high blood presure, stroke, daiabetes mellitus";
        break;
      case obeseI:
        desc =
            "Quite risk of developing heart disease, high blood presure, stroke, daiabetes mellitus";
        break;
      case obeseII:
        desc =
            "High risk of developing heart disease, high blood presure, stroke, daiabetes mellitus";
        break;
      case obeseIII:
        desc =
            "Very high risk of developing heart disease, high blood presure, stroke, daiabetes mellitus";
        break;
      default:
    }

    return desc;
  }

  @override
  Widget build(BuildContext context) {
    final bmiCategory = determineBmiCategory(bmi);
    final bmiDesc = getHealRiskDescription(bmiCategory);

    return Scaffold(
      appBar: AppBar(title: Text('HASIL HITUNG BMI')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  "Hasil Hitung",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BmiCard(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiCategory,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "${bmi.toStringAsFixed(1)}",
                      style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      bmiDesc,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 80,
              color: Color(0xffec3c66),
              child: const Center(
                  child: Text(
                'KALKULASI ULANG',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}

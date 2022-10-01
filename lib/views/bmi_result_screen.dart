import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({
    super.key,
    required this.bmi,
    //this.bmiCalculator
  });

  final double bmi;
  //final BmiCalculator? bmiCalculator;

  // String determineBmiCategory(double bmiValue) {
  //   String category = "";
  //   /*
  //   if (bmiValue < 16.0) {
  //     category = underweightSevere;
  //   } else if (bmiValue <= 16.0 && bmiValue < 17.0) {
  //     category = underweightModerate;
  //   } else if (bmiValue <= 17.0 && bmiValue < 18.5) {
  //     category = underweightMild;
  //   } else if (bmiValue <= 18.5 && bmiValue < 25.0) {
  //     category = normal;
  //   } else if (bmiValue <= 25.0 && bmiValue < 30.0) {
  //     category = overweight;
  //   } else if (bmiValue <= 30.0 && bmiValue < 35.0) {
  //     category = obeseI;
  //   } else if (bmiValue <= 35.0 && bmiValue < 40.0) {
  //     category = obeseII;
  //   } else if (bmiValue >= 40.0) {
  //     category = obeseIII;
  //   }
  //   */

  //   if (bmiValue < 16.0) {
  //     category = underweightSevere;
  //   } else if (bmiValue < 17.0) {
  //     category = underweightModerate;
  //   } else if (bmiValue < 18.5) {
  //     category = underweightMild;
  //   } else if (bmiValue < 25.0) {
  //     category = normal;
  //   } else if (bmiValue < 30.0) {
  //     category = overweight;
  //   } else if (bmiValue < 35.0) {
  //     category = obeseI;
  //   } else if (bmiValue < 40.0) {
  //     category = obeseII;
  //   } else if (bmiValue >= 40.0) {
  //     category = obeseIII;
  //   }

  //   return category;
  // }

  // String getHealRiskDescription(String categoryName) {
  //   String desc = "";
  //   switch (categoryName) {
  //     case underweightSevere:
  //     case underweightModerate:
  //       desc = "Posible nutritional deficiency and osteoporosis";
  //       break;
  //     case normal:
  //       desc = "Low Risk (healthy range)";
  //       break;
  //     case overweight:
  //       desc =
  //           "Moderate risk of developing heart disease, high blood presure, stroke, daiabetes mellitus";
  //       break;
  //     case obeseI:
  //     case obeseII:
  //     case obeseIII:
  //       desc =
  //           "High risk of developing heart disease, high blood presure, stroke, daiabetes mellitus";
  //       break;
  //     default:
  //   }

  //   return desc;
  // }

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    //final bmiCategory = determineBmiCategory(bmi); dari yang awal
    final bmiCategory = bmiCalculator.determineBmiCategory();
    //final bmiDesc = getHealRiskDescription(bmiCategory); dari yang awal
    final bmiDesc = bmiCalculator.getHealRiskDescription();

    return Scaffold(
      appBar: AppBar(title: const Text('HASIL HITUNG BMI')),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Hasil Hitung",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
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
                      //bmiCalculator.bmiCategory == null ? "" : bmiCalculator.bmiCategory = jika null, maka nilai kosong tapi jika tidak akan mengembalikan nilai catergorynya
                      bmiCalculator.bmiCategory ?? "",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    Text(
                      //"${bmi.toStringAsFixed(1)}",
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    Text(
                      bmiCalculator.bmiDescription ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15, color: primaryColor),
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
              color: const Color(0xff517df6),
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

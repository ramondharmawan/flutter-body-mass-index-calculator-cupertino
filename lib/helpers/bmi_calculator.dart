import 'package:bmi/constants/constant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator(
      {required this.height,
      required this.weight}); // this.height and this.weight ini dari class BmiCalculator diatas
  BmiCalculator.fromBmiValue(this.bmi) {
    //this.bmi = bmi;
  } // fromBmiValue ini name constructor video 22
  double calculateBmi() {
    double heightInMeter = height! / 100;
    //final h = pow(heightInMeter, 2);
    final h = (heightInMeter * heightInMeter);
    bmi = weight! / h;
    return bmi!;
  }

  String determineBmiCategory() {
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

    if (bmi! < 16.0) {
      category = underweightSevere;
    } else if (bmi! < 17.0) {
      category = underweightModerate;
    } else if (bmi! < 18.5) {
      category = underweightMild;
    } else if (bmi! < 25.0) {
      category = normal;
    } else if (bmi! < 30.0) {
      category = overweight;
    } else if (bmi! < 35.0) {
      category = obeseI;
    } else if (bmi! < 40.0) {
      category = obeseII;
    } else if (bmi! >= 40.0) {
      category = obeseIII;
    }
    bmiCategory = category;
    return bmiCategory!; // ini bmiCategory yang diatas
  }

  String getHealRiskDescription() {
    String desc = "";
    switch (bmiCategory) {
      case underweightSevere:
      case underweightModerate:
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
      case obeseII:
      case obeseIII:
        desc =
            "High risk of developing heart disease, high blood presure, stroke, daiabetes mellitus";
        break;
      default:
    }
    bmiDescription = desc;
    return bmiDescription!;
  }
}

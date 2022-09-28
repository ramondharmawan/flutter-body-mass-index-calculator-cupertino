import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff0a0e21);

TextStyle genderTextStyle = const TextStyle(
  fontSize: 18,
  color: Colors.white,
);

TextStyle? labelTextStyle =
    const TextStyle(fontSize: 18, color: Colors.white // Color(0xff8d8e98),
        );

TextStyle numberTextStyle =
    TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white);

const String underweightSevere = "Underweight (Severe Thinnes)";
const String underweightModerate = "Underweight (Moderate Thinnes)";
const String underweightMild = "Underweight (Mild Thinnes)";
const String normal = "Normal";
const String overweight = "Overweight";
const String obeseI = "Obese (Class I)";
const String obeseII = "Obese (Class II)";
const String obeseIII = "Obese (Class III)";


// TextStyle, String itu adalah category di sini, jadi sebutkan categorynya yang menhold type dari value tersebut )
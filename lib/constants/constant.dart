import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff0a0e21);

TextStyle genderTextStyle = const TextStyle(
  fontSize: 18,
  color: Colors.white,
);

TextStyle? labelTextStyle =
    const TextStyle(fontSize: 18, color: Colors.white // Color(0xff8d8e98),
        );

TextStyle numberTextStyle =
    TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white);

String underweightSevere = "Underweight (Severe Thinnes)";
String underweightModerate = "Underweight (Moderate Thinnes)";
String underweightMild = "Underweight (Mild Thinnes)";
String normal = "Normal";
String overweight = "Overweight";
String obeseI = "Obese (Class I)";
String obeseII = "Obese (Class II)";
String obeseIII = "Obese (Class III)";


// TextStyle, String itu adalah category di sini, jadi sebutkan categorynya yang menhold type dari value tersebut )
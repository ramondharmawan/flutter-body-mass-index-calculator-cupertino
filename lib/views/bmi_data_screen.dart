import 'dart:math';
import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  List<Widget> generateList(start, end) {
    List<Widget> weight = [];
    for (var i = start; i < end; i++) {
      weight.add(
        Text(
          "$i",
          style: labelTextStyle!.copyWith(
            fontSize: 20,
          ),
        ),
      );
    }
    return weight;
  }

  // double calculateBmi() {
  //   double heightInMeter = height / 100;
  //   final h = pow(heightInMeter, 2);
  //   final bmi = weight / h;
  //   return bmi;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        elevation: 0,
        title: const Text("BMI CALCULATOR"),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          final bmiCalculator = BmiCalculator(
              height: height,
              weight:
                  weight); // dibuat final karena kita hanya mengaksesnya sekali saja tidak berulang kali
          bmiCalculator.calculateBmi();
          //print(calculateBmi());
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) {
                return BmiResultScreen(
                    bmi:
                        bmiCalculator.bmi!); // dari bmiCalculator.dart video 22
              }),
            ),
          );
        },
        child: Container(
          height: 60,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: const Color(0xff517df6),
              borderRadius: BorderRadius.circular(8)),
          // saat penggunaan box decoration color dipindah ke dalam box decoration karena tidak boleh ada penggunaan color diluar box decoration
          child: const Center(
              child: Text(
            'Hitung BMI',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )),
        ),
      ),
      body: SingleChildScrollView(
        // dibungkus dengan SingleChildScrollView agar ukuran berapapun tidak menjadi overflow
        physics: BouncingScrollPhysics(), //berikan efek seperti ios
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    gender = "male";
                    setState(() {});
                    //print(gender);
                  },
                  child: BmiCard(
                    borderColor:
                        (gender == "male") ? Color(0xff517df6) : Colors.white,
                    child: Stack(
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 20.0,
                            ),
                            child: GenderIconText(
                              icon: Icons.male,
                              title: 'Male',
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Icon(
                            Icons.check_circle,
                            color: (gender == "male")
                                ? Color(0xff517df6)
                                : Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    gender = "female";
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor:
                        (gender == "female") ? Color(0xff517df6) : Colors.white,
                    child: Stack(
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: GenderIconText(
                              icon: Icons.female,
                              title: "Female",
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Icon(
                            Icons.check_circle,
                            color: (gender == "female")
                                ? Color(0xff517df6)
                                : Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                Text(
                  "HEIGHT",
                  style: labelTextStyle!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: BmiCard(
                        child: Slider(
                          value: height.toDouble(),
                          min: 80,
                          max: 200,
                          thumbColor: Colors.red,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            height = value.toInt();
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    BmiCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 15.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "$height",
                              style: labelTextStyle,
                            ),
                            Text("cm", style: labelTextStyle),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
                child: Row(
              children: [
                Expanded(
                    child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "WEIGHT",
                      style: labelTextStyle,
                    ),
                    BmiCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: CupertinoPicker(
                              scrollController: FixedExtentScrollController(
                                  initialItem:
                                      30), // untuk menampilakkn 50, karena start dari 20 maka ini ditambah 30
                              itemExtent: 25,
                              magnification: 2,
                              useMagnifier: true,
                              onSelectedItemChanged: (val) {
                                //print(val);
                                weight = val +
                                    20; // weight = var ( variable yang dikembalikan ditambah 20)
                              },
                              children: generateList(20, 220),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      "AGE",
                      style: labelTextStyle,
                    ),
                    BmiCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: CupertinoPicker(
                              scrollController: FixedExtentScrollController(
                                  initialItem:
                                      20), // untuk menampilakkn 50, karena start dari 20 maka ini ditambah 30
                              itemExtent: 25,
                              magnification: 2,
                              useMagnifier: true,
                              onSelectedItemChanged: (val) {
                                //print(val);
                                weight = val +
                                    20; // weight = var ( variable yang dikembalikan ditambah 20)
                              },
                              children: generateList(15, 90),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = Colors.white,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1))
            ],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor!)),
        margin: const EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80, color: primaryColor),
        const SizedBox(height: 15),
        Text(
          title,
          style: genderTextStyle,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CP-SU LED MATRIX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<homepage> {
  int valueAtRow2Column2InDigit4 = 0;
  var dotsData = [
    // Digit 0
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 1
    [
      [0, 0, 1, 0, 0],
      [0, 1, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
    ],
    // Digit 2
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [1, 1, 1, 1, 1],
    ],
    // Digit 3
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 4
    [
      [0, 0, 0, 1, 0],
      [0, 0, 1, 1, 0],
      [0, 1, 0, 1, 0],
      [1, 0, 0, 1, 0],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 0, 1, 0],
    ],
    // Digit 5
    [
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 6
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 7
    [
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
    ],
    // Digit 8
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 9
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ]
  ];
  int value1 = 0;
  int value2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 200, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 114, 40, 216),
            ),
            child: Text(
              'CP-SU LED MATRIX',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            height: 40,
          ),
          _upbutton(),
          Container(
            margin: EdgeInsets.all(50),
            padding: EdgeInsets.all(50),
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.white, width: 10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDisplay(value1),
                Container(
                  width: 15,
                ),
                _buildDisplay(value2),
              ],
            ),
          ),
          _downbutton(),
          Container(
            height: 60,
          ),
        ],
      ),
    );
  }

  Widget _upbutton() {
    return InkWell(
      onTap: () {
        setState(() {
          if (value1 == 9 && value2 == 9) {
            value1 = 0;
            value2 = 0;
          } else if (value2 == 9) {
            value2 = 0;
            value1++;
          } else {
            value2++;
          }
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          Icons.expand_less,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _downbutton() {
    return InkWell(
      onTap: () {
        setState(() {
          if (value1 == 0 && value2 == 0) {
            value2 = 9;
            value1 = 9;
          } else if (value2 == 0) {
            value1--;
            value2 = 9;
          } else {
            value2--;
          }
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          Icons.expand_more,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildDot(int value) {
    if (value == 1) {
      return Container(
        color: Colors.black,
        child: Icon(
          Icons.brightness_1,
          color: Colors.lightGreenAccent,
        ),
      );
    }
    return Container(
      child: Icon(
        Icons.brightness_1,
        color: const Color.fromARGB(255, 33, 34, 34),
      ),
    );
  }

  Widget _buildRow(List<int> dotsData) {
    return Row(
      children: [
        for (int i = 0; i < dotsData.length; i++) _buildDot(dotsData[i]),
      ],
    );
  }

  Widget _buildDigit(int value) {
    return Column(
      children: [
        for (int j = 0; j < dotsData[value].length; j++)
          _buildRow(dotsData[value][j]),
      ],
    );
  }

  Widget _buildDisplay(int value) {
    return Column(
      children: [
        _buildDigit(value),
      ],
    );
  }
}

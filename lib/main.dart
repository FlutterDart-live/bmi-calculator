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
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //makig global varible for controller
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMi',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
                ),

                SizedBox(
                  height: 11,
                ),

                //Textfield using for weight taking user from text field
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text('Enter your weight..'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(
                  height: 11,
                ),

                //Textfield using for feet taking user from text field
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    label: Text('Enter your feet..'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(
                  height: 11,
                ),

                //Textfield using for in taking user from text field
                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                    label: Text('Enter your inch..'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(
                  height: 16,
                ),

                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (wt != "" && ft != "" && inch != "") {
                      //BMI Calculate

                      var iWt = double.parse(wt);
                      var iFt = double.parse(ft);
                      var iInch = double.parse(inch);

                      var tInch = (iFt * 12) + iInch;

                      var tCm = tInch * 2.45;

                      var tM = tCm / 100;

                      var bmi = iWt / (tM * tM);

                      var msg = "";

                      if (bmi > 25) {
                        msg = "You are OverWeighted!!";
                        bgColor = Colors.red.shade300;
                      } else if (bmi < 18) {
                        msg = "You are UnderWeight!!";
                        bgColor = Colors.orange.shade300;
                      } else {
                        msg = "You are Healthy!!";
                        bgColor = Colors.green.shade300;
                      }

                      setState(() {
                        result =
                            "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the reuired line!!";
                      });
                    }
                  },
                  child: Text(
                    'Calculate',
                  ),
                ),

                SizedBox(
                  height: 18,
                ),

                Text(
                  result,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

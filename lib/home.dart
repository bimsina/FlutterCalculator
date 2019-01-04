import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State createState() => new HomeState();
}

class HomeState extends State<Home> {
  double num1 = 0, num2 = 0, output = 0;
  TextEditingController t1 = new TextEditingController(text: null);
  TextEditingController t2 = new TextEditingController(text: null);

  void doCalculation(String a) {
    num1 = int.parse(t1.text).toDouble();
    num2 = int.parse(t2.text).toDouble();
    setState(() {
      switch (a) {
        case "+":
          output = num1 + num2;
          break;
        case "-":
          output = num1 - num2;
          break;
        case "*":
          output = num1 * num2;
          break;
        case "/":
          output = num1 / num2;
          break;
        default:
          num1 = 0;
          num2 = 0;
          t1.text = '0';
          t2.text = '0';
          output = 0;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calculator'),
        leading: Icon(Icons.keyboard),
      ),
      body: Container(
        color: Colors.greenAccent,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Output : $output',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Enter number 1'),
              controller: t1,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Enter number 2'),
              controller: t2,
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[_calculateButton("+"), _calculateButton("-")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[_calculateButton("*"), _calculateButton("/")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[_calculateButton("Clear")],
            )
          ],
        ),
      ),
    );
  }

  Widget _calculateButton(String number) {
    return MaterialButton(
      color: Colors.red,
      onPressed: () => doCalculation(number),
      child: Text(
        '$number',
        style: TextStyle(
            fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

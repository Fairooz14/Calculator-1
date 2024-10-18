import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = '0';
  String value = '0';
  double number1 = 0.0;
  double number2 = 0.0;
  String operand = '';

  //function to calculate the result
  calculate (dynamic buttonText) 
  {
    if (buttonText == "AC") {
      result = '0';
      value = '0';
      number1 = 0.0;
      number2 = 0.0;
      operand = '';
    } 
    else if (buttonText == "Del") {
      result = '0';
      value = '0';
      number1 = 0.0;
      number2 = 0.0;
      operand = '';
    } 
    else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") 
    {
      number1 = double.parse(result);
      operand = buttonText;
      value = '0';
    } 
    else if (buttonText == "=") 
    {
      number2 = double.parse(result);

      if (operand == "+") 
      {
        value = (number1 + number2).toStringAsFixed(2);
      }
      if (operand == "-") 
      {
        value = (number1 - number2).toStringAsFixed(2);
      }
      if (operand == "*") 
      {
        value = (number1 * number2).toStringAsFixed(2);
      }
      if (operand == "/") 
      {
        value = (number1 / number2).toStringAsFixed(2);
      }

      number1 = 0.0;
      number2 = 0.0;
      operand = '';
    } 
    else 
    {
      value = value + buttonText;
    }

    setState(() {
      result = double.parse(value).toStringAsFixed(2);
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=============== App Bar =================
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Basic Calculator',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 208, 106, 159),
      ),

      //=============== Body =================
      body: Column(
        children: [
          //=============== Calculator UI =================
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                result,
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),

          Expanded(child: Divider()),

          Column(
            children: [
              Row(
                children: [
                  buildButton('AC'),
                  buildButton('%'),
                  buildButton('Del'),
                ],
              ),
              Row(
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                ],
              ),
              Row(
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('*'),
                ],
              ),
              Row(
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-'),
                ],
              ),
              Row(
                children: [
                  buildButton('.'),
                  buildButton('0'),
                  buildButton('='),
                  buildButton('+'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildButton(String buttonText) {
  return Expanded(
    child: Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 225, 140, 168),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.white),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(buttonText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        ),
        onPressed: () {
          print(buttonText);
          calculate(buttonText);
      
        },
      ),
    ),
  );
}

}

//=============== Button Building =================

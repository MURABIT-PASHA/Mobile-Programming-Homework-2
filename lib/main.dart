import 'package:dart_eval/dart_eval.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "";
  String argument = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Color(0xFF22252D)),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 420,
                    right: 20,
                    child: Hero(
                        tag: "text",
                        child: Text(
                          result,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.white),
                        )),
                  ),
                  Positioned(
                    bottom: 470,
                    right: 20,
                    child: Hero(
                        tag: "text",
                        child: Text(
                          argument,
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        )),
                  )
                ],
              ),
            )),
            Positioned(
              bottom: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: const BoxDecoration(
                      color: Color(0xFF2A2D37),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          box("clear", Color(0xFF3D988C), "AC"),
                          box("number", Color(0xFF3D988C), "+/_"),
                          box("number", Color(0xFF3D988C), "%"),
                          box("number", Color(0xFF6E4549), "/"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          box("number", Color(0xFFFFFFFF), "7"),
                          box("number", Color(0xFFFFFFFF), "8"),
                          box("number", Color(0xFFFFFFFF), "9"),
                          box("number", Color(0xFF6E4549), "*"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          box("number", Color(0xFFFFFFFF), "4"),
                          box("number", Color(0xFFFFFFFF), "5"),
                          box("number", Color(0xFFFFFFFF), "6"),
                          box("number", Color(0xFF6E4549), "-"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          box("number", Color(0xFFFFFFFF), "1"),
                          box("number", Color(0xFFFFFFFF), "2"),
                          box("number", Color(0xFFFFFFFF), "3"),
                          box("number", Color(0xFF6E4549), "+"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          box("backspace", Color(0xFFFFFFFF), "<-"),
                          box("number", Color(0xFFFFFFFF), "0"),
                          box("number", Color(0xFFFFFFFF), "."),
                          box("calculate", Color(0xFF6E4549), "="),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget box(String type, Color colour, String text) {
    return GestureDetector(
      onTap: () {
        switch (type) {
          case "number":
            setState(() {
              result += text;
            });
            break;
          case "operator":
            break;
          case "clear":
            setState(() {
              result = "";
              argument = "";
            });
            break;
          case "backspace":
            setState(() {
              String newResult = "";
              for (int i = 0; i < result.length - 1; i++) {
                newResult += result[i];
              }
              result = newResult;
            });
            break;
          case "calculate":
            var evalResult = eval(result);
            print(evalResult);
            setState(() {
                argument = result;
                result = evalResult.toString();
            });
            // String newResult = "";
            // List operators = ["%", "/", "*", "+", "-"];
            // for (String operator in operators) {
            //   if (result.contains(operator)) {
            //     switch (operator) {
            //       case "%":
            //         List splittedList = result.split(operator);
            //         double num1 = double.parse(splittedList[0]);
            //         double num2 = double.parse(splittedList[1]);
            //         newResult = (num1 % num2).toString();
            //         setState(() {
            //           argument = result;
            //           result = newResult;
            //         });
            //         break;
            //       case "/":
            //         List splittedList = result.split(operator);
            //         double num1 = double.parse(splittedList[0]);
            //         double num2 = double.parse(splittedList[1]);
            //         newResult = (num1 / num2).toString();
            //         setState(() {
            //           argument = result;
            //           result = newResult;
            //         });
            //         break;
            //       case "*":
            //         List splittedList = result.split(operator);
            //         double num1 = double.parse(splittedList[0]);
            //         double num2 = double.parse(splittedList[1]);
            //         newResult = (num1 * num2).toString();
            //         setState(() {
            //           argument = result;
            //           result = newResult;
            //         });
            //         break;
            //       case "+":
            //         List splittedList = result.split(operator);
            //         double num1 = double.parse(splittedList[0]);
            //         double num2 = double.parse(splittedList[1]);
            //         newResult = (num1 + num2).toString();
            //         setState(() {
            //           argument = result;
            //           result = newResult;
            //         });
            //         break;
            //       case "-":
            //         List splittedList = result.split(operator);
            //         double num1 = double.parse(splittedList[0]);
            //         double num2 = double.parse(splittedList[1]);
            //         newResult = (num1 - num2).toString();
            //         setState(() {
            //           argument = result;
            //           result = newResult;
            //         });
            //         break;
            //     }
            //   } else {
            //     continue;
            //   }
            //}
            break;
          default:
            print("Error!");
        }
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: const Color(0xFF282B33),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: colour),
          ),
        ),
      ),
    );
  }

  void clear() {}
  void addNumber(String data) {}
}

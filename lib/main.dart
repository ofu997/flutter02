import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
int min = 1, max = 4;
Random rndm = new Random();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demonstration',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Colors.tealAccent[700],
      ),
      home: GameDisplay('Game'), // change from Flutter Demo Home Page
    );
  }
}

enum Operators{
  addition,
  subtraction,
  multiplication,
  division,
}

class GameDisplay extends StatefulWidget {
  final String title;

  GameDisplay(this.title);

  _GameDisplayState createState()=>_GameDisplayState();
}  

class _GameDisplayState extends State<GameDisplay> {
  int _counter;
  int questionNumber, firstNumber, secondNumber, s1, s2, m1, m2, d1, d2;
  int answer, sAnswer, mAnswer;
  double dAnswer; 
  String question, questionAdd, questionSubtract, questionMultiply, questionDivide;
  int random;
  Map<String,int> aRange = const {
    "min": 1,
    "max": 50,
    "maxQuotient": 12,
  };

  @override
  void initState(){
    _counter = 0;
    questionNumber = 1;
    answer = 0;

    final operatorSign = determineOperation();
    // setState(() {
      firstNumber = makeFirstNumber(operatorSign);
    // });
    secondNumber = makeSecondNumber(operatorSign);
    answer = calculateAnswer(firstNumber, secondNumber, operatorSign);
    super.initState();
  }

  void _next() {
    setState(() {
      _counter++;
      questionNumber++;
      final operatorSign = determineOperation();
      firstNumber = makeFirstNumber(operatorSign);
      secondNumber = makeSecondNumber(operatorSign);
      answer = calculateAnswer(firstNumber, secondNumber, operatorSign);
    });
  }

  Operators determineOperation(){
    random = min + rndm.nextInt(max); 
    if (random==1){
      return Operators.addition;
    }
    else if (random==2){
      return Operators.subtraction;
    }
    else if (random==3){
      return Operators.multiplication;
    }
    else {
      return Operators.division;
    }  
  }

  int makeFirstNumber(Operators operatorSign) {
    // int firstNumber;
    if (operatorSign == Operators.addition){
      firstNumber = 
      aRange['min'] + rndm.nextInt(aRange['max']);
      // a2 = aRange['min'] + rndm.nextInt(aRange['max']);
      // aAnswer = a1 + a2; 
    }
    else if (operatorSign == Operators.subtraction){
      firstNumber = aRange['min'] + rndm.nextInt(aRange['max']);
    }        
    else if (operatorSign == Operators.multiplication{

    }        
    else {
      int quotient = aRange['min'] + rndm.nextInt(aRange['maxQuotient']);
      int divisor = aRange['min'] + rndm.nextInt(aRange['maxQuotient']);
      int dividend = quotient*divisor; 
      firstNumber = dividend;
      secondNumber = (dividend/divisor) as int;
      answer = quotient; 
    }
    // setState(() {
        
    //   });
    // print('firstNumber is $firstNumber');
    return firstNumber;      
  }

  int makeSecondNumber(Operators operatorSign){
    // int secondNumber;
    if (operatorSign==Operators.addition){
      secondNumber = aRange['min'] + rndm.nextInt(aRange['max']);
      // firstNumber = a1;
    }
    else if (operatorSign==Operators.subtraction){
      // figure out how to ensure result is positive
    }        
    else if (operatorSign==Operators.multiplication){

    }        
    else {
      
    }
    return secondNumber;      
  }

  int calculateAnswer(int firstNumber, int secondNumber, Operators operatorSign){
    if(operatorSign==Operators.addition)
    answer = firstNumber + secondNumber;
    return answer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, 
          style: TextStyle(color: Colors.orange[300]),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$questionNumber. $question '
            ),
            Text(
              'firstNumber: $firstNumber, secondNumber: $secondNumber, answer: $answer'
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _next,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.tealAccent[50],
    );
  }
}


// This trailing comma makes auto-formatting nicer for build methods.
// Column is also layout widget. It takes a list of children and
// Center is a layout widget. It takes a single child and positions it
// Here we take the value from the GameDisplay object that was created by
// This method is rerun every time setState is called, for instance as done
// This call to setState tells the Flutter framework that something has
// This widget is the home page of your application. It is stateful, meaning
// This is the theme of your application.
// This widget is the root of your application.
// Try running your application with "flutter run". You'll see the
// application has a blue toolbar. Then, without quitting the app, try
// changing the primarySwatch below to Colors.green and then invoke
// "hot reload" (press "r" in the console where you ran "flutter run",
// or simply save your changes to "hot reload" in a Flutter IDE).
// Notice that the counter didn't reset back to zero; the application
// is not restarted.
// that it has a State objerct (defined below) that contains fields that affect
// how it looks.

// This class is the configuration for the state. It holds the values (in this
// case the title) provided by the parent (in this case the App widget) and
// used by the build method of the State. Fields in a Widget subclass are
// always marked "final".

// void initState(

// )
// changed in this State, which causes it to rerun the build method below
// so that the display can reflect the updated values. If we changed
// _counter without calling setState(), then the build method would not be
// called again, and so nothing would appear to happen.
// by the _incrementCounter method above.
//
// The Flutter framework has been optimized to make rerunning build methods
// fast, so that you can just rebuild anything that needs updating rather
// than having to individually change instances of widgets.
// the App.build method, and use it to set our appbar title.
// in the middle of the parent.
// arranges them vertically. By default, it sizes itself to fit its
// children horizontally, and tries to be as tall as its parent.
//
// Invoke "debug painting" (press "p" in the console, choose the
// "Toggle Debug Paint" action from the Flutter Inspector in Android
// Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
// to see the wireframe for each widget.
//
// Column has various properties to control how it sizes itself and
// how it positions its children. Here we use mainAxisAlignment to
// center the children vertically; the main axis here is the vertical
// axis because Columns are vertical (the cross axis would be
// horizontal).
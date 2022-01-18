import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APP',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String a = "0";
  String b = "0";
  String c = "0";
  String d = "0";
  String res = "0";
  bool opBool = false;
  int e = 1;
  void result(String buttontext) {
    setState(() {
      if (buttontext == "AC") {
        opBool = false;
        a = "0";
        res = "0";
        b = "0";
        d = "0";
        c = "0";
        e = 1;
      }
      if (buttontext != "AC" &&
          buttontext != "C" &&
          buttontext != "%" &&
          buttontext != "/" &&
          buttontext != "x" &&
          buttontext != "-" &&
          buttontext != "+" &&
          buttontext != "^" &&
          buttontext != "=") {
        if (a == "0") {
          a = buttontext;
        } else {
          a = a + buttontext;
        }
      }
    });

    if (buttontext == "+" ||
        buttontext == "-" ||
        buttontext == "/" ||
        buttontext == "x" ||
        buttontext == "%" ||
        buttontext == "^") {
      opBool = true;

      b = a;
      a = a + buttontext;
      c = buttontext;
    }
    if (opBool &&
        buttontext != "AC" &&
        buttontext != "C" &&
        buttontext != "%" &&
        buttontext != "/" &&
        buttontext != "x" &&
        buttontext != "-" &&
        buttontext != "+" &&
        buttontext != "^" &&
        buttontext != "=") {
      if (d == "0") {
        d = buttontext;
      } else {
        d = d + buttontext;
      }
    }
    if (buttontext == "C") {
      res = "0";
      a = a.substring(0, a.length - 1);
      d = d.substring(0, d.length - 1);
    }

    if (buttontext == "=" && d != "0") {
      if (c == "+") {
        res = (double.parse(b) + double.parse(d)).toString();
      }
      if (c == "x") {
        res = (double.parse(b) * double.parse(d)).toString();
      }
      if (c == "-") {
        res = (double.parse(b) - double.parse(d)).toString();
      }
      if (c == "/") {
        if(d=="0"){
          res="not defined";
        }
        else{
        res = (double.parse(b) / double.parse(d)).toString();
        }
      }
      if (c == "%") {
        res = (double.parse(b) % double.parse(d)).toString();
      }
      if (c == "^") {
        while (int.parse(d) == 1) {
          int.parse(d) - 1;
        }
        res = (e).toString();
      }
      
    }
  }

  Widget mybutton(
    String buttontext,
    Color buttoncolor,
  ) {
    return Container(
      child: MaterialButton(
          onPressed: () => result(buttontext),
          child: Text(
            buttontext,
            style: TextStyle(
                fontSize: 30.0,
                color: buttoncolor,
                fontWeight: FontWeight.normal),
          ),
          shape: CircleBorder()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
            child: Container(
              child: Text(
                a,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
            child: Container(
              child: Text(
                res,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  mybutton("AC", (Colors.orangeAccent[700])!),
                  mybutton("C", (Colors.orangeAccent[700])!),
                  mybutton("%", (Colors.orangeAccent[700])!),
                  mybutton("/", (Colors.orangeAccent[700])!),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mybutton("7", (Colors.black)),
                mybutton("8", (Colors.black)),
                mybutton("9", (Colors.black)),
                mybutton("x", (Colors.orangeAccent[700])!),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mybutton("4", (Colors.black)),
                mybutton("5", (Colors.black)),
                mybutton("6", (Colors.black)),
                mybutton("-", (Colors.orangeAccent[700])!),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mybutton("1", (Colors.black)),
                mybutton("2", (Colors.black)),
                mybutton("3", (Colors.black)),
                mybutton("+", (Colors.orangeAccent[700])!),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mybutton("^", (Colors.orangeAccent[700])!),
                mybutton("0", (Colors.black)),
                mybutton(".", (Colors.black)),
                mybutton("=", (Colors.orangeAccent[700])!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

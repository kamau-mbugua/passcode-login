import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PinLogin(),
  ));
}

class PinLogin extends StatefulWidget {
  //const PinLogin({Key? key}) : super(key: key);

  @override
  _PinLoginState createState() => _PinLoginState();
}

class _PinLoginState extends State<PinLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.blue],
          begin: Alignment.topRight,
        )),
        child: pinScreen(),
      ),
    );
  }
}

class pinScreen extends StatefulWidget {
  //const pinScreen({Key? key}) : super(key: key);

  @override
  _pinScreenState createState() => _pinScreenState();
}

class _pinScreenState extends State<pinScreen> {
  List<String> currentPin = ["", "", "", ""];
  TextEditingController currentPin1 = TextEditingController();
  TextEditingController currentPin2 = TextEditingController();
  TextEditingController currentPin3 = TextEditingController();
  TextEditingController currentPin4 = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Colors.transparent));

  int pinIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          buildExitButton(),
          Expanded(
            child: Container(
              alignment: Alignment(0, 0.5),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildSecurityText(),
                  SizedBox(
                    height: 40.0,
                  ),
                  buildPinRow(),
                ],
              ),
            ),
          ),
          buildNumberPad(),
          forgortPasswordText(),
        ],
      ),
    );
  }

  forgortPasswordText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Forgot your Pin ?",
            style: TextStyle(
                color: Colors.white,
                fontSize: 21.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 7.0,),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Reset Here!",
            style: TextStyle(
                color: Colors.purple,
                fontSize: 21.0,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  buildExitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: () {},
            height: 50.0,
            minWidth: 50.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            //child: ,
          ),
        )
      ],
    );
  }

  buildSecurityText() {
    return Text(
      "Security Pin",
      style: TextStyle(
          color: Colors.white70, fontSize: 21.0, fontWeight: FontWeight.bold),
    );
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PinNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: currentPin1,
        ),
        PinNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: currentPin2,
        ),
        PinNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: currentPin3,
        ),
        PinNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: currentPin4,
        ),
      ],
    );
  }

  buildNumberPad() {
    int n;
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeyBoardNumber(
                    n: 1,
                    onPressed: () {
                      pinIndexSetup("1");
                    },
                  ),
                  KeyBoardNumber(
                    n: 2,
                    onPressed: () {
                      pinIndexSetup("2");
                    },
                  ),
                  KeyBoardNumber(
                    n: 3,
                    onPressed: () {
                      pinIndexSetup("3");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeyBoardNumber(
                    n: 4,
                    onPressed: () {
                      pinIndexSetup("4");
                    },
                  ),
                  KeyBoardNumber(
                    n: 5,
                    onPressed: () {
                      pinIndexSetup("5");
                    },
                  ),
                  KeyBoardNumber(
                    n: 6,
                    onPressed: () {
                      pinIndexSetup("6");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeyBoardNumber(
                    n: 7,
                    onPressed: () {
                      pinIndexSetup("7");
                    },
                  ),
                  KeyBoardNumber(
                    n: 8,
                    onPressed: () {
                      pinIndexSetup("8");
                    },
                  ),
                  KeyBoardNumber(
                    n: 9,
                    onPressed: () {
                      pinIndexSetup("9");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 60.0,
                    child: MaterialButton(
                      height: 60.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      onPressed: () {
                        confirmPin();
                      },
                      child: Image.asset(
                        "assets/images/check.png",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  KeyBoardNumber(
                    n: 0,
                    onPressed: () {
                      pinIndexSetup("0");
                    },
                  ),
                  Container(
                    width: 60.0,
                    child: MaterialButton(
                      height: 60.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      onPressed: () {
                        clearPin();
                      },
                      child: Image.asset(
                        "assets/images/backspace.png",
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        /* padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildSecurityText(),
            SizedBox(height: 40.0),
            buildPinRow()
          ],
        ),*/
      ),
    );
  }

  void pinIndexSetup(String s) {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 4) pinIndex++;
    setPin(pinIndex, s);
    currentPin[pinIndex - 1] = s;
    String strpin = "";
    currentPin.forEach((element) {
      strpin += element;
    });
    if (pinIndex == 4) print(strpin);
  }

  setPin(int /*pinIndex*/ n, String s) {
    switch (n) {
      case 1:
        currentPin1.text = s;
        break;
      case 2:
        currentPin2.text = s;
        break;
      case 3:
        currentPin3.text = s;
        break;
      case 4:
        currentPin4.text = s;
        break;
    }
  }

  void clearPin() {
    if (pinIndex == 0)
      pinIndex = 0;
    else if (pinIndex == 4) {
      setPin(pinIndex, " ");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  void confirmPin() {}
}

class PinNumber extends StatelessWidget {
  // const PinNumber({Key? key}) : super(key: key);

  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;

  PinNumber({this.textEditingController, this.outlineInputBorder});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      child: TextField(
        controller: textEditingController,
        enabled: true,
        obscureText: true,
        showCursor: true,
        readOnly: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.0),
          border: outlineInputBorder,
          filled: true,
          fillColor: Colors.white38,
        ),
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 21.0, color: Colors.white),
      ),
    );
  }
}

class KeyBoardNumber extends StatelessWidget {
  //const KeyBoardNumber({Key? key}) : super(key: key);

  final int n;

  final Function() onPressed;

  KeyBoardNumber({this.n, this.onPressed});

  /* KeyBoardNumber({this.n, this.onPressed});*/

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.purpleAccent.withOpacity(0.1),
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        height: 90.0,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24 * MediaQuery.of(context).textScaleFactor,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

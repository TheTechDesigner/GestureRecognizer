import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF832685),
        primaryColorLight: Color(0xFFC81379),
        accentColor: Color(0xFFFAF2FB),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Gesture Recognizer';

  // Check on you real device, you can log press of green color font then your device vibrate

  LongPressGestureRecognizer _longPressRecognizer;

  @override
  void initState() { 
    super.initState();
    _longPressRecognizer = LongPressGestureRecognizer()..onLongPress = _handlePress;
  }

  @override
  void dispose() { 
    super.dispose();
    _longPressRecognizer.dispose();
  }

  void _handlePress() {
    HapticFeedback.vibrate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
            text: 'Can you',
            style: TextStyle(color: Colors.black, fontSize: 26.0),
            children: <InlineSpan>[
              TextSpan(
                text: ' find the',
                style: TextStyle(
                  color: Colors.green,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.wavy,
                ),
                recognizer: _longPressRecognizer,
              ),
              TextSpan(
                text: ' different ?',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

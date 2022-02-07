
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelloWorld  extends StatelessWidget{
  const HelloWorld({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcom to Fluuter'),
        ),
        body: const Center(
          child: Text('Hello World!!!')
        )
      )
    );
  }
}
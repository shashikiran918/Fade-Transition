import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: _FadeTransitionExample(),
    );
  }
}

class _FadeTransitionExample extends StatefulWidget {
  _FadeTransitionExampleState createState() => _FadeTransitionExampleState();
}

class _FadeTransitionExampleState extends State<_FadeTransitionExample> with TickerProviderStateMixin {

 late AnimationController _controller;
 late Animation<double> _animation;

  initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 5000),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Woolha.com Flutter Tutorial'),
      ),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Center(
            child: Text('Woolha.com', style: TextStyle(color: Colors.teal, fontSize: 50)),
          ),
        ),
      ),
    );
  }
}
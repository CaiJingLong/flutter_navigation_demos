import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PushHome extends StatefulWidget {
  @override
  _PushHomeState createState() => _PushHomeState();
}

class _PushHomeState extends State<PushHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('现在是根路由了'),
        actions: <Widget>[
          _buildButton(context, "返回首页", () => Navigator.of(context).pushNamedAndRemoveUntil('home', ModalRoute.withName("/")),
              color: Colors.white),
        ],
      ),
      body: Column(
        children: <Widget>[
          _buildButton(context, '去第二页', _buildNavigation(context, "p2")),
        ],
      ),
    );
  }
}

_buildButton(BuildContext context, String text, Function onPressed, {Color color}) {
  return CupertinoButton(
    child: Text(
      text,
      style: TextStyle(color: color),
    ),
    onPressed: onPressed,
  );
}

_buildNavigation(BuildContext context, String name) {
  return () => Navigator.of(context).pushNamed(name);
}

class PushSecondPage extends StatefulWidget {
  @override
  _PushSecondPageState createState() => _PushSecondPageState();
}

class _PushSecondPageState extends State<PushSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二页'),
      ),
      body: Column(
        children: <Widget>[
          _buildButton(context, '去第3页', _buildNavigation(context, 'p3')),
          _buildButton(context, '去第3页,并关闭当前页', () => Navigator.of(context).popAndPushNamed("p3")),
        ],
      ),
    );
  }
}

class PushThirdPage extends StatefulWidget {
  @override
  _PushThirdPageState createState() => _PushThirdPageState();
}

class _PushThirdPageState extends State<PushThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第三页'),
      ),
      body: Column(
        children: <Widget>[
          CupertinoButton(
              child: Text('直接返回首页'), onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil("home", ModalRoute.withName("/"))),
        ],
      ),
    );
  }
}

class PushFourthPage extends StatefulWidget {
  @override
  _PushFourthState createState() => _PushFourthState();
}

class _PushFourthState extends State<PushFourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第四页'),
      ),
      body: Container(),
    );
  }
}

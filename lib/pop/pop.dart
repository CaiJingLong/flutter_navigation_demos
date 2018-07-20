
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _SecondPageState createState() => new _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二个页面'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _buildButton(context, '开启下一个页面', "third"),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  ThirdPage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _ThirdPageState createState() => new _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第三个页面'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _buildButton(context, '去第四个页面', 'fourth'),
            CupertinoButton(
                child: Text('返回第一个页面'),
                onPressed: () {
                  Navigator.of(context).popUntil(ModalRoute.withName("home"));
                }),
          ],
        ),
      ),
    );
  }
}


class FourthPage extends StatefulWidget {
  FourthPage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _FourthPageState createState() => new _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第四个页面'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            CupertinoButton(
                child: Text('返回第二个页面'),
                onPressed: () {
                  Navigator.of(context).popUntil(ModalRoute.withName("second"));
                }),
          ],
        ),
      ),
    );
  }
}


_buildButton(BuildContext context, String text, String routeName) {
  return CupertinoButton(child: Text(text), onPressed: () => Navigator.of(context).pushNamed(routeName));
}

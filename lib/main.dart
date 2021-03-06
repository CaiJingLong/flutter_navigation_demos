import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation_demos/pop/pop.dart';
import 'package:navigation_demos/pushandpop/push_and_pop.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: routes,
      initialRoute: "home",
    );
  }
}

Map<String, WidgetBuilder> routes = {
  "home": (ctx) => MyHomePage(),
  "second": (ctx) => SecondPage(),
  "third": (ctx) => ThirdPage(),
  "fourth": (ctx) => FourthPage(),
  "p1": (ctx) => PushHome(),
  "p2": (ctx) => PushSecondPage(),
  "p3": (ctx) => PushThirdPage(),
  "p4": (ctx) => PushFourthPage(),
};

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一个页面'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _buildButton(context, '开启下一个页面', "second"),
            CupertinoButton(
              child: Text('替换根路由'),
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil("p1", ModalRoute.withName("/")),
            ),
          ],
        ),
      ),
    );
  }
}

_buildButton(BuildContext context, String text, String routeName) {
  return CupertinoButton(child: Text(text), onPressed: () => Navigator.of(context).pushNamed(routeName));
}

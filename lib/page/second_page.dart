//2 、MyHomePage 是一个 StatefulWidget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2021/lifecycle/app_lifecycle_reactor.dart';
import 'package:plugin_hello/plugin_hello.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SecondPageState createState() => _SecondPageState();
}

//3、 _MyHomePageState 是一个 State
class _SecondPageState extends State<SecondPage> {
  int _counter = 0;

  var platformVersion = "";

  @override
  void initState() {
    super.initState();

    PluginHello.platformVersion.then((value) =>
    {
        print('value=$value'),
        updatePlatFormVersion(value)
    });
  }

  void updatePlatFormVersion(version) {
    setState(() {
      platformVersion = version;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'secondPage$platformVersion',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

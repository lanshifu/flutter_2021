//2 、MyHomePage 是一个 StatefulWidget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  var deviceId = "";

  @override
  void initState() {
    super.initState();

    PluginHello.platformVersion
        .then((value) => {print('value=$value'), updatePlatFormVersion(value)});

    PluginHello.deviceId.then((value) => {deviceId = value ?? ''});
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Column(
        children: <Widget>[
          Text(
            'secondPage2 $platformVersion $deviceId',
          ),
          Text('$_counter'),
          Card(
              color: Color(0xffB3FE65),
              elevation: 40,
              margin: EdgeInsets.all(40),
              child: ClipOval(
                child: Container(
                  color: Colors.red,
                  width: 40,
                  height: 40,
                ),
              )),
          DecoratedBox(
            decoration: ShapeDecoration(
                shadows: [
                  const BoxShadow(
                      color: Colors.red,
                      offset: Offset(0, 0),
                      blurRadius: 4,
                      spreadRadius: 2),
                ],
                // image: DecorationImage(
                //     fit: BoxFit.cover,
                //     image: AssetImage(
                //       'assets/images/wy_200x300.webp',
                //     )),
                shape: CircleBorder(
                  side: BorderSide(width: 1.0, color: Colors.white),
                )),
            child: SizedBox(
              height: 72,
              width: 72,
              child: Icon(
                Icons.raw_off,
                color: Colors.green,
                size: 40,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

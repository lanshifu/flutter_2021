//2 、MyHomePage 是一个 StatefulWidget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2021/lifecycle/app_lifecycle_reactor.dart';
import 'package:flutter_2021/page/second_page.dart';
import 'package:plugin_hello/plugin_hello.dart';

class MyHomePage extends StatefulWidget {

  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//3、 _MyHomePageState 是一个 State
class _MyHomePageState extends State<MyHomePage> {

  @override
  initState(){
    super.initState();
    print('initState ');

    WidgetsBinding.instance?.addPostFrameCallback((Duration duration){
      print("FrameCallback 单次Frame绘制回调 $duration"); //只回调一次
    });

    WidgetsBinding.instance?.addPersistentFrameCallback((_){
      print("FrameCallback 实时Frame绘制回调"); //每一帧都回调
    });
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void deactivate(){
    super.deactivate();
    print('deactivate');
  }
  @override
  void dispose(){
    super.dispose();
    print('dispose');
  }


  int _counter = 0;

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
              'text',
            ),Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
            ),
            AppLifecycleReactor(),
            FlatButton(
              child: Text("hello"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    MaterialPageRoute(builder: (context) {

                      return SecondPage(title: 'SecondPage',);
                    }));
              },
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

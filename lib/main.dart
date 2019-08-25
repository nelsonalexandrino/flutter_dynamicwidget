import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<DynamicWidget> listDynamic = [];
  List<String> data = [];

  Icon floatingIcon = new Icon(Icons.add);

  addDynamic() {
    if (data.length != 0) {
      floatingIcon = new Icon(Icons.add);

      data = [];
      listDynamic = [];
      print('if');
    }
    setState(() {});
    if (listDynamic.length >= 5) {
      return;
    }
    listDynamic.add(new DynamicWidget());
  }

  submitData() {
    floatingIcon = new Icon(Icons.arrow_back);
    data = [];
    listDynamic.forEach((widget) => data.add(widget.controller.text));
    setState(() {});
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    Widget result = new Flexible(
      flex: 1,
      child: new Card(
        child: Center(
          child: Text('Apenas testando'),
        ),
      ),
    );

    Widget dynamicTextField = new Flexible(
      flex: 2,
      child: new ListView.builder(
        itemCount: listDynamic.length,
        itemBuilder: (_, index) => listDynamic[index],
      ),
    );

    Widget submitButton = new Container(
      child: new RaisedButton(
        onPressed: submitData,
        child: new Padding(
          padding: new EdgeInsets.all(16.0),
          child: new Text('Submit Data'),
        ),
      ),
    );

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Dynamic App'),
        ),
        body: new Container(
          margin: new EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              data.length == 0 ? dynamicTextField : result,
              data.length == 0 ? submitButton : new Container(),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: addDynamic,
          child: floatingIcon,
        ),
      ),
    );
  }
}

class DynamicWidget extends StatelessWidget {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(8.0),
      child: new TextField(
        controller: controller,
        decoration: new InputDecoration(hintText: 'Enter Data '),
      ),
    );
  }
}

/* import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(
      new MaterialApp(
        home: new Scaffold(
          body: new MainWidget(),
        ),
      ),
    );

class MainWidget extends StatefulWidget {
  @override
  State createState() => new MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  static int testCount = 0;

  List<ItemData> _data = new List();
  Timer timer;

  Future<ItemData> loadData() async {
    testCount++;
    return new ItemData("Testing #$testCount");
  }

  @override
  void initState() {
    super.initState();
    timer = new Timer.periodic(
      new Duration(seconds: 2),
      (Timer timer) async {
        ItemData data = await loadData();
        this.setState(
          () {
            _data = <ItemData>[data];
          },
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return new ListView(
      children: _data.map((item) => new ChildWidget(item)).toList(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}

class ChildWidget extends StatefulWidget {
  ItemData _data;

  ChildWidget(ItemData data) {
    _data = data;
  }

  @override
  State<ChildWidget> createState() => new ChildState();
}

class ChildState extends State<ChildWidget> {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => foo(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        child: new Card(
          child: new Container(
            padding: const EdgeInsets.all(8.0),
            child: new Text(widget._data.title),
          ),
        ),
      ),
    );
  }

  foo() {
    print("Card Tapped: " + widget._data.toString());
  }
}

class ItemData {
  final String title;

  ItemData(this.title);

  @override
  String toString() {
    return 'ItemData{title: $title}';
  }
} */

/*
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  List<DynamicWidget> _items = [];

  void _addDynamic() {
    _items.add(DynamicWidget());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Widget'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return _items[index];
                },
                itemCount: _items.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDynamic,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class DynamicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(labelText: 'Enter Data'),
      ),
    );
  }
}
*/

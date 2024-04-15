import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter providers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String name = 'eng rady';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[
            Consumer<ProvOne>(builder: (context, provone, child) {
              print("consumer text");
              return Text(provone.showsomething);
            },),
            Consumer<ProvOne>(builder: (context, provone, child) {
              print("consumer button");
              return RaisedButton(onPressed: (){
                provone.changeSomething();
              },child:Text("Do Something: " + provone.showsomething));
            },),



          ],
        ),
      ),
    );
  }
}

class Model extends ChangeNotifier {
  String name = 'mhmd rady';
  changeName() {
    name = 'hasan';
    notifyListeners();
  }
}

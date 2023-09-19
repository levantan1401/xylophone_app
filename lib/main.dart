import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Xylophone(),
    );
  }
}

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});
  @override
  State<Xylophone> createState() => XylophoneState();
}

class XylophoneState extends State<Xylophone> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10,),
          soundTile(color: Colors.red, name: "Red", soundNumber: "1"),
          SizedBox(height: 10,),
          soundTile(color: Colors.orange, name: "Orange", soundNumber: "2"),
          SizedBox(height: 10,),
          soundTile(color: Colors.yellow, name: "Yellow", soundNumber: "3"),
          SizedBox(height: 10,),
          soundTile(color: Colors.green, name: "Green", soundNumber: "4"),
          SizedBox(height: 10,),
          soundTile(color: Colors.teal, name: "Teal", soundNumber: "5"),
          SizedBox(height: 10,),
          soundTile(color: Colors.blue, name: "Blue", soundNumber: "6"),
          SizedBox(height: 10,),
          soundTile(color: Colors.purple, name: "Purple", soundNumber: "7"),
        ],
        
      ),
    ));
  }

  Widget soundTile({
    required Color color,
    required String name,
    required String soundNumber,
  }) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    final player = AudioPlayer();

    return Center(
      child: MaterialButton(
        onPressed: () {
          player.play(
            AssetSource("audio/note$soundNumber.wav"),
            volume: 100.0,
          );
        },
        height: _deviceHeight * 0.125,
        minWidth: _deviceWidth,
        color: color,
        child: Text(
          name.toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        
      ),
    );
  }
}

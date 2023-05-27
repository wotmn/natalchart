import 'package:flutter/material.dart';
import 'package:natalchart/BirthChartScreen.dart';
import 'package:sweph/sweph.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final stopwatch = Stopwatch()..start();
  // Only load the assets you need. By default will load none
  // Bundled assets are available in Sweph.bundledEpheAssets
  await Sweph.init(epheAssets: [
    "packages/sweph/assets/ephe/seas_18.se1", // For house calc
    "packages/sweph/assets/ephe/sefstars.txt", // For star name
    "packages/sweph/assets/ephe/seasnam.txt", // For asteriods
  ]);

  runApp(MyApp(
    timeToLoad: stopwatch.elapsed,
  ));
}

class MyApp extends StatelessWidget {

  final Duration timeToLoad;
  const MyApp({Key? key, required this.timeToLoad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doğum Haritası Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BirthChartScreen(timeToLoad: this.timeToLoad,),
    );
  }
}
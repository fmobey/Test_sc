import 'package:flutter/material.dart';
import 'package:raccoonscoter/Extentions/color.dart';
import 'package:raccoonscoter/Extentions/screenSize.dart';
import 'package:flutter_blue/flutter_blue.dart';

FlutterBlue flutterBlue = FlutterBlue.instance;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var arr = []; // array literal constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.kirmizi,
        title: Center(
          child: Text(
            "Raccoon Scooter",
            style: TextStyle(
                color: CustomColors.beyaz,
                fontSize: screenSize(context).height * SizedComponent.title),
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                // Start scanning
                flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
                var subscription = flutterBlue.scanResults.listen((results) {
                  for (ScanResult r in results) {
                    print('${r.device.name} found! rssi: ${r.rssi}');
                    arr.add(r.device.name);
                  }
                });
              },
              child: Text(
                "Qr Scan",
                style: TextStyle(
                    color: CustomColors.siyah,
                    fontSize:
                        screenSize(context).height * SizedComponent.button),
              ),
            ),
            Container(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: arr.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Text("${arr[index]}"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

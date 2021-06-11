import 'package:flutter/material.dart';
import 'package:job/pages/crop/crop_view.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return  MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          child: child,
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
        );
      },
      title: 'Technical Test',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      home: CropView(title: 'crop view',),
    );
  }
}

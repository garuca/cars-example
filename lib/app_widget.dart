import 'package:cars/features/car/list/presenter/feed_page.dart';
import 'package:flutter/material.dart';

import 'app_module.dart';


class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    startModule();
  }

  @override
  void dispose() {
    super.dispose();
    disposeModule();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        fontFamily: 'CircularStd',
        primarySwatch: Colors.blue,
      ),
      home: FeedPage()
    );
  }
}
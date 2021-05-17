import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription _sub;
  Uri? _uri;
  @override
  void initState() {
    super.initState();
    _handleIncomingLinks();
    handleUri();
  }

  void handleUri() async {
    try {
      final initialUri = await getInitialUri();
      _uri = initialUri;
      if (_uri != null) {
        setState(() {});
      }
    } on FormatException {
     
    }
  }

  void _handleIncomingLinks() {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (!mounted) return;
      _uri = uri;
      setState(() {});
    }, onError: (Object err) {
      if (!mounted) return;
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(_uri?.queryParameters.toString() ?? "Empty"),
        ),
      ),
    );
  }
}

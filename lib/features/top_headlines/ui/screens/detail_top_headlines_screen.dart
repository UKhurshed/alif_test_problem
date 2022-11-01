import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TopHeadlinesUrlToWebScreen extends StatefulWidget {
  const TopHeadlinesUrlToWebScreen({Key? key, required this.urlToWeb})
      : super(key: key);
  final String urlToWeb;

  @override
  State<TopHeadlinesUrlToWebScreen> createState() =>
      _TopHeadlinesUrlToWebScreenState();
}

class _TopHeadlinesUrlToWebScreenState
    extends State<TopHeadlinesUrlToWebScreen> {
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(initialUrl: widget.urlToWeb),
      ),
    );
  }
}

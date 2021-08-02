import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  WebViewController _webViewController;
  String filePath = 'files/test.html';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: WebView(
        initialUrl: "https://www.youtube.com/watch?v=UIdC8OucYc0&list=PL7SysI7AlpsKZNiIFANt_2fQOiZr-KTOy",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          _loadHtmlFromAssets();

        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     _webViewController.evaluateJavascript('add(10 , 10)');
      //   },
      // ),
    );
  }

  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
      mimeType: 'video/html' , encoding: Encoding.getByName('utf-8')).toString());
  }
}
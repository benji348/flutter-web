import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_in_flutter/src/menu.dart';
import 'package:webview_in_flutter/src/navigations_controls.dart';
import 'package:webview_in_flutter/src/web_view_stack.dart';


void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WebView In Flutter",
      home: WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  final controller = Completer<WebViewController>();
  final Color bottAppBarColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: bottAppBarColor,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            NavigationControls(controller: controller),
            Menu(controller: controller)
          ]),
        ),
        body: WebViewStack(
          controller: controller,
        ),
      ),
    );
  }
}

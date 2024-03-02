import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String articleUrl; // Use consistent naming conventions

  const ArticleView({Key? key, required this.articleUrl}) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  bool _isLoading = true; // Initialize as loading
  late WebViewController _webViewController; // Use 'late' instead of a Completer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: Text(
          "Details",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Stack(
        children: [
          //to add web view widget here
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(
                color: Colors.black54,
                backgroundColor: Colors.white54,
                strokeWidth: 1.5,
              ),
            ),
        ],
      ),
    );
  }
}

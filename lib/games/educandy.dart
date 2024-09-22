import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.educandy.com/site/resource.php?quizID=1010559'));
    // Initialize the WebView controller.
    // _controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..loadRequest(Uri.parse(
    //       'https://www.educandy.com/site/resource_embedded.php?activity-code=12ac75')); // Load a URL.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('play games'),
      ),
      body:
      WebViewWidget(controller: _controller,
      ),
      // Container(
      //   height: 200,
      //   width: 200,
      //   child: WebViewWidget(
      //       controller: _controller),
      // ), // Display the WebView.
    );
  }
}
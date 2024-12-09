import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScaffold extends HookWidget {
  const WebViewScaffold({required this.webViewController, required this.url, this.title, super.key});

  final WebViewController webViewController;
  final String url;
  final String? title;

  @override
  Widget build(BuildContext context) {
    Future<bool> backInterceptor(bool stopDefaultButtonEvent, RouteInfo info) async {
      if (await webViewController.canGoBack()) {
        webViewController.goBack();
        return true;
      }
      return false;
    }

    useEffect(() {
      BackButtonInterceptor.add(backInterceptor);
      webViewController
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {
              // controller.runJavaScript(
              //   "document.getElementsByTagName('nav')[0].style.display='none';",
              // );
              webViewController
                  .runJavaScript("javascript:(function() {"
                      " var head = document.getElementsByTagName('nav')[0];"
                      "head.parentNode.removeChild(head);"
                      "})()")
                  .then((value) => debugPrint('Page finished loading Javascript'))
                  .catchError((onError) => debugPrint('$onError'));
            },
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
        ..loadRequest(Uri.parse(url));
      return () {};
    });
    return Scaffold(
      appBar: title != null ? AppBar(title: Text(title!)) : null,
      body: Stack(
        children: [
          WebViewWidget(controller: webViewController),
        ],
      ),
    );
  }
}

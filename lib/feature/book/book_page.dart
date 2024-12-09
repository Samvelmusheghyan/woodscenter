import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/common/hooks/web_view_controller.dart';
import '../../core/ui/widgets/web_view_scaffold.dart';

class BookPage extends HookWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = useWebViewController();

    return  WebViewScaffold(
      webViewController: webViewController,
      url: 'https://woodscenter.am/en/properties',
      title: 'Book',
    );
  }
}

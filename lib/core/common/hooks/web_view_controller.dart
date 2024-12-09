import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webview_flutter/webview_flutter.dart';

WebViewController useWebViewController() {
  return use(
    const _WebViewControllerHook(),
  );
}

class _WebViewControllerHook extends Hook<WebViewController> {
  const _WebViewControllerHook();


  @override
  HookState<WebViewController, Hook<WebViewController>> createState() =>
      _WebViewControllerHookState();
}

class _WebViewControllerHookState extends HookState<WebViewController, _WebViewControllerHook> {
  late final controller = WebViewController.fromPlatformCreationParams(const PlatformWebViewControllerCreationParams());

  @override
  WebViewController build(BuildContext context) => controller;

  @override
  String get debugLabel => 'useWebViewController';
}

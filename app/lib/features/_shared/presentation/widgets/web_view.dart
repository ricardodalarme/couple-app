import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class const WebView({required final String url, super.key}) extends StatefulWidget {
  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState() extends State<WebView> {
  final _controller = WebViewController();

  @override
  void didChangeDependencies() {
    _controller.loadRequest(Uri.parse(widget.url));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}

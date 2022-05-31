//<input type="file" accept="image/*" capture></input>
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';


// Add permissions, procider in manifest, and all this code


class VideoCall extends StatefulWidget {
  const VideoCall({Key? key}) : super(key: key);

  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {

 // final Completer<WebViewController> _controller = Completer<WebViewController>();
WebViewController? controller;
InAppWebViewController? webView;
InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
      clearCache: true,
      javaScriptCanOpenWindowsAutomatically: true,
      javaScriptEnabled: true,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
      safeBrowsingEnabled: true,
      supportMultipleWindows: true,
      allowContentAccess: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
);

  void initState() {
    super.initState();
    //if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: InAppWebView(

            initialFile:'assets/videocalling/video.html',
              initialOptions: options,
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },
              androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
                return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
              }

            ),
          )
        ),
      );

  }

  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('assets/videocalling/video.html');
    controller?.loadUrl( Uri.dataFromString(
        fileText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString());
  }
}

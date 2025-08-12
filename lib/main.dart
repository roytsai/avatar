// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_linux_webview/flutter_linux_webview.dart';
import 'package:webview_flutter/webview_flutter.dart';

// 匯入獨立的 WebViewPage 檔案
import 'avatar_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化 Linux WebView 插件，並禁用 GPU 以避免驅動程式問題
  LinuxWebViewPlugin.initialize(options: {
    'user-agent': 'Flutter Linux WebView',
    'remote-debugging-port': '8888',
    'autoplay-policy': 'no-user-gesture-required',
    'disable-gpu': '',
    'disable-gpu-sandbox': '',
  });

  // 設定 WebView 平台為 Linux
  WebView.platform = LinuxWebView();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Linux WebView Demo',
      // 應用程式的起始頁面
      home: LandingPage(),
    );
  }
}

// 包含按鈕的起始頁面
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 點擊按鈕後導航到 WebViewPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AvatarPage()),
            );
          },
          child: const Text('打開 AvatarView 頁面'),
        ),
      ),
    );
  }
}